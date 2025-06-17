WITH film_count AS (
    SELECT  
        inventory.film_id, 
        COUNT(rental.rental_id) AS count
    FROM 
        rental
    JOIN 
        inventory ON inventory.inventory_id = rental.inventory_id
    GROUP BY 
        inventory.film_id
)

SELECT 
    actor.first_name || ' ' || actor.last_name AS actor_name,
    SUM(film_count.count) AS rent_count
FROM 
    film_actor
LEFT JOIN 
    film_count ON film_count.film_id = film_actor.film_id
JOIN 
    actor ON actor.actor_id = film_actor.actor_id
GROUP BY 
    actor_name
ORDER BY 
    rent_count DESC
LIMIT 10;
