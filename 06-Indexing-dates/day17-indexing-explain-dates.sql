-- Day 17: Indexing, EXPLAIN, date functions


-- Part 1: Indexing / EXPLAIN (self-guided -- not a HackerRank submission)
-- There's no HackerRank problem for this part. Instead, run EXPLAIN in
-- front of 2-3 of your own past queries (e.g. the Day 9 New Companies
-- 5-table JOIN) in a sandbox like DB Fiddle or your own MySQL setup, and
-- read the output. Look specifically at the "key" column in the result --
-- NULL means no index was used for that step; an actual index name means
-- MySQL found and used one. Example of how you'd run it:

EXPLAIN
SELECT c.company_code, c.founder, COUNT(DISTINCT e.employee_code)
FROM Company c
LEFT JOIN Lead_Manager lm ON c.company_code = lm.company_code
LEFT JOIN Employee e ON lm.lead_manager_code = e.manager_code
GROUP BY c.company_code, c.founder;



-- Part 2: Date functions
-- Julia conducted a survey on food preferences. Find the top 3 students
-- who studied the same number of days as unique students, using their
-- submission dates. (Full problem: reward students for their study habits
-- by finding students who studied every day since a contest launched, and
-- who studied the most days overall.)
-- Source: HackerRank -- "15 Days of Learning SQL" (rated Hard)

SELECT
    S1.SUBMISSION_DATE,
    (SELECT COUNT(DISTINCT S2.HACKER_ID)
     FROM SUBMISSIONS S2
     WHERE S2.SUBMISSION_DATE = S1.SUBMISSION_DATE
       AND (SELECT COUNT(DISTINCT S3.SUBMISSION_DATE)
            FROM SUBMISSIONS S3
            WHERE S3.HACKER_ID = S2.HACKER_ID
              AND S3.SUBMISSION_DATE < S1.SUBMISSION_DATE)
           = DATEDIFF(S1.SUBMISSION_DATE, '2016-03-01')
    ) AS unique_streak_count,
    (SELECT S2.HACKER_ID
     FROM SUBMISSIONS S2
     WHERE S2.SUBMISSION_DATE = S1.SUBMISSION_DATE
     GROUP BY S2.HACKER_ID
     ORDER BY COUNT(S2.SUBMISSION_ID) DESC, S2.HACKER_ID
     LIMIT 1
    ) AS top_hacker_id,
    (SELECT H.NAME
     FROM HACKERS H
     WHERE H.HACKER_ID = (
         SELECT S2.HACKER_ID
         FROM SUBMISSIONS S2
         WHERE S2.SUBMISSION_DATE = S1.SUBMISSION_DATE
         GROUP BY S2.HACKER_ID
         ORDER BY COUNT(S2.SUBMISSION_ID) DESC, S2.HACKER_ID
         LIMIT 1
     )
    ) AS top_hacker_name
FROM (SELECT DISTINCT SUBMISSION_DATE FROM SUBMISSIONS) S1
ORDER BY S1.SUBMISSION_DATE;
