--1
--List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962
 --2
 --Give year of 'Citizen Kane'.
 SELECT yr
FROM movie
where title = 'Citizen Kane'
--3
--List all of the Star Trek movies, include the id, title and yr (all of these movies 
--include the words Star Trek in the title). Order results by year.
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr
--4
--What id number does the actor 'Glenn Close' have?
SELECT 
    id
FROM
    actor
WHERE name = 'Glenn Close'
--5
--What is the id of the film 'Casablanca'
SELECT id
FROM movie
WHERE title = 'Casablanca'
--6
--Obtain the cast list for 'Casablanca'.
--what is a cast list?
--Use movieid=11768, (or whatever value you got from the previous question)
SELECT 
    name
FROM
    casting 
        JOIN actor ON (casting.actorid = actor.id)
WHERE 
    movieid = 11768
--7
--Obtain the cast list for the film 'Alien'
SELECT name
  FROM actor
  INNER JOIN casting
  ON (actor.id = casting.actorid)
  INNER JOIN movie
  ON (movie.id = casting.movieid)
WHERE movie.title = 'Alien'
--8
--List the films in which 'Harrison Ford' has appeared
SELECT title
  FROM movie
  INNER JOIN casting
  ON (movie.id = casting.movieid)
  INNER JOIN actor
  ON (actor.id = casting.actorid)
WHERE actor.name = 'Harrison Ford'
--9
--List the films where 'Harrison Ford' has appeared - 
--but not in the starring role. [Note: the ord field of casting gives 
--the position of the actor. If ord=1 then this actor is in the starring role]
SELECT title
  FROM movie
  INNER JOIN casting
  ON (movie.id = casting.movieid)
  INNER JOIN actor
  ON (actor.id = casting.actorid)
WHERE actor.name = 'Harrison Ford' AND casting.ord != 1
--10
--List the films together with the leading star for all 1962 films
SELECT title, actor.name
  FROM movie
  INNER JOIN casting
  ON (movie.id = casting.movieid)
  INNER JOIN actor
  ON (actor.id = casting.actorid)
WHERE movie.yr = 1962 
AND casting.ord = 1
--11
--Which were the busiest years for 'Rock Hudson', 
--show the year and the number of movies he made each year 
--for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) as Num_of_Movies FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
--12
--List the film title and the leading actor 
--for all of the films 'Julie Andrews' played in.
SELECT title, name as leading_actor
FROM movie JOIN casting ON (movie.id=movieid) AND ord = 1 JOIN actor on (actorid=actor.id)  
WHERE movie.id IN (
  SELECT movieid FROM casting
  WHERE actorid IN (SELECT id from actor where name='Julie Andrews'))
--13
--Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT name
FROM actor JOIN casting ON (actor.id = casting.actorid)
WHERE ord=1
GROUP BY name HAVING COUNT(movieid) >= 15


