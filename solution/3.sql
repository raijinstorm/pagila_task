WITH film_revenue AS (
SELECT 
	inventory.film_id, 
	SUM(payment.amount) as "spent_on_film"
FROM 
	payment
	JOIN rental ON payment.rental_id = rental.rental_id
	JOIN inventory ON inventory.inventory_id = rental.inventory_id
GROUP BY 
	inventory.film_id
)

SELECT 
	category.name, 
	SUM(film_revenue.spent_on_film) as "category_revenue"
FROM 
	film_category
	JOIN film_revenue ON film_category.film_id = film_revenue.film_id
	JOIN category ON film_category.category_id = category.category_id
GROUP BY 
	category.name
ORDER BY
	"category_revenue" DESC
LIMIT 1;









