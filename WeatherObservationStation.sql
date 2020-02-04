/* 
1. Query a list of CITY and STATE from the STATION table.
*/
select city, state 
from station;

/*
3. Query a list of CITY names from STATION with even ID numbers only. 
You may print the results in any order, but must exclude duplicates from your answer.
*/
select distinct city 
from station 
where mod(ID, 2) = 0;

/*
4. Let  be the number of CITY entries in STATION, and let  be the number of distinct CITY names in STATION; query the value of  from STATION. 
In other words, find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
*/
select count(city) - count(distinct city)
from station;

/*
5. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
*/
select c1, l1
from (select city as c1, length(city) as l1
      from station
      order by c1)
where l1 = (select min(length(city))
            from station)
            and rownum < 2;
            
select c2, l2 
from (select city as c2, length(city) as l2
      from station
      order by c2)
where l2 = (select max(length(city))
           from station)
           and rownum < 2;

/*
6. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
*/
select distinct city 
from station 
where REGEXP_LIKE (lower(city),'^[aeiou]');

/*
7. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
*/
select distinct city 
from station
where regexp_like(lower(city),'[aeiou]$');

/*
8. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
Your result cannot contain duplicates.
*/
select distinct city 
from station 
where regexp_like(lower(city),'^[aeiou]') and regexp_like(lower(city),'[aeiou]$');

/*
9. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
*/
select distinct city 
from station 
where not regexp_like(lower(city), '^[aeiou]');

/*
10. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
*/
select distinct city 
from station 
where not regexp_like(lower(city), '[aeiou]$'); 

/*
11. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
Your result cannot contain duplicates.
*/
select distinct city
from station 
where not regexp_like(lower(city),'^[aeiou]') or not regexp_like(lower(city), '[aeiou]$');

/*
12. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. 
Your result cannot contain duplicates.
*/
select distinct city
from station
where not regexp_like(lower(city), '^[aeiou]') and not regexp_like(lower(city), '[aeiou]$');

/*
13. Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. 
Truncate your answer to 4 decimal places.
*/
select round(sum(lat_n),4)
from station 
where lat_n > 38.7880 and lat_n < 137.2345;

/*
14. Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
Truncate your answer to 4 decimal places.
*/
select round(max(lat_n),4)
from station
where lat_n < 137.2345;

/*
15. Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. 
Round your answer to 4 decimal places.
*/
select round(long_w,4)
from station
where lat_n < 137.2345
order by lat_n desc
limit 1;

/*
16. Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. 
Round your answer to 4 decimal places.
*/
select round(min(lat_n),4)
from station
where lat_n > 38.7780

/*
17. Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. 
Round your answer to 4  decimal places.
*/
select round(long_w,4)
from station
where lat_n > 38.7780
order by lat_n asc
limit 1

/*
18. Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.
*/
select round(max(lat_n)-min(lat_n) + max(long_w)-min(long_w),4)
from station

/*
19. Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Euclidean Distance between points P1 and P2 and round it to a scale of 4 decimal places.
*/
select round(sqrt(power(max(lat_n)-min(lat_n),2) + power(max(long_w)-min(long_w),2)),4)
from station

/*
20. A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
*/
select round(s.lat_n,4)
from station s
where (select count(lat_n) from station where lat_n < s.lat_n) = (select count(lat_n) from station where lat_n > s.lat_n)

