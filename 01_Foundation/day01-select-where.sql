
-- Day 1: SELECT, WHERE, basic filtering


-- Problem 1: Query all columns (attributes) for every row in the CITY table. The CITY table is described as follows:
-- Source: HackerRank 

SELECT *
FROM CITY;


-- Problem 2: Query all columns for a city in CITY with the ID 1661. The CITY table is described as follows:
-- Source: HackerRank 

SELECT *
FROM CITY   
WHERE ID = 1661; 


-- Problem 3: Query all columns for all American cities in the CITY table with populations larger than 100000. 
-- The CountryCode for America is USA. The CITY table is described as follows:
-- Source: HackerRank 

SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA'
    AND POPULATION >100000 ;


-- Problem 4: Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
-- The CountryCode for America is USA. The CITY table is described as follows:
-- Source: HackerRank 

SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'USA'
  AND POPULATION > 120000;


-- Problem 5: Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name.
-- If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
-- The STUDENTS table is described as follows:
-- Source: HackerRank 

SELECT Name 
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID;


-- Problem 6: Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month 
-- who have been employees for less than  months. Sort your result by ascending employee_id. 
-- The Employee table containing employee data for a company is described as follows:
-- Source: HackerRank 

SELECT name
FROM Employee
WHERE salary > 2000 and months < 10
ORDER BY employee_id ASC;