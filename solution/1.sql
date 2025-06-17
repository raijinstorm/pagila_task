SELECT  
	category.name, 
	COUNT(*) as "Number of films"
FROM 
	film_category 
JOIN 
	category 
ON 
	category.category_id = film_category.category_id
GROUP BY 
	category.name
ORDER BY 
	"Number of films" DESC;