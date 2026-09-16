-- Day 16: Window Functions -- LAG/LEAD, running totals


-- Problem 1: Find all dates' id with a higher temperature compared to its
-- previous date (yesterday). Return the result in any order.
-- Source: LeetCode 197 -- "Rising Temperature"

SELECT id
FROM (
    SELECT id,
           temperature,
           recordDate,
           LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
           LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
    FROM Weather
) t
WHERE temperature > prev_temp
  AND recordDate = DATE_ADD(prev_date, INTERVAL 1 DAY);


-- Problem 2: Find all numbers that appear at least three times consecutively
-- in the Logs table (id, num). Return the result in any order.
-- Source: LeetCode 180 -- "Consecutive Numbers"

SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT num,
           LAG(num, 1) OVER (ORDER BY id) AS prev1,
           LAG(num, 2) OVER (ORDER BY id) AS prev2
    FROM Logs
) 
WHERE num = prev1 AND num = prev2;
