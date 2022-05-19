use sakila;

SELECT * FROM customer_list cl
WHERE cl.country = 'Canada' AND ID IN 
	(SELECT r.customer_id FROM actor a, film_actor fa, inventory i, rental r
		WHERE a.first_name = 'NICK'
                AND a.last_name = 'WAHLBERG'
                AND a.actor_id = fa.actor_id
                AND fa.film_id = i.film_id
                AND i.inventory_id = r.inventory_id);