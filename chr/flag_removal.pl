% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/4,soi/5.

flagRemoval @ soi(Street,_,_,N,Flag) \ soi(Street,_,_,N,Flag) <=> Flag == true | soi(Street,_,_,N).
