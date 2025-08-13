CREATE TABLE pizzas AS
SELECT 'Artichoke' AS name, 12 AS open, 15 AS close
UNION ALL
SELECT 'La Val''s', 11, 22
UNION ALL
SELECT 'Sliver', 11, 20
UNION ALL
SELECT 'Cheeseboard', 16, 23
UNION ALL
SELECT 'Emilia''s', 13, 18;

CREATE TABLE meals AS
SELECT 'breakfast' AS meal, 11 AS time
UNION ALL
SELECT 'lunch', 13
UNION ALL
SELECT 'dinner', 19
UNION ALL
SELECT 'snack', 22;

create table opening as
select name from pizzas where open < 13 order by name desc;

create table study as
select p.name as name, max(14-p.open, 0) as duration
from pizzas as p order by duration desc;

-- Pizza places that are open for late-night-snack time and when they close
  create table late as
  SELECT p.name || ' closes at ' || p.close AS status
  FROM pizzas as p, meals as m 
  WHERE m.meal = 'snack' and p.close >= m.time;

-- Two meals at the same place
  create table double as
  SELECT a.meal AS first, b.meal AS second, name
  FROM meals as a, meals as b, pizzas
  WHERE b.time-a.time > 6 and close >= b.time and open <= a.time;