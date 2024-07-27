SELECT
	p.person_id as actor_id,
	p.first_name AS actor_first_name,
	p.last_name AS actor_last_name,
	SUM(m.budget) AS total_movie_budget
FROM
	persons p
JOIN
	characters c ON p.person_id = c.person_id
JOIN
	movies m ON c.movie_id = m.movie_id
GROUP BY
	p.person_id, p.first_name, p.last_name
ORDER BY
	total_movie_budget DESC;