SELECT
	m.movie_id AS id,
	m.title,
	m.release_date,
	m.duration,
	m.description,
	JSON_OBJECT(
		'file_id', f.file_id,
		'file_name', f.file_name,
		'mime_type', f.mime_type,
		'file_key', f.file_key,
		'file_url', f.file_url
	) AS poster,
	JSON_OBJECT(
		'director_id', d.person_id,
		'first_name', d.first_name,
		'last_name', d.last_name
	) AS director
FROM
	movies m
JOIN
	persons d ON m.director_id = d.person_id
JOIN
	countries c ON m.country_id = c.country_id
LEFT JOIN
	files f ON m.poster_file_id = f.file_id
JOIN
	movieGenres mg ON m.movie_id = mg.movie_id
JOIN
	genres g ON mg.genre_id = g.genre_id
WHERE
	m.country_id = 1
	AND m.release_date >= '2022-01-01'
	AND m.duration > 135
	AND (g.genre_name = 'Action' OR g.genre_name = 'Drama')
GROUP BY
	m.movie_id, m.title, m.release_date, m.duration, m.description, f.file_id, d.person_id
ORDER BY
	m.release_date DESC;