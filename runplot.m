%% Mach = 0

% Re = 10^4
plots = xfoilsimplot("naca651412.dat", "n1m0r4.dat","pacc")
plots = xfoilsimplot("naca651412.dat", "n5m0r4.dat","pacc")
plots = xfoilsimplot("naca651412.dat", "n0m0r4.dat","pacc")


% Re = 10^5
plots = xfoilsimplot("naca651412.dat", "n1m0r5.dat","pacc")
plots = xfoilsimplot("naca651412.dat", "n5m0r5.dat","pacc")
plots = xfoilsimplot("naca651412.dat", "n9m0r5.dat","pacc")

%% Mach  = 0.012

% Re = 10^4
plots = xfoilsimplot("naca651412.dat", "n1m0012r4.dat","pacc")
plots = xfoilsimplot("naca651412.dat", "n5m0012r4.dat","pacc")
plots = xfoilsimplot("naca651412.dat", "n9m0012r4.dat","pacc")


% Re = 10^5
plots = xfoilsimplot("naca651412.dat", "n1m0012r5.dat","pacc")
plots = xfoilsimplot("naca651412.dat", "n5m0012r5.dat","pacc")
plots = xfoilsimplot("naca651412.dat", "n9m0012r5.dat","pacc")