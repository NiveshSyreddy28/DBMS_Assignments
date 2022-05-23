use sakila;

SELECT * FROM customer_list
WHERE country = 'India' AND ID IN (SELECT r.customer_id
FROM film_list fl, inventory i, rental r
WHERE fl.category = 'Sports' AND fl.FID = i.film_id 
AND r.inventory_id = i.inventory_id
GROUP BY r.customer_id);