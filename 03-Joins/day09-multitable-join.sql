-- Day 9: Multi-table JOINs


-- Problem 1: Amber's conglomerate corporation just acquired some new companies.
-- Write a query to print the company_code, founder name, total number of lead
-- managers, total number of senior managers, total number of managers, and
-- total number of employees. Order your output by ascending company_code.
-- Note: company_code is a string, so sorting should not be numeric
-- (e.g. C_1, C_10, C_2 in that order, not C_1, C_2, C_10).
-- Source: HackerRank (Advanced Select domain -- "New Companies")

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
