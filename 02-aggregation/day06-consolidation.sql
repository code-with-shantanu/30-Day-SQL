-- Day 6: Consolidation -- mixed aggregation practice


-- Problem 1: Query the average population of all cities in CITY, rounded down to the nearest integer.
-- The CITY table is described as follows:
-- Source: HackerRank 

SELECT FLOOR(AVG(POPULATION))
FROM CITY;


-- Problem 2: Query the sum of the populations for all Japanese cities in CITY.
-- The COUNTRYCODE for Japan is 'JPN'. The CITY table is described as follows:
-- Source: HackerRank 

SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';


-- Problem 3: Query the difference between the maximum and minimum populations in CITY.
-- The CITY table is described as follows:
-- Source: HackerRank 

SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;


-- Problem 4: Query a count of the total number of cities in CITY.
-- The CITY table is described as follows:
-- Source: HackerRank 

SELECT COUNT(*)
FROM CITY;


-- Problem 5: Query the sum of populations for all cities in CITY.
-- The CITY table is described as follows:
-- Source: HackerRank 

SELECT SUM(POPULATION)
FROM CITY;


-- Problem 6: Query the average population for all cities in CITY.
-- The CITY table is described as follows:
-- Source: HackerRank 

SELECT AVG(POPULATION)
FROM CITY;
