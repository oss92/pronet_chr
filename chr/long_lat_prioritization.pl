% Author: Mohamed Osama
% Date: 4/20/2014

:- use_module(library(chr)).

:-chr_constraint soi/4, rsu_range/2, distance/6.

%soi(Street, Long, Lat, Priority) - rsu_range(Radius, OverlapPercentage) - distance(Long1, Lat1, Long2, Lat2, Distance, Flag)
% if same street calculate distance between them if less than sth then save

distanceBetweenGener         @ soi(Street1, Long1, Lat1, Priority1), soi(Street2, Long2, Lat2, Priority2) ==>
                             Street1 == Street2 | distance(Long1, Lat1, Long2, Lat2, _, false).

distanceBetween              @ rsu_range(Range, Percentage), soi(Street1, Long1, Lat1, Priority1), soi(Street2, Long2, Lat2, Priority2), distance(Long1, Lat1, Long2, Lat2, _, false) \
                             soi(Street1, Long1, Lat1, Priority1), soi(Street2, Long2, Lat2, Priority2), distance(Long1, Lat1, Long2, Lat2, _, false)  <=>
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
                             Distance is 6373.0 * C,
                             Distance =< Range,
                             Distance >= ((100-(Percentage/2))*(Range/100)) | distance(Long1, Lat1, Long2, Lat2, Distance, true),
                             soi(Street1, Long1, Lat1, Priority1 + Distance),
                             soi(Street2, Long2, Lat2, Priority2 + Distance).