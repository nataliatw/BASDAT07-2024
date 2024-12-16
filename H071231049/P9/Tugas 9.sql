-- Nomer 1
CREATE DATABASE tp9;
USE tp9;
CREATE TABLE klub (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama_klub VARCHAR(50) NOT NULL,
	kota_asal VARCHAR(50) NOT NULL
);

CREATE TABLE pemain (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama_pemain VARCHAR(50) NOT NULL,
	posisi VARCHAR(20) NOT NULL,
	id_klub INT,
	FOREIGN KEY (id_klub) REFERENCES klub(id)
);

CREATE TABLE pertandingan (
	id INT PRIMARY KEY AUTO_INCREMENT,
	id_klub_tuan_rumah INT,
	id_klub_tamu INT,
	tanggal_pertandingan DATE NOT NULL,
	skor_tuan_rumah INT DEFAULT 0,
	skor_tamu INT DEFAULT 0,
	FOREIGN KEY (id_klub_tuan_rumah) REFERENCES klub(id),
	FOREIGN KEY (id_klub_tamu) REFERENCES klub(id)
);

CREATE INDEX idx_posisi ON pemain(posisi);
CREATE INDEX idx_kota_asal ON klub(kota_asal);
DESCRIBE pemain;
DESCRIBE klub;

-- Nomer 2
USE classicmodels;
SELECT 
   customerName,
   country,
   SUM(amount) AS 'TotalPayment',
   COUNT(orderNumber) AS 'OrderCount',
   MAX(paymentDate) AS 'LastPaymentDate',
   CASE 
   	WHEN SUM(amount) > 100000 THEN 'VIP'
   	WHEN SUM(amount) BETWEEN 5000 AND 100000 THEN 'Loyal'
   	ELSE 'New'
   END AS `Status`
FROM 
   customers
LEFT JOIN 
   payments ON customers.customerNumber = payments.customerNumber
LEFT JOIN 
   orders ON customers.customerNumber = orders.customerNumber
GROUP BY 
   customers.customerNumber
ORDER BY 
   customerName;

-- Nomer 3
SELECT 
   c.customerNumber,
   c.customerName,
   SUM(od.quantityOrdered) AS total_quantity,
   CASE 
      WHEN SUM(od.quantityOrdered) > (SELECT AVG(quantityOrdered) FROM orderdetails) THEN 'di atas rata-rata'
      ELSE 'di bawah rata-rata'
   END AS kategori_pembelian
FROM 
   customers c
JOIN 
   orders o ON c.customerNumber = o.customerNumber
JOIN 
   orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY 
   c.customerNumber, c.customerName
ORDER BY 
   total_quantity DESC;
   
-- Soal Tambahan
CREATE DATABASE fashion;
USE fashion;

CREATE TABLE clothes (
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	clothes_brand VARCHAR(50),
	clothes_season VARCHAR(50),
	clothes_designer VARCHAR(50),
	clothes_price INT(11)   
);

INSERT INTO clothes(clothes_brand, clothes_season, clothes_designer, clothes_price)
VALUES 
	('Channel', 'Fall Winter 2022', 'Virginie Viard', 10000), 
	('Dior', 'Spring Summer 2023', 'Maria Grazia Chiuri', 10500), 
	('Hermes', 'Srpring Summer 2024', 'Nadege Vanhee-Cybulski', 15000),
	('Polo Ralph Lauren', 'Fall winter 2023', 'Piergiorgio Del Moro', 20500),
	('Burberry', 'Exclusive Summer', 'Daniel Lee', 12500),
	('Rolex', 'Series 2024', 'Jean-Frédéric Dufour', 15500);

SELECT * FROM clothes;

DESCRIBE clothes;
SET autocommit = 0;

START TRANSACTION;

UPDATE clothes SET clothes_brand = 'Loro Piana' WHERE clothes_brand = 'Polo Ralph Lauren';
DELETE FROM clothes WHERE clothes_brand = 'Rolex';

ROLLBACK;

