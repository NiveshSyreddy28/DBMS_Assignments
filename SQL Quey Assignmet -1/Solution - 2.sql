use sakila;

SELECT fl.title, COUNT(ALL fl.title) FROM film_list fl, inventory i, rental r
WHERE fl.category = 'Horror' AND fl.FID = i.film_id AND i.inventory_id = r.inventory_id
GROUP BY title
ORDER BY COUNT(ALL fl.title) DESC
LIMIT 3;