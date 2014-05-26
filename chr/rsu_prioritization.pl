% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/2,speed/2,volume/2,density/2,power_supply/1,traffic_light/2, traffic_light/4, street_light/1.

densityCalculation           @ volume(Street, AADT), speed(Street, Speed) <=> Density is AADT/Speed, density(Street, Density).
trafficInJunction_2roads     @ traffic_light(Street1, Street2) \ soi(S1, N1), soi(S2, N2) <=>
                             Street1 == S1, Street2 == S2 | M1 is N1 + 1, M2 is N2 + 1, soi(Street1, M1), soi(Street2, M2).
streetLightsAvailability     @ street_light(Street) <=> power_supply(Street)
removeDuplicatePower         @ power_supply(Street1), power_supply(Street2) \ power_supply(Street2) <=> Street1 == Street2 | true.
powerInfrastructure          @ power_supply(Street) \ soi(Z, N) <=> Street == Z, N == 0 | M is N+100, soi(Street, M).
speedOfRoad                  @ speed(Street, Speed) \ soi(Z, N) <=> Street == Z, N > 100 | M is N + Speed, soi(Street, M).
zeroPriorityRemoval          @ soi(Z,N) \ soi(Y,M) <=> Y == Z, N == M, M == 0 | true.
