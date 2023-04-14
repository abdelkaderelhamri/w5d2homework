-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT first_name, last_name,district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Nepal';

select*from country
-- INNER JOIN city
-- ON address.city_id = city.city_id

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
Select first_name, last_name,amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
where amount >6.99;
-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
      SELECT customer_id
from payment
GROUP BY customer_id
Having SUM(amount)>175)

-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT first_name, last_name, email, country, city, address
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- 5. Which staff member had the most
-- transactions?

SELECT payment_id, first_name
FROM payment
INNER JOIN staff
ON payment.staff_id = staff.staff_id
where first_name IN(
   select first_name 
   from staff   group by first_name)
	

-- 6. How many movies of each rating are
-- there?
select   rating,count(film_id)as movie_count
from film
Group by rating
order by movie_count DESC

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
select first_name 
from customer
inner join payment
on customer.customer_id = payment.customer_id
where amount>6.99
group by first_name
having  count(payment_id)=1
-- 8. how many free rentals did our stores give away?
select count(amount)as free_rentals_count
from payment
where amount='0'