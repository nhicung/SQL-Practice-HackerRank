/*
1. Query all columns for all American cities in CITY with populations larger than 100000. 
The CountryCode for America is USA.
*/

select *
from CITY
where countrycode = 'USA' and population > 100000;

/*
2. Query the names of all American cities in CITY with populations larger than 120000. 
The CountryCode for America is USA.
*/

select NAME
from CITY
where CountryCode = 'USA' and population > 120000;

/*
3. Query all columns (attributes) for every row in the CITY table.
*/

select *
from city;

/*
4. Query all columns for a city in CITY with the ID 1661.
*/

select *
from city 
where ID = 1661;