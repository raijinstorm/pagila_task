SELECT 
	film.film_id , film.title
FROM 
	film
	LEFT JOIN inventory ON film.film_id = inventory.film_id
WHERE 
	inventory.inventory_id IS NULL
ORDER BY
	film_id;








