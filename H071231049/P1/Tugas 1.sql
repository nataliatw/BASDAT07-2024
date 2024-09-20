CREATE DATABASE library;

USE library;

CREATE TABLE authors(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nama VARCHAR(100)
);
	
CREATE TABLE books(
	id INT AUTO_INCREMENT PRIMARY KEY,
	isbn VARCHAR(13),
	title VARCHAR(100) NOT NULL, 
	author_id INT,
	FOREIGN KEY (author_id) REFERENCES authors(id)
);

ALTER TABLE authors
ADD nationality VARCHAR(50);

ALTER TABLE books
MODIFY isbn VARCHAR(13) UNIQUE;

CREATE TABLE members(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone_number CHAR(10),
	join_date DATE NOT NULL,
	membership_type VARCHAR(50) NOT NULL
);

CREATE TABLE borrowings(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	member_id INT NOT NULL,
	book_id INT NOT NULL,
	borrow_date DATE NOT NULL,
	return_date DATE,
	FOREIGN KEY (member_id) REFERENCES members(id),
	FOREIGN KEY (book_id) REFERENCES books(id)
);

ALTER TABLE authors
	MODIFY id INT NOT NULL,
	MODIFY nama VARCHAR(100) NOT NULL,
	MODIFY nationality VARCHAR(50) NOT NULL;
	
ALTER TABLE books
	MODIFY id INT NOT NULL,
	MODIFY isbn CHAR(13) UNIQUE NOT NULL,
	MODIFY author_id INT NOT NULL;
	ADD published_year YEAR NOT NULL,
	ADD genre VARCHAR(50) NOT NULL,
	ADD copies_available INT NOT NULL;


DESCRIBE borrowings;	 
DESCRIBE members;
DESCRIBE authors; 
DESCRIBE books; 