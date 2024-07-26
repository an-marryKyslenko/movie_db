CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    budget DECIMAL(15, 2),
    release_date DATE,
    duration INT,
    director_id INT,
    country_id INT,
    poster_file_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (director_id) REFERENCES persons(person_id),
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    FOREIGN KEY (poster_file_id) REFERENCES files(file_id)
);