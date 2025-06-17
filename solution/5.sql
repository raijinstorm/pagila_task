WITH selected_actors AS (
SELECT 
	actor.first_name || ' ' || actor.last_name AS "full_name",
	COUNT(film_actor.film_id) as cnt
FROM 
	film_actor
	JOIN film_category ON film_actor.film_id = film_category.film_id
	JOIN category ON category.category_id = film_category.category_id
	JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE 
	category.name = 'Children'
GROUP BY 
	"full_name"
),

ranked_actors AS (
	SELECT 
		full_name,
		RANK() OVER(
			ORDER BY cnt DESC
		) as "rank"
	FROM
		selected_actors
)

SELECT 
	"full_name"
FROM 
	ranked_actors
WHERE 
	"rank" <= 3;

