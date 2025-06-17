SELECT
	city.city,
	ROUND(COUNT(customer.customer_id) * AVG(customer.active), 0) as active,
	ROUND(COUNT(customer.customer_id) * (1 - AVG(customer.active)), 0) as non_active
FROM
	customer
	JOIN address USING(address_id)
	JOIN city USING(city_id)
GROUP BY
	city.city
ORDER BY
	non_active DESC;


