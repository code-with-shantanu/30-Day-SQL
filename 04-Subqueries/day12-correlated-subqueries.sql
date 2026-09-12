-- Day 12: Correlated Subqueries, subqueries in FROM


-- Problem 1: Hermione decides the best way to choose a wand for Ron is by
-- determining the minimum number of gold galleons needed to buy each
-- non-evil wand of high power and age. Write a query to print the id, age,
-- coins_needed, and power of the wands that Ron is interested in, sorted
-- by power descending. If more than one wand has the same power, sort by
-- age descending.
-- Source: HackerRank (Advanced Join domain -- "Ollivander's Inventory")

SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands w
JOIN Wands_Property wp ON w.code = wp.code
WHERE wp.is_evil = 0
  AND w.coins_needed = (
      SELECT MIN(w2.coins_needed)
      FROM Wands w2
      JOIN Wands_Property wp2 ON w2.code = wp2.code
      WHERE wp2.is_evil = 0
        AND wp2.age = wp.age
        AND w2.power = w.power
  )
ORDER BY w.power DESC, wp.age DESC;
