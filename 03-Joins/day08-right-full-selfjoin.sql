-- Day 8: RIGHT and FULL JOIN, self-joins


-- Problem 1: You are given a table, Functions, containing two columns: X and Y.
-- Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
-- Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.

20 20
20 21
22 23
SELECT f1.X, f1.Y
FROM FUNCTIONS f1
INNER JOIN FUNCTIONS f2
ON f1.X = f2.Y AND f1.Y = f2.X
WHERE f1.X < f1.Y

UNION

SELECT X, Y
FROM FUNCTIONS
WHERE X = Y
GROUP BY X, Y
HAVING COUNT(*) > 1

ORDER BY X, Y;
