-- Nama : Harmelia Yuli Rahmatika. A
-- Nim  : H071231079
-- LAB  : A

-- TUGAS 2

-- Soal No.1
CREATE DATABASE library

USE library

CREATE TABLE author(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL
)

CREATE TABLE books(
id INT PRIMARY KEY AUTO_INCREMENT,
isbn CHAR(13),
title VARCHAR(100) NOT NULL,
author_id INT,
FOREIGN KEY(author_id) REFERENCES author(id)
)

-- Soal No.4
ALTER TABLE author
ADD nationality VARCHAR(50)

-- Soal No.3
ALTER TABLE books
MODIFY isbn CHAR(13) UNIQUE

-- Soal No.4
DESCRIBE author
DESCRIBE books

-- Soal No.5
ALTER TABLE books
MODIFY isbn CHAR(13) UNIQUE NOT NULL,
MODIFY author_id INT NOT NULL,
MODIFY title VARCHAR(150) NOT NULL

ALTER TABLE author
MODIFY nationality VARCHAR(50) NOT NULL 

CREATE TABLE members(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone_number CHAR(10),
join_date DATE NOT NULL,
membership_type VARCHAR(50) NOT NULL
)

CREATE TABLE borrowings(
id INT PRIMARY KEY AUTO_INCREMENT,
member_id INT NOT NULL,
FOREIGN KEY(member_id) REFERENCES members(id),
book_id INT NOT NULL,
FOREIGN KEY(book_id) REFERENCES books(id),
borrow_date DATE NOT NULL,
return_date DATE
)

ALTER TABLE books
ADD published_year YEAR  NOT NULL,
ADD genre VARCHAR(50) NOT NULL,
ADD copies_available INT NOT NULL

DESCRIBE members
DESCRIBE borrowings
DESCRIBE books
DESCRIBE author 