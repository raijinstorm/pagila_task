WITH rental_summary AS (
	SELECT 
		COUNT(rental.rental_id),
		SUM(rental.return_date - rental.rental_date) AS "total_duration",
		category.name as "category", 
		CASE 
			WHEN city.city LIKE '%-%' THEN 'Dashed_cities'
			WHEN city.city LIKE 'A%' THEN 'A_cities'
		END AS "city_group"
	FROM
		rental
		JOIN inventory ON rental.inventory_id = inventory.inventory_id
		JOIN customer ON customer.customer_id = rental.customer_id
		JOIN address ON address.address_id = customer.address_id
		JOIN city ON city.city_id = address.city_id
		JOIN film_category ON film_category.film_id = inventory.film_id
		JOIN category ON category.category_id = film_category.category_id
	WHERE 
		city.city LIKE '%-%' 
		OR city.city LIKE 'A%'
	GROUP BY 
		city_group,
		category
),

ranked AS (
	SELECT 
		city_group,
		category,
		total_duration,
		RANK() OVER (
			PARTITION BY
				city_group
			ORDER BY
				total_duration DESC
		) 
	FROM rental_summary
)

SELECT 
	city_group,
	category,
	total_duration
FROM 
	ranked
WHERE 
	"rank" = 1;


-- Another interpretation of the task
-- WITH rental_summary AS (
-- 	SELECT 
-- 		COUNT(rental.rental_id),
-- 		SUM(rental.return_date - rental.rental_date) AS "total_duration",
-- 		category.name AS "category", 
-- 		city.city AS "city_name"
-- 	FROM
-- 		rental
-- 		JOIN inventory ON rental.inventory_id = inventory.inventory_id
-- 		JOIN customer ON customer.customer_id = rental.customer_id
-- 		JOIN address ON address.address_id = customer.address_id
-- 		JOIN city ON city.city_id = address.city_id
-- 		JOIN film_category ON film_category.film_id = inventory.film_id
-- 		JOIN category ON category.category_id = film_category.category_id
-- 	WHERE 
-- 		city.city LIKE '%-%' 
-- 		OR city.city LIKE 'A%'
-- 	GROUP BY 
-- 		city.city,
-- 		category.name
-- 	ORDER BY
-- 		city.city
-- ),

-- ranked AS (
-- 	SELECT 
-- 		city_name,
-- 		category,
-- 		total_duration,
-- 		RANK() OVER (
-- 			PARTITION BY city_name
-- 			ORDER BY total_duration DESC
-- 		) AS "rank"
-- 	FROM rental_summary
-- )

-- SELECT 
-- 	city_name,
-- 	category,
-- 	total_duration
-- FROM 
-- 	ranked
-- WHERE 
-- 	"rank" = 1;










