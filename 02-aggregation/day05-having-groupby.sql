-- Day 5: GROUP BY, aggregate functions continued


-- Problem 1: We define an employee's total earnings as monthly salary x months worked.
-- Find the maximum total earnings for all employees, and the number of employees who have that maximum.
-- Print both values as 2 space-separated integers. The Employee table is described as follows:
-- Source: HackerRank 

SELECT salary * months AS earnings, COUNT(*)
FROM Employee
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1;


-- Problem 2: Consider  and  to be two points on a 2D plane.
-- a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
-- b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
-- c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
-- d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
-- Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.
-- The STATION table is described as follows:
-- Source: HackerRank 

SELECT ROUND(
    ABS(MAX(LAT_N) - MIN(LAT_N)) +
    ABS(MAX(LONG_W) - MIN(LONG_W)),
    4
) AS manhattan_distance
FROM STATION;


-- Problem 3: Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values 
-- of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
-- Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.
-- Input Format
-- The STATION table is described as follows:
-- Source: HackerRank 

SELECT ROUND(
    SQRT(
        POWER(MAX(LAT_N) - MIN(LAT_N), 2) +
        POWER(MAX(LONG_W) - MIN(LONG_W), 2)
    ), 4
) AS euclidean_distance
FROM STATION;


-- Problem 4: A median is defined as a number separating the higher half of a data set from the lower half. 
-- Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
-- Input Format
-- The STATION table is described as follows:
-- Source: HackerRank 

SELECT ROUND(a.LAT_N, 4)
FROM STATION a
WHERE (
    SELECT COUNT(*) FROM STATION b WHERE b.LAT_N < a.LAT_N
) = (
    SELECT COUNT(*) FROM STATION c WHERE c.LAT_N > a.LAT_N
);