CREATE TABLE personPhotos (
	person_photo_id INT AUTO_INCREMENT PRIMARY KEY,
	person_id INT,
	file_id INT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (person_id) REFERENCES persons(person_id),
	FOREIGN KEY (file_id) REFERENCES files(file_id)
);