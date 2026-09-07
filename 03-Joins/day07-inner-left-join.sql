-- Day 7: INNER and LEFT JOIN


-- Problem 1: Given the CITY and COUNTRY tables, query the sum of the populations
-- of all cities where the CONTINENT is 'Asia'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
-- Source: HackerRank 

SELECT SUM(CITY.POPULATION)
FROM CITY
INNER JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Asia';


-- Problem 2: Given the CITY and COUNTRY tables, query the names of all cities
-- where the CONTINENT is 'Africa'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
-- Source: HackerRank 

SELECT CITY.NAME
FROM CITY
INNER JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Africa';
