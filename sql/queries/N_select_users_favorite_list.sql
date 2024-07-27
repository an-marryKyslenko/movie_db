SELECT
	u.user_id AS id,
	u.username AS username,
	GROUP_CONCAT(f.movie_id) AS favorite_movie_ids
FROM
	users u
LEFT JOIN
	favorites f ON u.user_id = f.user_id
GROUP BY
	u.user_id, u.username
ORDER BY
	u.username;