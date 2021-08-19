USE sakila;
-- 1. Store_ID 1 is in Lethbridge Canada and Store_ID 2 is in Woodridge Australia
SELECT s.store_id, c.city, co.country
FROM sakila.store s
JOIN sakila.address a
ON s.address_id = a.address_id
JOIN sakila.city c
ON a.city_id = c.city_id
JOIN sakila.country co
ON c.country_id = co.country_id;

-- 2. Store_ID 1 brought in 33489,47 dollars and Store_ID 2 brought in 33927,04 dollars
SELECT s.store_id, SUM(p.amount) as 'sales'
FROM sakila.staff s
JOIN sakila.payment p
ON s.staff_id = p.staff_id
GROUP BY s.store_id;

-- 3. Films in the Sports category are the longest with an average duration of 128,2027 minutes
SELECT c.name, AVG(f.length) as 'avg_duration'
FROM sakila.film f
JOIN sakila.film_category fc
ON f.film_id = fc.film_id
JOIN sakila.category c
ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY avg_duration DESC;

-- 4. Bucket Brotherhood is the most rented movie with 34 times
SELECT f.title, COUNT(r.rental_ID) as 'times_rented'
FROM sakila.film f
JOIN sakila.inventory i USING(film_id)
JOIN sakila.rental r USING(inventory_id)
GROUP BY f.title
ORDER BY COUNT(r.rental_ID) DESC;

-- 5. The top 5 genres in gross revenue are 1# Sports, 2#Sci-Fi, 3# Animation 4# Drama, 5# Comedy
SELECT c.name, SUM(amount) as 'gross_revenue'
FROM sakila.category c
JOIN sakila.film_category fc USING(category_id)
JOIN sakila.inventory i 
ON i.film_id = fc.film_id
JOIN sakila.rental r
ON i.inventory_id = r.inventory_id
JOIN sakila.payment p
ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY gross_revenue DESC;

-- 6. Yes, store 1 has 8 copies of Academy Dinosaur
SELECT s.store_id, f.title, i.inventory_id
FROM sakila.film f
JOIN sakila.inventory i USING(film_id)
JOIN sakila.store s
WHERE f.title = 'Academy Dinosaur' and s.store_id = 1

-- 7. 
SELECT fa., -- voeg filmnaam toe
FROM sakila.actor a
RIGHT JOIN sakila.film_actor fa USING(actor_id)






