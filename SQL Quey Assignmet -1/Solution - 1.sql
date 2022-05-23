use sakila;

SELECT 
    f.film_id, f.title FROM category c, film_category fc, film f
WHERE c.category_id = fc.category_id AND c.name = 'Comedy'
AND fc.film_id = f.film_id AND f.rating = 'PG-13';