-- Day 10: Consolidation -- timed re-solve of Days 7-9 JOIN problems
-- Goal: rewrite these from scratch, without checking old solutions, to build
-- speed and confirm retention before moving into subqueries.


-- Problem 1: Given the CITY and COUNTRY tables, query the sum of the populations
-- of all cities where the CONTINENT is 'Asia'.
-- Source: HackerRank (re-solve from Day 7)

SELECT SUM(CITY.POPULATION)
FROM CITY
INNER JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Asia';


-- Problem 2: Given the CITY and COUNTRY tables, query the names of all cities
-- where the CONTINENT is 'Africa'.
-- Source: HackerRank (re-solve from Day 7)

SELECT CITY.NAME
FROM CITY
INNER JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Africa';


-- Problem 3: Find all symmetric pairs in the FUNCTIONS table.
-- Source: HackerRank (re-solve from Day 8)

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


-- Problem 4: Print company_code, founder, and counts of lead managers,
-- senior managers, managers, and employees per company, ordered by company_code.
-- Source: HackerRank (re-solve from Day 9)

SELECT
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code),
    COUNT(DISTINCT sm.senior_manager_code),
    COUNT(DISTINCT m.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM Company c
LEFT JOIN Lead_Manager lm ON c.company_code = lm.company_code
LEFT JOIN Senior_Manager sm ON lm.lead_manager_code = sm.lead_manager_code
LEFT JOIN Manager m ON sm.senior_manager_code = m.senior_manager_code
LEFT JOIN Employee e ON m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;
