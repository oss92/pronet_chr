% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/2,soi/3.

flagRemoval @ soi(Street, N, Flag) \ soi(Street, N, Flag) <=> Flag == True | soi(Street, N).
