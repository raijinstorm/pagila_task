SELECT
	city.city,
	SUM(CASE WHEN customer.active = 1 THEN 1 ELSE 0 END) as active,
	SUM(CASE WHEN customer.active = 1 THEN 0 ELSE 1 END) as inactive
FROM
	customer
	JOIN address USING(address_id)
	JOIN city USING(city_id)
GROUP BY
	city.city
ORDER BY
	inactive DESC;


-- SELECT
-- 	city.city,
-- 	ROUND(COUNT(customer.customer_id) * AVG(customer.active), 0) as active,
-- 	ROUND(COUNT(customer.customer_id) * (1 - AVG(customer.active)), 0) as inactive
-- FROM
-- 	customer
-- 	JOIN address USING(address_id)
-- 	JOIN city USING(city_id)
-- GROUP BY
-- 	city.city
-- ORDER BY
-- 	inactive DESC;