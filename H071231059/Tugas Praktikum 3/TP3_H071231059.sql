-- NO. 1
CREATE DATABASE library

CREATE TABLE authors (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL  
)

CREATE TABLE books (
id INT PRIMARY KEY AUTO_INCREMENT,
isbn CHAR(13),
title VARCHAR(100) NOT NULL,
author_id INT,
FOREIGN KEY(author_id) REFERENCES authors(id) 
)

-- NO. 2
ALTER TABLE authors 
ADD nationality VARCHAR(50)

-- NO. 3
ALTER TABLE books
MODIFY isbn VARCHAR(13) UNIQUE 

-- NO.4
DESCRIBE authors;
DESCRIBE books;

-- NO. 5 
ALTER TABLE books
MODIFY title VARCHAR(150) NOT NULL,
MODIFY isbn VARCHAR(13) UNIQUE NOT NULL,
MODIFY author_id INT NOT NULL,
ADD published_year YEAR NOT NULL,
ADD genre VARCHAR(50) NOT NULL,
ADD copies_available INT NOT NULL

ALTER TABLE authors
MODIFY nationality VARCHAR(50) NOT NULL

CREATE TABLE members(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone CHAR(10),
join_date DATE NOT NULL,
membership_type VARCHAR(50) NOT NULL
)

CREATE TABLE borrowings (
id INT PRIMARY KEY AUTO_INCREMENT,
member_id INT NOT NULL,
book_id INT NOT NULL,
borrow_date DATE NOT NULL,
return_date DATE,
FOREIGN KEY(member_id) REFERENCES members(id),
FOREIGN KEY(book_id) REFERENCES books(id)
)





-- No. 1
INSERT INTO authors (NAME, nationality) 
VALUES ('Tere Liye', 'Indonesian'), 
('J.K. Rowling', 'British'), 
('Andrea Hirata', NULL);


INSERT INTO books 
(isbn, title, author_id, published_year, genre, copies_available)
VALUES ('7040289789375', 'ayah', 3, 2015, 'Fiction', 15),
('9780375704025', 'Bumi', 1, 2014, 'Fantasy', 5),
('8310371703024', 'Bulan', 1, 2015, 'Fantasy', 3),
('9780747532699', "Hary Potter and the Philsopher's Stone", 2, 1997, NULL, 10),
('7210301703022', 'The Running Grave', 2, 2016, 'Fiction', 11);


INSERT INTO members 
(first_name, last_name, email, phone, join_date, membership_type)
VALUES ('John', 'Doe', 'John,doe@example.com', NULL, '2023-04-29', NULL),
('Alice', 'Johnson', 'alice.johnson@example.com', '123123123', '2023-05-01', 'Standar'),
('Bob', 'Williams', 'bob.williams@example.com', '3213214321', '2023-06-20', 'Premium');



INSERT INTO borrowings 
(member_id, book_id, borrow_date, return_date)
VALUES (1, 4, '2023-07-10', '2023-07-25'),
(3, 1, '2023-08-01', NULL),
(2, 5, '2023-09-06', '2023-09-09'),
(2, 3, '2023-09-08', NULL),
(3, 2, '2023-09-10', NULL);



-- NO. 2
UPDATE books
SET copies_available = copies_available -1
WHERE id =1 OR id=2 OR id =3



-- NO. 3
UPDATE members 
SET membership_type = 'Standar'
WHERE id = 3;


DELETE FROM borrowings 
WHERE member_id = 2;

DELETE FROM members 
WHERE id = 2;



SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM borrowings;



