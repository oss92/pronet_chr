% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/4.

zeroPriorityRemoval          @ soi(Street,_,_,N) \ soi(Street,_,_,M) <=> N == M, M == 0 | true.
