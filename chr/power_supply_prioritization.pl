% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/2,comm_infra/1,speed/2,volume/2,density/2,power_supply/1,traffic_light/2, traffic_light/4, street_light/1.

% Add list of streets with traffic lights as traffic_light(Street1, Street2) and
% Add list of streets with street lights as street_light(Street) and
% Add list of streets with known power availability as power_supply(Street) and
% SoIs in the form soi(StreetName, Long, Lat, Priority)

trafficInJunction_2roads     @ traffic_light(Street1, Street2) \ soi(S1,Long,Lat, N1), soi(S2,Long,Lat, N2) <=>
                             Street1 == S1, Street2 == S2 | M1 is N1 + 1, M2 is N2 + 1, soi(Street1,Long,Lat, M1, true), soi(Street2,Long,Lat, M2, true).
streetLightsAvailability     @ street_light(Street) <=> power_supply(Street)
removeDuplicatePower         @ power_supply(Street1), power_supply(Street2) \ power_supply(Street2) <=> Street1 == Street2 | true.
powerInfrastructure          @ power_supply(Street) \ soi(Z,Long,Lat, N, true) <=> Street == Z | M is N+100, soi(Street,Long,Lat, M, true, true).
