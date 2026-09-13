-- Day 13: CTEs (WITH clause) + consolidation
-- Rewriting Day 11 and Day 12 problems using CTE syntax instead of nested
-- subqueries -- same logic, same correct output, different (more readable)
-- structure. HackerRank doesn't have dedicated "CTE" problems, so this is
-- the genuine way to practice the syntax: applying it to problems you've
-- already solved correctly with subqueries.


-- Problem 1 (CTE version of Day 11's "Placements"):
-- Output the names of students whose best friend was offered a higher
-- salary than them, ordered by the friend's salary.
-- Source: HackerRank ("Placements") 

WITH student_salary AS (
    SELECT Students.ID, Students.Name, Packages.Salary
    FROM Students
    JOIN Packages ON Students.ID = Packages.ID
),
friend_salary AS (
    SELECT Friends.ID, Packages.Salary AS Friend_Salary
    FROM Friends
    JOIN Packages ON Friends.Friend_ID = Packages.ID
)
SELECT student_salary.Name
FROM student_salary
JOIN friend_salary ON student_salary.ID = friend_salary.ID
WHERE student_salary.Salary < friend_salary.Friend_Salary
ORDER BY friend_salary.Friend_Salary;


-- Problem 2 (CTE version of Day 12's "Ollivander's Inventory"):
-- Print id, age, coins_needed, and power for each non-evil wand with the
-- minimum coins_needed at its (age, power) combination.
-- Source: HackerRank ("Ollivander's Inventory") 

WITH min_coins AS (
    SELECT wp2.age, w2.power, MIN(w2.coins_needed) AS min_coins_needed
    FROM Wands w2
    JOIN Wands_Property wp2 ON w2.code = wp2.code
    WHERE wp2.is_evil = 0
    GROUP BY wp2.age, w2.power
)
SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands w
JOIN Wands_Property wp ON w.code = wp.code
JOIN min_coins ON min_coins.age = wp.age
             AND min_coins.power = w.power
             AND min_coins.min_coins_needed = w.coins_needed
WHERE wp.is_evil = 0
ORDER BY w.power DESC, wp.age DESC;
