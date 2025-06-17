SELECT 
	film.film_id , film.title
FROM 
	film
	LEFT JOIN inventory ON film.film_id = inventory.film_id
WHERE 
	inventory.inventory_id IS NULL
ORDER BY
	film_id;

--Alternative solution

-- SELECT 
-- 	film.film_id , film.title
-- FROM 
-- 	film
-- WHERE 
-- 	NOT EXISTS (
-- 		SELECT 1
-- 		FROM inventory
-- 		WHERE inventory.film_id = film.film_id
-- 	)
-- ORDER BY
-- 	film_id;










