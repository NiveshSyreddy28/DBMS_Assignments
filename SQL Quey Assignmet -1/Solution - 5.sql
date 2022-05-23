use sakila;

SELECT COUNT(DISTINCT fa.film_id) FROM actor a, film_actor fa
	WHERE a.first_name = 'SEAN'
        AND a.last_name = 'WILLIAMS'
        AND fa.actor_id = a.actor_id;
        