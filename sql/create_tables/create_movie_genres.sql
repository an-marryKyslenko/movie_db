CREATE TABLE movieGenres (
	movie_id INT,
	genre_id INT,
	PRIMARY KEY (movie_id, genre_id),
	FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
	FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);
