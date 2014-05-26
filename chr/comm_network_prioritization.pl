% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/2,comm_infra/1,soi/3.

communicationsInfrastructure @ comm_infra(Street) \ soi(Z, N) <=> Street == Z| M is N+100, soi(Street, M, True).
