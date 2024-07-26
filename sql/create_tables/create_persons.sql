CREATE TABLE persons (
	person_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	biography TEXT,
	date_of_birth DATE,
	gender ENUM('male', 'female', 'other'),
	home_country_id INT,
	primary_photo_file_id INT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (home_country_id) REFERENCES countries(country_id),
	FOREIGN KEY (primary_photo_file_id) REFERENCES files(file_id)
);