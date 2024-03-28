--1
--Show the total population of the world.
SELECT
    SUM(population) AS TotalPopulation
FROM
    world
    --2
    --List all the continents - just once each.
SELECT DISTINCT
    (continent)
FROM
    world
    --3
    --Give the total GDP of Africa
SELECT
    SUM(gdp) Africa_Total_GDP
FROM
    world
WHERE
    continent = 'Africa'
    --4
    --How many countries have an area of at least 1000000
SELECT
    COUNT(name) num_of_countries
FROM
    world
WHERE
    area >= 1000000
    --5
    --What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT
    SUM(population) AS total_population
FROM
    world
WHERE
    name IN ('Estonia', 'Latvia', 'Lithuania')
    --6
    -- For each continent show the continent and number of countries.
SELECT DISTINCT
    (continent),
    COUNT(name)
FROM
    world
GROUP BY
    continent
    --7
    --For each continent show the continent and number of countries with populations of at least 10 million.
SELECT
    continent,
    COUNT(name)
FROM
    world
WHERE
    population >= 10000000
GROUP BY
    continent
    --8
    --List the continents that have a total population of at least 100 million.
SELECT
    continent
FROM
    world
GROUP BY
    continent
HAVING
    SUM(population) >= 100000000