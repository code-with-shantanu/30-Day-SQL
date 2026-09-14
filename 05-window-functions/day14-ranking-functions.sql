-- Day 14: Window Functions -- ROW_NUMBER, RANK, DENSE_RANK
-- Note: HackerRank's SQL practice domain does not have dedicated window
-- function problems, so this phase switches to LeetCode Database problems
-- (free tier), which do have a real judge to confirm correct/incorrect.


-- Problem 1: Write a query to rank scores. If there is a tie between two
-- scores, both should have the same ranking. After a tie, the next ranking
-- number should be the next consecutive integer value (no gaps). Order the
-- result by score in descending order.
-- Source: LeetCode 178 -- "Rank Scores"

SELECT score,
       DENSE_RANK() OVER (ORDER BY score DESC) AS "rank"
FROM Scores;

-- Note: DENSE_RANK() is used here specifically because the problem wants
-- NO GAPS after a tie -- e.g. scores 100, 100, 90 should rank as 1, 1, 2,
-- not 1, 1, 3. Using RANK() instead would have produced the gap (1, 1, 3),
-- which is the classic RANK vs DENSE_RANK distinction to remember.
