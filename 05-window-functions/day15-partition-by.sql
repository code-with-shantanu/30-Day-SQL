-- Day 15: Window Functions -- PARTITION BY


-- Problem 1: Write a query to find the employees who are the highest paid
-- in each of the departments. Return the result table in any order.
-- Actually: find the top three unique salaries for each department,
-- including ties. Output Department, Employee, Salary.
-- Source: LeetCode 185 -- "Department Top Three Salaries"

WITH RankedSalaries AS (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS salary_rank
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
)
SELECT Department, Employee, Salary
FROM RankedSalaries
WHERE salary_rank <= 3;
