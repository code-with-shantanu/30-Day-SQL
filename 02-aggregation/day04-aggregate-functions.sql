-- Day 4: Aggregate Functions -- COUNT, SUM, AVG, MIN, MAX


-- Problem 1: Query a count of the number of cities in CITY having a Population larger than 100000.
-- The CITY table is described as follows:
-- Source: HackerRank 

SELECT COUNT(*)
FROM CITY
WHERE POPULATION > 100000;


-- Problem 2: Query the total population of all cities in CITY where District is California.
-- Input Format. The CITY table is described as follows:
-- Source: HackerRank 

SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';


-- Problem 3: Query the average population of all cities in CITY where District is California.
-- Input Format. The CITY table is described as follows: 
-- Source: HackerRank 

SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';


-- Problem 4: Query the average population for all cities in CITY, rounded down to the nearest integer.
-- Input Format. The CITY table is described as follows:
-- Source: HackerRank 

SELECT FLOOR(AVG(POPULATION))
FROM CITY;


-- Problem 5: Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
-- Input Format. The CITY table is described as follows:
-- Source: HackerRank 

SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';


-- Problem 6: Query the difference between the maximum and minimum populations in CITY.
-- The CITY table is described as follows:
-- Source: HackerRank 

SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;
