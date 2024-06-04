%% X Foil Simulations Plotter

function [plots] = xfoilsimplot(airfoil_file,simulation_type)

% Importing the airfoil coordinate file
% Saving Bodyname
fid = fopen(airfoil_file);
xycell = textscan(fid, '%f %f','headerlines', 1); % Skipping titles and text
xy=cell2mat(xycell); % 
fclose(fid);
bodyname=textread(airfoil_file,'%s',1,'delimiter','\n');

% Dissecting imported file into separate coordinates
x = xy(:,1);
y = xy(:,2);

p1 = [1,5,9];

machnum = input("Mach number: ");
% sorting mach number between 0 (1) and 0.012 (2)
if machnum == 0
    p2 = "1";
elseif machnum == 0.012
    p2 = "2";
end

renum = input("Re number:");
% converting inputted re number to a multiple of x10^4
p3 = string(renum/10000)

for j = 1:3

    name ="n"+p1(j)+"m"+p2+"r"+p3+".dat";
    msg = " Mach = " + machnum + " Re = " + renum;
    path1 = "mach " + string(machnum);
    path2 = "re = " + p3 + " x 10^4";
    datafile = "./" +path1 + "/" + path2 + "/" + name;

    fid = fopen(datafile);
    xycell = textscan(fid, '%f %f %f %f %f %f %f','headerlines', 12); % Skipping titles and text 
    data=cell2mat(xycell);
    fclose(fid);

    if simulation_type == "pacc"
        alpha{j} = data(:,1);
        cl{j} = data(:,2);
        cd{j} = data(:,3);
        cm{j} = data(:,5);
        em{j} = cl{j}./cd{j};
    end

end

%% Plots

% 2-D Simple airfoil plot
panel_plot = plot(x,y);
ylim([-1 1])
xlim([-0.1 1.1])
pbaspect([max(x) max(y)+1 1])
title(bodyname)
xlabel("X")
ylabel("Y")
grid on 

% CL vs alpha plot
figure()
cl_plot = plot(alpha{1},cl{1});
hold on
cl_plot = plot(alpha{2},cl{2});
cl_plot = plot(alpha{3},cl{3});
title(bodyname)
subtitle(msg)
xlabel("alpha (º)")
ylabel("Coefficient of Lift")
title("Cl vs. Alpha")
grid on 
legend(["N = 1", "N = 5","N = 9"])

figure()
clcd_plot = plot(cd{1},cl{1});
hold on
clcd_plot = plot(cd{2},cl{2});
clcd_plot = plot(cd{3},cl{3});
title(bodyname)
subtitle(msg)
xlabel("Coefficient of Drag")
ylabel("Coefficient of Lift")
title("Cl vs. Cd")
legend(["N = 1", "N = 5","N = 9"])
grid on 

figure()
em_plot = plot(alpha{1},em{1});
hold on
em_plot = plot(alpha{2},em{2});
em_plot = plot(alpha{3},em{3});
title(bodyname)
subtitle(msg)
xlabel("Alpha")
ylabel("Coefficient of Lift")
title("Cl/Cd vs. Alpha")
legend(["N = 1", "N = 5","N = 9"])
grid on 

figure()
cm_plot = plot(alpha{1},cm{1});
hold on
cm_plot = plot(alpha{2},cm{2});
cm_plot = plot(alpha{3},cm{3});
title(bodyname)
subtitle(msg)
xlabel("Alpha")
ylabel("Moment Coefficient")
title("Moment Coefficient vs. Alpha")
legend(["N = 1", "N = 5","N = 9"])
grid on 

% plots = [panel_plot, cl_plot, clcd_plot, em_plot, cm_plot];

end
