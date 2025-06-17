WITH ranked_actors AS (
SELECT 
	actor.first_name || ' ' || actor.last_name AS "full_name",
	RANK() OVER (
		ORDER BY
			COUNT(film_actor.film_id) DESC
	) as "rank"
FROM 
	film_actor
	JOIN film_category ON film_actor.film_id = film_category.film_id
	JOIN category ON category.category_id = film_category.category_id
	JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE 
	category.name = 'Children'
GROUP BY 
	"full_name"
)

SELECT 
	"full_name"
FROM 
	ranked_actors
WHERE 
	"rank" = 1;

