CREATE TABLE favorites (
	favorite_id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT,
	movie_id INT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);