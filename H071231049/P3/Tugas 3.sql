CREATE DATABASE library;

USE library;

CREATE TABLE authors(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	name VARCHAR(100) NOT NULL,
	nationality VARCHAR(50) NOT NULL
);
	
CREATE TABLE books(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	title VARCHAR(150) NOT NULL,
	isbn VARCHAR(13) UNIQUE, 
	author_id INT NOT NULL,
	published_year YEAR NOT NULL,
	genre VARCHAR(50) NOT NULL,
	copies_available INT NOT NULL,
	FOREIGN KEY (author_id) REFERENCES authors(id)
);

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

INSERT INTO authors (NAME, nationality)
VALUES ("Tere Liye", "Indonesian"),
("J.K. Rowling", "British"),
("Andrea Hirata","");
SELECT * FROM authors;

INSERT INTO books (isbn, title, author_id, published_year, genre, copies_available)
VALUES (7040289780375, "Ayah", 3, 2015, "Fiction", 15),
(9780375704025, "Bumi", 1, 2014, "Fantasy", 5),
(8310371703024, "Bulan", 1, 2015, "Fantasy", 3),
(9780747532699, "Harry Potter and the Philosopher's Stone", 2, 1997, "", 10),
(7210301703022, "The Running Grave", 2, 2016, "Fiction", 11);
SELECT * FROM books;

INSERT INTO members (first_name, last_name, email, phone_number, join_date, membership_type)
VALUES ("John","Doe", "john.doe@example.com", NULL, "2023-04-29", ""),
("Alice","Johnson", "alice.johnson@example.com", "123123123", "2023-05-01", "Standar"),
("Bob","Williams", "bob.williams@example.com", "3213214321", "2023-06-20", "Premium");
SELECT * FROM members;

INSERT INTO borrowings (member_id, book_id, borrow_date, return_date)
VALUES (1, 4, "2023-07-10", "2023-07-25"),
(3, 1, "2023-08-01", NULL),
(2, 5, "2023-09-06", "2023-09-09"),
(2, 3, "2023-09-18", NULL),
(3, 2, "2023-09-10", NULL);
SELECT * FROM borrowings;

UPDATE books
SET copies_available = copies_available - 1
WHERE id = 1 OR id = 2 OR id = 3;

UPDATE members
SET membership_type = "Standar"
WHERE id = 3;

ALTER TABLE borrowings
DROP FOREIGN KEY borrowings_ibfk_1,
ADD CONSTRAINT borrowings_ibfk_4 FOREIGN KEY (member_id) REFERENCES members(id) ON DELETE CASCADE;

DELETE FROM members
WHERE id = 2;