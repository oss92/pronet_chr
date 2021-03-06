% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/4,soi/5, soi/6, soi/7.

% Removes flags added by the prioritization processes
% Add output of each step to be cleaned up

flagRemoval  @ soi(Street,Long,Lat,N,Flag) ==> soi(Street,Long,Lat,N).
flagRemoval2 @ soi(Street,Long,Lat,N,Flag1,Flag2) ==> soi(Street,Long,Lat,N).
flagRemoval3 @ soi(Street,Long,Lat,N,Flag1,Flag2,Flag3) ==> soi(Street,Long,Lat,N).
