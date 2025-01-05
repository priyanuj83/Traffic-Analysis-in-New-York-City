-- Data Analysis and Findings ---
/*
1. Peak Traffic Volume Analysis
Objective - Identifying the busiest times and locations with the highest traffic volume.
*/
select 
	date_of_record,
	time_of_record,
	sum(vol) as total_traffic
from traffic_volume_count
group by 1,2
order by 3 desc
Limit 10;

-- Inference - 
--> Most of the highest traffic volumes occur at 5:00 PM, indicating that the evening rush hour significantly contributes to congestion. 
--> The top traffic volumes occur from 29th April 2008 to 1st May 2008, with the rush starting from 4:00 PM with traffic volume around 9500 then increasing to more than 10000 by 5:00 PM.
--> Record 9 also states that at 7:00 AM, the traffic volume is 9592 vehicles, which is lower than the evening rush from 4:00 PM to 5:00 PM but, still we can notice the morning rush hour.

/*
2. Borough-Wise Traffic Comparison
Objective - Comparing the total traffic volumes across the five NYC boroughs.
*/
select 
	boro,
	sum(vol) as total_traffic
from traffic_volume_count
group by 1
order by 2 desc;

-- Inference -
--> Queens has the highest traffic, with 35,216,480 vehicles, the highest among all the boroughs.
--> With Brooklyn (29,825,656 vehicles) and Manhattan (27,320,522 vehicles) being second and third respectively. Both have almost comparable traffic volumes
--> Traffic in the Bronx (22,486,379 vehicles) is lower than in Queens, Brooklyn, and Manhattan.
--> Staten Island has the lowest traffic volume, with 6,273,903 vehicles. This is significantly lower than other boroughs. 

/* 
3. Hourly Traffic Patterns
Objective: Analyzing hourly trends to identify rush hours.
*/
select
	time_of_record,
	avg(vol) as Avg_traffic
from traffic_volume_count
group by 1
order by 2 desc;

-- Inference -
--> The highest average traffic volume occurs at 5:00 PM (197.381) confirming that the evening rush hour is the most congested period.
--> Traffic volume remains relatively high during the afternoon hours (2:00 PM - 4:45 PM), potentially due to school pickups, deliveries, or early commuters heading home.
--> Till 9:00 PM the traffic volume is on the higher side as people might be returning home from work.

--> Morning Peak (6:00 AM - 9:00 AM): There is a noticeable increase in traffic volume during the morning hours, indicating a typical workday morning rush.
--> However, the morning rush hour has slightly lower traffic compared to the evening peak, which is consistent with most urban traffic patterns.

--> Low Traffic (10:00 AM - 12:45 PM): Traffic volume dips significantly after the morning rush hour, as people settle into work, school, or other daily activities.
--> This suggests that midday is the least congested period and an ideal time for activities like road maintenance or logistics.

--> Lowest Traffic (2:00 AM - 4:30 AM): Traffic volumes are minimal during these hours, indicating negligible activity during late-night and early-morning hours.
--> This is consistent with low vehicle movement for most cities during these times.

/*
4. Direction-Based Traffic Analysis
Objective: Analyze traffic volume by direction to determine imbalances or bottlenecks.
*/
select
	direction,
	sum(vol) as total_traffic
from traffic_volume_count
group by 1
order by 2 desc;

-- Inference -
--> Southbound (SB) has the highest total traffic volume (34,819,480), followed closely by Northbound (NB) (32,500,632).
--> This suggests significant traffic flow in the north-south axis, possibly due to major highways or thoroughfares oriented in these directions.

--> Westbound (WB) and Eastbound (EB) show comparatively lower total traffic volumes (27,939,305 and 25,341,427, respectively).
--> This could indicate fewer major routes or lower demand for travel in the east-west directions compared to north-south.

--> EW (East-West combined) and NS (North-South combined) have very low total traffic volumes (506,511 and 15,585, respectively).
--> This likely represents errors in direction classification or rare cases of combined directional data not representative of typical traffic patterns.

--> The imbalance in traffic volumes between directions (e.g., higher southbound traffic compared to eastbound) could highlight potential bottlenecks or capacity constraints.
--> For example, southbound routes may experience congestion due to higher demand or insufficient infrastructure compared to east-west routes.

/*
5. Street-Wise Congestion Hotspots
Objective: Identify streets with the highest traffic volumes.
*/
select
	street,
	sum(vol) as total_traffic
from traffic_volume_count
group by 1
order by 2 desc
limit 10;

-- Inference - 
--> The Belt Parkway records the highest traffic volume (2,596,964), suggesting it is a major arterial road that likely connects critical points in the city.
--> This makes it a prime focus for infrastructure improvements or congestion management initiatives.

--> Broadway is the second-highest with 2,295,775, followed closely by Hamilton Avenue Bridge and Flatbush Avenue. This highlights these streets/bridges as significant traffic conduits, possibly connecting dense commercial or residential areas.
--> These areas could benefit from further study for public transit improvements or traffic flow optimizations.

--> Several bridges, including the Hamilton Avenue Bridge, Brooklyn Bridge, Hook Creek Bridge, and Alexander Hamilton Bridge, appear in the top 10. This reflects the heavy reliance on these crossings for inter-borough traffic or commutes.
--> Expressways such as the New England Thruway and Major Deegan Expressway are in the top 10, indicating their importance for long-distance or intercity travel. Congestion on these routes may impact regional mobility.

--> Streets and bridges in the top 10 are likely experiencing persistent congestion, indicating a need for infrastructure upgrades, better traffic management systems, or alternative routes to redistribute traffic flow.

/*
6. Analyzing congested intersection.
*/
select 
	fromSt,
	toSt,
	sum(vol) as intersection_traffic
from traffic_volume_count
group by 1,2
order by 3 desc
limit 10;

-- Inference - 
-- 1. Frequent Appearance of Dead Ends:
--> The high traffic volumes associated with "Dead End" intersections, such as "Dead End" → "Dead end" (10,194,393) and "Dead End" → "Harlem River Shoreline" (2,260,627), suggest these locations are possibly miscategorized, leading to misleading data aggregation.
--> Alternatively, these might be significant turning points, termini, or areas where vehicles stop or queue (e.g., parking lots or industrial areas).

-- 2. "BOROUGH BOUNDARY" and "BODY OF WATER":
--> The "BOROUGH BOUNDARY" → "BODY OF WATER" intersection records 3,254,033, which could indicate traffic near bridges or ferries where borough boundaries and water intersect.
--> This highlights areas where infrastructure like ferries, bridges, or tunnels might create bottlenecks. 

-- 3. "Connector" and "Dead End" Intersections:
--> Intersections involving "Connector" and "Dead End" (e.g., "CONNECTOR" → "DEAD END" with 2,938,131) could point to transitional roads or access points leading to key facilities, highways, or cul-de-sacs.

-- 4. High Traffic Along Shorelines:
--> Intersections like "Hook Creek Shoreline" → "Dead end" (1,934,149) and "Gowanus Creek Shoreline" → "Dead end" (1,219,892) indicate significant traffic along water-adjacent routes, potentially highlighting port areas, recreational zones, or routes limited by natural barriers.

-- 5. Specific Routes Like "BRUCKNER EXWY" and "Cross Island Parkway":
--> "BRUCKNER EXWY" → "BODY OF WATER" (1,891,138) and "Cross Island Parkway" → "Dead end" (1,374,715) suggest key highway intersections experiencing significant congestion. These areas might benefit from studies of merging traffic or bottleneck alleviation strategies.