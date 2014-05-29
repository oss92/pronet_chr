% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/4,comm_infra/1,soi/5.

communicationsInfrastructure @ comm_infra(Street) \ soi(Street,_,_,N) <=> M is N+100, soi(Street,_,_,M,true).
