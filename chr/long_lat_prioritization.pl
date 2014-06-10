% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/4, soi/5, rsu_range/2, distance/6.

%soi(Street, Long, Lat, Priority) - rsu_range(Radius, OverlapPercentage) - distance(Long1, Lat1, Long2, Lat2, Distance, Flag)

distanceBetweenGener         @ rsu_range(Range, Percentage),soi(Street1, Long1, Lat1, Priority1), soi(Street2, Long2, Lat2, Priority2) ==>
                             Street1 == Street2, longlat(Long1, Lat1, Long2, Lat2, Distance),
                             Distance >= ((100-(Percentage/2))*(Range/100)), Distance =< Range |
                             soi(Street1, Long1, Lat1, Priority1, false), soi(Street2, Long2, Lat2, Priority2, false),
                             distance(Long1, Lat1, Long2, Lat2, Distance, false).

distanceBetween              @ soi(Street1, Long1, Lat1, Priority1, false), soi(Street2, Long2, Lat2, Priority2, false) \
                             soi(Street1, Long1, Lat1, Priority1, false), soi(Street2, Long2, Lat2, Priority2, false),
                             distance(Long1, Lat1, Long2, Lat2, Distance, false)  <=>
                             Street1 == Street2 |
                             distance(Long1, Lat1, Long2, Lat2, Distance, true),
                             P1 is Priority1 + Distance,
                             P2 is Priority2 + Distance,
                             soi(Street1, Long1, Lat1, P1, true),
                             soi(Street2, Long2, Lat2, P2, true).
                             
longlat(Long1, Lat1, Long2, Lat2, Distance):-
                             Long1Rad is Long1 * (22/1260),
                             Long2Rad is Long2 * (22/1260),
                             Lat1Rad is Lat1 * (22/1260),
                             Lat2Rad is Lat2 * (22/1260),
                             Dlong is Long2Rad - Long1Rad,
                             Dlat is Lat2Rad - Lat1Rad,
                             Sin1 is (sin(Dlat/2)) * (sin(Dlat/2)),
                             Sin2 is cos(Lat1Rad) * cos(Lat2Rad) * ((sin(Dlong/2))*(sin(Dlong/2))),
                             A is Sin1 + Sin2,
                             C is 2 * atan2(sqrt(A), sqrt(1-A)),
                             Distance is 6353000.0 * C.