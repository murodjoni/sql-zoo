-- https://www.sqlzoo.net/wiki/SELECT_basics

-- 1
-- The example uses a WHERE clause to show the population of 'France'. Note that strings should be in 'single quotes';

SELECT population FROM world
  WHERE name = 'Germany'


-- 2
-- Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
