
dT = 2.0;

ppm_now = 410;
air_frac = 0.5;
CS = 3;   % Degrees per doubling
WperD  = 3.8; % W/m2 per doubling
emission_rate = 36; % GtCO2/yr
pCO2_initial = 280;

lambda = CS/WperD; % Climate sensitivity parameter, K/(Wm^-2)
dF = dT/lambda  % 

pCO2_final = exp(dF/3.8*log(2)) * pCO2_initial

ppm_left = pCO2_final - ppm_now

budget = ppm_left/air_frac * 7.6

years = budget/emission_rate

exp( log(2) * dT / ( WperD * lambda ) ) * pCO2_initial

%%

% pCO2_final = 486;
% 
% dT = CS/WperD * WperD * log(pCO2_final/pCO2_initial) / log(2)