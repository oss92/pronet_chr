% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/4,soi/5,soi/6,soi/7,speed/2,volume/2,density/2, aadt/2.

densityCalculation           @ volume(Street, Volume), speed(Street, Speed) ==> Density is Volume/Speed, density(Street, Density).
speedOfRoad                  @ speed(Street, Speed) \ soi(Street,Long,Lat,N) <=> M is N + Speed, soi(Street,Long,Lat,M, true).
densityOfRoad                @ density(Street, Density) \ soi(Street,Long,Lat,N, true) <=> M is N + Density, soi(Street,Long,Lat, M, true, true).
aadtOfRoad                   @ aadt(Street, AADT) \ soi(Street,Long,Lat,N, true, true) <=> M is N + AADT, soi(Street,Long,Lat, M, true, true,true).