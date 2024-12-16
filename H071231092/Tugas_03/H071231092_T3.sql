CREATE DATABASE library;

USE library;

CREATE TABLE authors (
	id INT PRIMARY KEY,
	NAME VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
	id INT PRIMARY KEY,
	isbn VARCHAR(13),
	title VARCHAR(100) NOT NULL,
	author_id INT,
	FOREIGN KEY(author_id) REFERENCES authors(id) 
);

ALTER TABLE authors
MODIFY id INT AUTO_INCREMENT;

ALTER TABLE Books
MODIFY id INT AUTO_INCREMENT;

ALTER TABLE authors
ADD nationality VARCHAR(50);
DESCRIBE authors;

ALTER TABLE Books 
MODIFY isbn VARCHAR(13) UNIQUE;
DESCRIBE Books;

SHOW TABLES;
DESCRIBE authors;
DESCRIBE Books;

CREATE TABLE members (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone_number CHAR(10),
	join_date DATE NOT NULL,
	membership_type VARCHAR(50) NOT NULL
);

CREATE TABLE borrowings (
	id INT PRIMARY KEY AUTO_INCREMENT,
	member_id INT NOT NULL,
	book_id INT NOT NULL,
	borrow_date DATE NOT NULL,
	return_date DATE,
	FOREIGN KEY(member_id) REFERENCES authors(id),
	FOREIGN KEY(book_id) REFERENCES Books(id)    
);

ALTER TABLE Books
MODIFY title VARCHAR(150) NOT NULL, 
MODIFY isbn CHAR(13) UNIQUE,
ADD published_year YEAR NOT NULL,
ADD genre VARCHAR(50) NOT NULL,
ADD copies_available INT NOT NULL; 
DESCRIBE Books;

ALTER TABLE Books
MODIFY author_id INT NOT NULL;

ALTER TABLE authors
MODIFY id INT NOT NULL,
MODIFY nationality VARCHAR(50) NOT NULL;
DESCRIBE authors

--soal 1
INSERT INTO authors (NAME, nationality)
VALUES ("Tere Liye", "Indonesian"),
("J.K. Rowling", "British"),
("Andrea Hirata", " ");

SELECT * FROM authors;

INSERT INTO Books (isbn, title, author_id, published_Year, genre, copies_available)
VALUES("7040289780375", "Ayah", 3, 2015, "Fiction", 15),
("9780375704025", "Bumi", 1, 2014, "Fantasy", 5),
("8310371703024", "Bulan", 1, 2015, "Fantasy", 3),
("9780747632699", "Harry Potter and the Philosopher's Stone", 2, 1997, " ", 10),
("7210301703022", "The Running Grave", 2, 2016, "Fiction", 11);

SELECT * FROM Books;
			
INSERT INTO members (first_name, last_name, email, phone_number, join_date, membership_type)
VALUES("John","Doe","John.doe@example.com",NULL,'2023-04-29'," "),
("Alice","Johnson","Alice.johnson@example.com",1231231231,'2023-05-01',"Standar"),
("Bob","Williams","bob.williams@example.com",3213214321,'2023-06-20',"Premium");

SELECT * FROM members;

INSERT INTO borrowings (member_id,book_id,borrow_date,return_date)
VALUES(1,4,'2023-07-10','2023-07-25'),
(3,1,'2023-08-01',NULL),
(2,5,'2023-09-06','2023-09-09'),
(2,3,'2023-09-08',NULL),
(3,2,'2023-09-10',NULL);

SELECT * FROM borrowings;

--soal 2
UPDATE books
SET copies_available = copies_available - 1
WHERE id IN(1,2,3);

SELECT * FROM books;

--soal 3
UPDATE members
SET membership_type = "Standar"
WHERE id IN(3);

DELETE FROM members
WHERE id IN(2);

SELECT * FROM members;