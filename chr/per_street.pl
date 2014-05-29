% Author: Mohamed Osama
% Date: 4/24/2014

:- use_module(library(chr)).

:-chr_constraint rsu_radius/1, street/2, per_street/2.

howManyRSUsInStreet @ rsu_radius(Number) \ street(Name, Length) <=> Diameter is Number * 2,
                                                                    PerStreet is Length // Diameter,
                                                                    per_street(Name, PerStreet).
