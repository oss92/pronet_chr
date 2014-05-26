% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/2,speed/2,volume/2,density/2,power_supply/1,traffic_light/2, traffic_light/4, street_light/1.

densityCalculation           @ volume(Street, AADT), speed(Street, Speed) <=> Density is AADT/Speed, density(Street, Density).
speedOfRoad                  @ speed(Street, Speed) \ soi(Z, N) <=> Street == Z, N > 100 | M is N + Speed, soi(Street, M).