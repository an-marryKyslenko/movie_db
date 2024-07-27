SELECT
	m.movie_id AS id,
	m.title AS title,
	COUNT(c.person_id) AS actors_count
FROM
	movies m
LEFT JOIN
	characters c ON m.movie_id = c.movie_id
WHERE
	m.release_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
GROUP BY
	m.movie_id, m.title
ORDER BY
	actors_count DESC;