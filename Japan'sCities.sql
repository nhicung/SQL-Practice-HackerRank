/*
1. Query the names of all the Japanese cities in the CITY table. 
The COUNTRYCODE for Japan is JPN.
*/
select name 
from city 
where countrycode = 'JPN';

/*
2. Query the sum of the populations for all Japanese cities in CITY. 
The COUNTRYCODE for Japan is JPN.
*/
select sum(population)
from city 
where countrycode = "jpn"

/*
3. Query all attributes of every Japanese city in the CITY table. 
The COUNTRYCODE for Japan is JPN.
*/
select * 
from city 
where countrycode = 'JPN';