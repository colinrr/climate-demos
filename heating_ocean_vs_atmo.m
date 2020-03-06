
dTw = 1; % Water temperature change - 0.2 deg/decade, 1 deg total?
D   = 150; % Water column depth
delF = 1; % Forcing in W/m^2

Cpa = 1004;
Cpw = 4184; % J/kg/K

Pa = 100000; % Pa = N/m^2
g = 9.81;
rho_w = 1000;


Ma = Pa/g; % Mass of column of air
Mw = D*rho_w;


E = Cpw*dTw*D*rho_w;

t_ocean = E/(1*60*60*24*365) % Heating rate for ocean layer

dTa = E/Ma/Cpa % Equivalent change to atmo temp