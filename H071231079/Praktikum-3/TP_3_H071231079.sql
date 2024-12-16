-- Nama : Harmelia Yuli Rahmatika. A

-- soal 1
USE library;

SELECT * FROM author;
SELECT * FROM books;
SELECT * FROM members;

INSERT INTO author(NAME, nationality)
VALUE ("Tere Liye", "Indonesian"),
		("J.K. Rowling", "British"),
		("Andrea Hirata", "");

INSERT INTO books(isbn, title, author_id, published_year, genre, copies_available)
VALUE ("7040289780375", "Ayah", 6, "2015", "Fiction", 15),
		("9780375704025", "Bumi", 4, "2014", "Faantasy", 5),
		("8310371703024", "Bulan", 4, "2015", "Fantasy", 3),
		("9780747532699", "Harry Potter and the Philosopher's Stone", 5, "1997", "", 10),
		("7210301703022", "The Running Grave", 5, "2016", "Fiction", 11);
		
INSERT INTO members(first_name, last_name, email, phone_number, join_date, membership_type)
VALUE ("John", "Doe", "John.doe@example.com", NULL, "2023-04-29", ""),
		("Alice", "Johnson", "alice.johnson@example.com", "1231231231", "2023-05-01", "Standar"),
		("Bob", "Williams", "bob.williams@example.com", "3213214321", "2023-06-20", "Premium");	
		
INSERT INTO borrowings(member_id, book_id, borrow_date, return_date)
VALUES (4, 9, "2023-07-10", "2023-07-25"),
		(6, 6, "2023-07-10", "2023-07-25"),
		(5, 10, "2023-07-10", "2023-07-25"),
		(5, 8, "2023-07-10", "2023-07-25"),
		(6, 7, "2023-07-10", "2023-07-25");
		
-- soal 2
UPDATE books
SET copies_available = copies_available - 1
WHERE id = 1 OR 2 OR 3;

-- soal 3
SHOW CREATE TABLE borrowings;

UPDATE members
SET membership_type = "Standar"
WHERE membership_type = "Premium" OR id = 3;

ALTER TABLE borrowings
DROP FOREIGN KEY borrowings_ibfk_1;

ALTER TABLE borrowings
ADD CONSTRAINT borrowings_ibfk_1 FOREIGN KEY (member_id) REFERENCES members(id) ON DELETE CASCADE;

DELETE FROM members 
WHERE membership_type = "Standar";
