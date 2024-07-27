SELECT
	m.movie_id AS id,
	m.title,
	m.release_date,
	m.duration,
	m.description,
	JSON_OBJECT(
		'file_id', pf.file_id,
		'file_name', pf.file_name,
		'mime_type', pf.mime_type,
		'file_key', pf.file_key,
		'file_url', pf.file_url
	) AS poster,
	JSON_OBJECT(
		'person_id', d.person_id,
		'first_name', d.first_name,
		'last_name', d.last_name,
		'photo', JSON_OBJECT(
			'file_id', dp.file_id,
			'file_name', dp.file_name,
			'mime_type', dp.mime_type,
			'file_key', dp.file_key,
			'file_url', dp.file_url
		)
	) AS director,
	(SELECT
		JSON_ARRAYAGG(
			JSON_OBJECT(
					'person_id', p.person_id,
					'first_name', p.first_name,
					'last_name', p.last_name,
					'photo', JSON_OBJECT(
						'file_id', pp.file_id,
						'file_name', pp.file_name,
						'mime_type', pp.mime_type,
						'file_key', pp.file_key,
						'file_url', pp.file_url
					)
			)
		)
	FROM
		characters c
	JOIN
		persons p ON c.person_id = p.person_id
	LEFT JOIN
		files pp ON p.primary_photo_file_id = pp.file_id
	WHERE
		c.movie_id = m.movie_id
	) AS actors,
	(SELECT
		JSON_ARRAYAGG(
			JSON_OBJECT(
					'genre_id', g.genre_id,
					'name', g.genre_name
			)
		)
	FROM
		movieGenres mg
	JOIN
		genres g ON mg.genre_id = g.genre_id
	WHERE
		mg.movie_id = m.movie_id
	) AS genres
FROM
	movies m
LEFT JOIN
	files pf ON m.poster_file_id = pf.file_id
JOIN
	persons d ON m.director_id = d.person_id
LEFT JOIN
	files dp ON d.primary_photo_file_id = dp.file_id
WHERE
	m.movie_id = 1;