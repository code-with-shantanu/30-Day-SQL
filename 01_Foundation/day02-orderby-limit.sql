-- Day 2: ORDER BY, LIMIT, multi-condition WHERE


-- Problem 1: Query a list of unique CITY names from STATION with an even ID. 
-- The STATION table is described as follows:
-- Source: HackerRank 

SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0;


-- Problem 2: Find the difference between the total number of CITY entries and the number of distinct CITY entries in STATION. 
-- The STATION table is described as follows:
-- Source: HackerRank 

SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;


-- Problem 3: Query the shortest and longest length city names, along with their lengths, from STATION.
-- If more than one city has the same shortest or longest length, break the tie alphabetically. 
-- The STATION table is described as follows:
-- Source: HackerRank 

SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) ASC, CITY ASC
LIMIT 1;

SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY ASC
LIMIT 1;


-- Problem 4: Query the list of CITY names from STATION that start with a vowel. 
-- Your result cannot contain duplicates. The STATION table is described as follows:
-- Source: HackerRank 

SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U');


-- Problem 5: Query the list of CITY names from STATION that start and end with a vowel. 
-- Your result cannot contain duplicates. The STATION table is described as follows:
-- Source: HackerRank 

SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U')
  AND RIGHT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U');