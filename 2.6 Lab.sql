USE sakila;
-- 1. In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
select * from sakila.actor;
SELECT COUNT(ALL last_name )
FROM sakila.actor;

SELECT COUNT(last_name)
FROM ( SELECT last_name 
FROM sakila.actor
GROUP BY last_name
 HAVING COUNT(*) = 1
) AS ONLY_ONCE;

SELECT first_name, last_name
FROM sakila.actor
GROUP BY last_name
 HAVING COUNT(*) = 1;



-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once.
SELECT COUNT(last_name)
FROM ( SELECT last_name 
FROM sakila.actor
GROUP BY last_name
 HAVING COUNT(*) > 1
) AS MORE_THAN_ONCE;

SELECT first_name, last_name 
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) > 1
;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
select distinct(staff_id) from sakila.rental;
select * from sakila.rental;

SELECT staff_id,count(rental_id) FROM rental
group by staff_id;

-- 4. Using the film table, find out how many films were released each year.
select * from sakila.film;


SELECT distinct release_year 
FROM sakila.film;

SELECT count(film_id) from film
group by release_year;

SELECT film_id, count(release_year) from film group by release_year;

-- 5. Using the film table, find out for each rating how many films were there.

SELECT rating, count(film_id) from film
group by rating;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places.
SELECT rating,round(avg(length),2) as mean from film
group by rating;


-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating,round(avg(length),2) as mean from film
group by rating;

SELECT rating,round(avg(length),2) from film
group by rating
having round(avg(length),2)>120;

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
select * from sakila.film;
select title, length from sakila.film
order by length desc; 

select length
