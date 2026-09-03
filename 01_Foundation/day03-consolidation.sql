-- Day 3: Consolidation -- mixed SELECT/WHERE/ORDER BY practice


-- Problem 1: Query a list of CITY and STATE from STATION, in lexicographical (alphabetical) order of CITY.
-- If two or more cities share the same name, break the tie by STATE, also in lexicographical order.
-- The STATION table is described as follows:
-- Source: HackerRank 

SELECT CITY, STATE
FROM STATION
ORDER BY CITY, STATE;


-- Problem 2: Query the list of CITY names from STATION that end with a vowel.
-- Your result cannot contain duplicates. The STATION table is described as follows:
-- Source: HackerRank 

SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U');


-- Problem 3: Query the list of CITY names from STATION that do NOT start with a vowel.
-- Your result cannot contain duplicates. The STATION table is described as follows:
-- Source: HackerRank 

SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('A', 'E', 'I', 'O', 'U');


-- Problem 4: Query all columns for a city in CITY with the CountryCode 'JPN'.
-- The CITY table is described as follows:
-- Source: HackerRank 

SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';


-- Problem 5: Query the names of all Japanese cities in the CITY table. The COUNTRYCODE for Japan is 'JPN'.
-- The CITY table is described as follows:
-- Source: HackerRank 

SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';