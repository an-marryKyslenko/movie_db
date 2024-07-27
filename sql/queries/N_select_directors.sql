SELECT
	d.person_id AS director_id,
	CONCAT(d.first_name, ' ', d.last_name) AS director_name,
	AVG(m.budget) AS average_budget
FROM
	movies m
JOIN
	persons d ON m.director_id = d.person_id
GROUP BY
	d.person_id, d.first_name, d.last_name
ORDER BY
	average_budget DESC;