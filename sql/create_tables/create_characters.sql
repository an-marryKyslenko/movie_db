CREATE TABLE characters (
	character_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	description TEXT NOT NULL,
	role ENUM('leading', 'supporting', 'background'),
	movie_id INT,
	person_id INT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
	FOREIGN KEY (person_id) REFERENCES persons(person_id)
);