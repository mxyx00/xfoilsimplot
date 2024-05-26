%% X Foil Simulations Plotter

function [plots] = xfoilsimplot(airfoil_file, data_file,simulation_type)


% Importing the airfoil coordinate file
% Saving Bodyname
fid = fopen(airfoil_file);
xycell = textscan(fid, '%f %f','headerlines', 1); % Skipping titles and text
xy=cell2mat(xycell) % 
fclose(fid);
bodyname=textread(airfoil_file,'%s',1,'delimiter','\n');

% Dissecting imported file into separate coordinates
x = xy(:,1);
y = xy(:,2);

% Importing the X-foil simulations file
fid = fopen(data_file);
xycell = textscan(fid, '%f %f %f %f %f %f %f','headerlines', 12) % Skipping titles and text 
data=cell2mat(xycell)
fclose(fid);

% Classifying Columns based on simulation type
if simulation_type == "pacc"
    alpha = data(:,1);
    cl = data(:,2);
    cd = data(:,3);
    cp = data(:,4);
    cm = data(:,5)
    em = cl./cd;
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
cl_plot = plot(alpha,cl);
title(bodyname)
xlabel("alpha (º)")
ylabel("Coefficient of Lift")
title("Cl vs. Alpha")
grid on 


figure()
clcd_plot = plot(cd,cl);
title(bodyname)
xlabel("Coefficient of Drag")
ylabel("Coefficient of Lift")
title("Cl vs. Cd")
grid on 

figure()
em_plot = plot(alpha,em);
title(bodyname)
xlabel("Alpha")
ylabel("Coefficient of Lift")
title("Cl/Cd vs. Alpha")
grid on 

figure()
cm_plot = plot(alpha,cm);
title(bodyname)
xlabel("Alpha")
ylabel("Moment Coefficient")
title("Moment Coefficient vs. Alpha")
grid on 

plots = [panel_plot, cl_plot, clcd_plot, em_plot, cm_plot];

end