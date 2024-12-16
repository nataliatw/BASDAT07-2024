CREATE DATABASE tim_sepakbola;

USE tim_sepakbola;

CREATE TABLE klub(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama_klub VARCHAR(50) NOT NULL,
	kota_asal VARCHAR(20) NOT NULL
);

CREATE TABLE pemain(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama_pemain VARCHAR(50) NOT NULL,
	posisi VARCHAR(20) NOT NULL,
	id_klub INT,
	FOREIGN KEY(id_klub) REFERENCES klub(id)
);

CREATE TABLE pertandingan(
	id INT PRIMARY KEY AUTO_INCREMENT,
	id_klub_tuan_rumah INT,
	id_klub_tamu INT,
	tanggal_pertandingan DATE NOT NULL,
	skor_tuan_rumah INT DEFAULT 0,
	skor_tamu INT DEFAULT 0,
	FOREIGN KEY(id_klub_tuan_rumah) REFERENCES pemain(id_klub),
	FOREIGN KEY(id_klub_tamu) REFERENCES klub(id) 
);

CREATE INDEX idx_posisi ON pemain(posisi);

CREATE INDEX idx_kota_asal ON klub(kota_asal);


# Nomor 2
USE classicmodels;

SELECT
customerName,
country,
ROUND(SUM(p.amount), 2) AS TotalPayment,
COUNT(o.orderNumber) AS 'orderCount',
MAX(p.paymentDate) AS 'LastPaymentDate',
case
	when SUM(p.amount) > 100000 then 'VIP'
	when SUM(p.amount) BETWEEN 5000 AND 100000 then 'Loyal'
	ELSE 'New'
END AS Status
FROM customers 
LEFT JOIN payments p
USING(customerNumber)
LEFT JOIN orders o
USING(customerNumber)
GROUP BY customerNumber
ORDER BY customerName ASC;

# Nomor 3
SELECT 
c.customerNumber,
c.customerName,
SUM(od.quantityOrdered) AS total_quantity,
CASE 
WHEN SUM(od.quantityOrdered) > (
   SELECT AVG(quantityOrdered) 
   FROM orderdetails
) THEN 'di atas rata-rata'
ELSE 'di bawah rata-rata'
END AS kategori_pembelian
FROM customers c
JOIN orders o 
USING(customerNumber)
JOIN orderdetails od 
USING(orderNumber)
GROUP BY c.customerNumber
ORDER BY total_quantity DESC;

#Soal Tambahan
CREATE DATABASE fashion;

USE fashion;

CREATE TABLE clothes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    clothes_brand VARCHAR(50),
    clothes_season VARCHAR(50),
    clothes_designer VARCHAR(50),
    clothes_price INT
);

START TRANSACTION;

INSERT INTO clothes (clothes_brand, clothes_season, clothes_designer, clothes_price)
VALUES 
('Channel', 'Fall Winter 2022', 'Virginie Viard', 10000),
('Dior', 'Spring Summer 2023', 'Maria Grazia Chiuri', 10500),
('Hermes', 'Spring Summer 2024', 'Nadege Vanhee-Cybulski', 15000),
('Polo Ralph Lauren', 'Fall Winter 2023', 'Piergiorgio Del Moro', 20500),
('Burberry', 'Exclusive Summer', 'Daniel Lee', 12500);

SELECT * FROM clothes;

UPDATE clothes
SET clothes_brand = 'Loro Piana'
WHERE clothes_brand = 'Polo Ralph Lauren';
SELECT * FROM clothes;

UPDATE clothes
SET clothes_price = 11500
WHERE clothes_brand = 'Channel';
SELECT * FROM clothes;

INSERT INTO clothes (clothes_brand, clothes_season, clothes_designer, clothes_price)
VALUES ('Rolex', 'Series 2024', 'Jean-Frédéric Dufour', 15500);
SELECT * FROM clothes;

DELETE FROM clothes
WHERE clothes_brand = 'Rolex';
SELECT * FROM clothes;

ROLLBACK;

COMMIT;

DROP DATABASE fashion;