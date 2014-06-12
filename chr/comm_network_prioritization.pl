% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/4,comm_infra/1,soi/5.

% Add list of streets with communications infrastructure as comm_infra(StreetName) along with
% SoIs in the form soi(StreetName, Long, Lat, Priority), if communication networks prioritization is
% the first step then Priority = 0 except if rather specified

communicationsInfrastructure @ comm_infra(Street) \ soi(Street,Long,Lat,N) <=> M is N+100, soi(Street,Long,Lat,M,true).
