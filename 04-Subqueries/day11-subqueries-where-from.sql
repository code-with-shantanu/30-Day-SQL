-- Day 11: Subqueries in WHERE and FROM


-- Problem 1: You are given three tables: Students, Friends, and Packages.
-- Students(ID, Name), Friends(ID, Friend_ID), Packages(ID, Salary).
-- Write a query to output the names of students whose best friend was offered
-- a higher salary than them. Order by the friend's salary. No two students
-- got the same salary offer.
-- Source: HackerRank (Advanced Join domain -- "Placements")

SELECT s1.Name
FROM (
    SELECT Students.ID, Students.Name, Packages.Salary
    FROM Students
    JOIN Packages ON Students.ID = Packages.ID
) AS s1
JOIN (
    SELECT Friends.ID, Packages.Salary AS Friend_Salary
    FROM Friends
    JOIN Packages ON Friends.Friend_ID = Packages.ID
) AS s2
ON s1.ID = s2.ID
WHERE s1.Salary < s2.Friend_Salary
ORDER BY s2.Friend_Salary;
