-- NO. 1
CREATE DATABASE FootballManagement;

-- Table Klub
CREATE TABLE klub(
id INT AUTO_INCREMENT PRIMARY KEY,
nama_klub VARCHAR(50) NOT NULL,
kota_asal VARCHAR(50) NOT NULL 
);


-- Table Pemain
CREATE TABLE pemain(
id INT AUTO_INCREMENT PRIMARY KEY,
nama_pemain VARCHAR(50) NOT NULL,
posisi VARCHAR(50) NOT NULL,
id_klub INT,
FOREIGN KEY(id_klub) REFERENCES klub(id)
);


-- Table Pertandingan
CREATE TABLE pertandingan(
id INT AUTO_INCREMENT PRIMARY KEY,
id_klub_tuan_rumah INT,
FOREIGN KEY(id_klub_tuan_rumah) REFERENCES klub(id),
id_klub_tamu INT,
FOREIGN KEY(id_klub_tamu) REFERENCES klub(id),
tanggal_pertandingan DATE NOT NULL,
skor_tuan_rumah INT DEFAULT 0,
skor_tamu INT DEFAULT 0
);


-- indeks
ALTER TABLE pemain
ADD INDEX index_posisi(posisi);

ALTER TABLE klub
ADD INDEX index_kota_asal(kota_asal);




-- NO. 2
SELECT c.customerName, c.country, 
FORMAT(SUM(p.amount), 2) TotalPayment, 
COUNT(o.orderNumber) orderCount,
MAX(p.paymentDate) LastPaymentDate,
case
when SUM(p.amount) > 100000 then 'VIP'
when SUM(p.amount) BETWEEN 5000 AND 100000 then 'Loyal'
when SUM(p.amount) < 5000 then 'New'
ELSE 'New'
END AS `Status`
FROM customers c
LEFT JOIN orders o USING(customerNumber)
LEFT JOIN payments p USING(customerNumber)
GROUP BY c.customerName
ORDER BY c.customerName;




-- NO. 3
SELECT c.customerNumber, c.customerName, 
SUM(od.quantityOrdered) total_quantity,
case 
when SUM(od.quantityOrdered) > ( 
	SELECT AVG(quantity) FROM (
		SELECT SUM(quantityOrdered) AS quantity FROM orderdetails
		GROUP BY orderNumber
	) AS order_totals
) then 'di atas rata-rata'
ELSE 'di bawah rata-rata'
END AS kategori_pembelian
FROM customers c
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING(orderNumber)
GROUP BY c.customerNumber
ORDER BY SUM(od.quantityOrdered) DESC;


-- Soal Tambahan
CREATE DATABASE fashion;


CREATE TABLE clothes(
	id INT AUTO_INCREMENT PRIMARY KEY,
	clothes_brand VARCHAR(50),
	clothes_season VARCHAR(50),
	clothes_designer VARCHAR(50),
	clothes_price INT
);


DESCRIBE clothes;

START TRANSACTION;

INSERT INTO 
clothes(clothes_brand, clothes_season, clothes_designer, clothes_price)
VALUES ('Channel', 'Fall Winter 2022', 'Virginie Viard', 10000),
('Dior', 'Spring Summer 2023', 'Maria Grazia Chiuri', 10500), 
('Hermes', 'Srpring Summer 2024', 'Nadege Vanhee-Cybulski', 15000),
('Polo Ralph Lauren', 'Fall winter 2023', 'Piergiorgio Del Moro', 20500),
('Burberry', 'Exclusive Summer', 'Daniel Lee', 12500),
('Rolex', 'Series 2024', 'Jean-Frédéric Dufour', 15500);

UPDATE clothes
SET clothes_brand = 'Loro Piana'
WHERE clothes_brand = 'Polo Ralph Lauren';

UPDATE clothes
SET clothes_price = 11500
WHERE clothes_brand = 'Channel';

INSERT INTO 
clothes(clothes_brand, clothes_season, clothes_designer, clothes_price)
VALUES('Rolex', 'Series 2024', 'Jean-Frédéric Dufour', 15500);

DELETE FROM clothes
WHERE clothes_brand = 'Rolex';



SELECT * FROM clothes;

ROLLBACK;





