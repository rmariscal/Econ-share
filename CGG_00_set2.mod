//*************************************************************************
// Replicate: 
// (CGG, QJE 2000)
//-------------------------------------------------------------------------

// Model: CGG_2000

// References:
// Clarida, R., J. Galí, and M. Gertler. 2000. "Monetary Policy Rules and Macroeconomic Stability: Evidence and Some Theory."
// Quarterly Journal of Economics, February 2000, pp. 147-180.

// Last edited: 12/20/14 by R. Mariscal (rmariscalparedes@imf.org)

// This file replicates the Section IV. Interest Rate Rules and Economic Fluctuations

//*************************************************************************

// Endogenous Variables
var pi y z r g rstar rr x;

// Exogenous Variables
varexo ep_z ep_g;

// Parameters
parameters delta lambda sigma beta gamma rho rho_e rho_g;

delta = 0.99;
lambda = 0.3;
sigma = 1.0;
rho_e = 0.9;
rho_g = 0.9;

beta = 1.5;
//gamma = 0.93;
gamma = 0.93/4;
rho = 0.79;

// Baseline Model (p. 169)
model(linear);
pi = delta * pi(+1) + lambda * x;
y = y(+1) - ( 1 / sigma ) * ( r - pi(+1) ) + g;
rstar = beta * pi(+1) + gamma * x;
r = rho * r(-1) + ( 1 - rho ) * rstar;
x = y - z;
rr = r - pi;
z = rho_e * z(-1) - ep_z;       // Negative Supply Shock
g = rho_g * g(-1) - ep_g;       // Negative Demand Shock
end;

// Steady State (Initial Values)
initval;
pi = 0;
y = 0;
z = 0;
r = 0;
rr = 0;
g = 0;
rstar = 0;
x = 0;
end;

steady;
check;

shocks;
var ep_z; stderr 1;
//var ep_z; stderr 0.5;
var ep_g; stderr 1;
//corr ep_z, ep_g = 0.0;
end;

stoch_simul(ar=5, irf = 50, periods=2100, drop=100, nograph);
