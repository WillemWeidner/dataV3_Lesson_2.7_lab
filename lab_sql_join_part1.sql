USE sakila;

-- 1. How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.

SELECT*
FROM sakila.film;

SELECT*
FROM sakila.category;

SELECT*
FROM sakila.film_category;

table2 = film
film_id

table1 = film_category

SELECT *
FROM film_category
INNER JOIN table2 ON table1.columnA = table2.columnA
INNER JOIN table3 ON table2.columnB = table3.columnB;


SELECT category.name, genre_name, COUNT(Distinct(film_category.film_id)) AS Number_of_movies
FROM sakila.category
JOIN sakila.film_category
USING(category_id)
-- ON film_category.category_id = category.category_id
GROUP BY category.category_id;


SELECT c.name , COUNT(fc.film_id)
FROM sakila.category c
JOIN sakila.film_category fc
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY c.name ASC;

-- 2. Display the total amount rung up by each staff member in August of 2005.
-- rung up = total amount that each staff member entered into the cash register in aug 2005

SELECT *
FROM sakila.staff;
SELECT * 
FROM sakila.payment;
-- staff ID is in both tables

SELECT staff.staff_id, staff.first_name, last_name, SUM(payment.amount)
FROM sakila.staff
JOIN sakila.payment
USING (staff_id)
-- ON staff.staff_id = payment.staff_id
WHERE payment.payment_date LIKE "2005-08%"
-- WHERE YEAR(payment.payment_date) = 2005 AND MONTH(payment.payment_date) = 8
GROUP BY staff.staff_id;
ORDER BY payment.staff_id ASC;


-- 3. Which actor has appeared in the most films? 

select first_name, last_name, count(*) as cnt
from sakila.actor a
join sakila.film_actor f on a.actor_id = f.actor_id
group by a.actor_id, a.first_name, a.last_name
order by count(*) desc ;

-- 4. Most active customer (the customer that has rented the most number of films)

SELECT *
FROM sakila.rental;

SELECT customer
FROM sakila.customer
JOIN sakila.rental
USING (customer_id);


SELECT r.customer_id, count(*) as Numero_de_rentas
FROM rental as r
GROUP BY r.customer_id
ORDER BY Numero_de_rentas DESC LIMIT 1;

-- Display the first and last names, as well as the address, of each staff member.

SELECT staff.first_name, last_name, address.address
FROM sakila.staff
JOIN sakila.address
USING (address_id),


-- List each film and the number of actors who are listed for that film.

SELECT *
FROM film_actor;

SELECT film.film_id, film.title, COUNT(film_actor.actor_id) AS num_actors
FROM sakila.film
JOIN film_actor
USING (film_id)
GROUP BY film.film_id
ORDER BY film.film_id;

SELECT film.title, COUNT(distinct film_actor.actor_id) AS number_actors
FROM sakila.film
JOIN sakila.film_actor
USING (film_id)
GROUP BY film.title;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.

USE sakila;
SELECT customer.customer_id, customer.last_name, SUM(payment.amount) AS total_paid_by_each_customer
FROM sakila.payment
JOIN sakila.customer
USING (customer_id)
GROUP BY customer.customer_id
ORDER BY customer.last_name ASC;

SELECT *
FROM film_category;

-- 8. List the titles of films per category.
SELECT film.title, film_category.category_id as category
FROM sakila.film
JOIN sakila.film_category
USING (film_id);

SELECT film.title, film_category.category_id as category
FROM sakila.film
JOIN sakila.film_category
USING (film_id);