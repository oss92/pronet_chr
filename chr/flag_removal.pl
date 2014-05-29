% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/4,soi/5.

flagRemoval @ soi(Street,Long,Lat,N,Flag) \ soi(Street,Long,Lat,N,Flag) <=> Flag == true | soi(Street,Long,Lat,N).
flagRemoval @ soi(Street,Long,Lat,N,Flag1,Flag2,Flag3) \ soi(Street,Long,Lat,N,Flag1,Flag2,Flag3) <=> Flag == true | soi(Street,Long,Lat,N).
