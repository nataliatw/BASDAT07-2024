-- Nama : Harmelia Yuli Rahmatika. A
-- NIM  : H071231079

-- SOAL 1
SELECT customerNUmber, customerName, country 
FROM customers 
WHERE (country = 'USA' AND creditlimit BETWEEN 50000 AND 100000)
OR (country != 'USA' AND creditlimit BETWEEN 100000  AND 200000);

-- SOAL 2 
SELECT * FROM products
SELECT productCode, productName, quantityInStock, buyPrice
FROM products
WHERE (quantityInStock BETWEEN 1000 AND 2000)
AND (buyprice <= 50 OR buyPrice >= 150)
AND (productLine NOT LIKE 'Vintage%');
 
-- SOAL 3
SELECT  * FROM products 

SELECT productCode, productName, MSRP
FROM products
WHERE (productLine LIKE '%Classic%')
AND (buyPrice > 50);

-- SOAL 4
SELECT * FROM orders

SELECT orderNumber, orderDate, STATUS, customerNumber
FROM orders
WHERE (orderNumber > 10250 AND STATUS NOT IN ('Shipped', 'Cancelled'))
AND (orderDate LIKE '2004%' OR orderDate LIKE '2005%');

-- AND (orderDate BETWEEN '2004-01-01' AND '2005-12-30')

-- SOAL 5
SELECT * FROM orderdetails
SELECT orderNumber, orderLineNumber, productCode, quantityOrdered, priceEach,
(priceEach - (priceEach * 5/100)) AS 'discountedTotalPrice'
FROM orderdetails
WHERE (quantityordered > 50 AND priceEach > 100)
AND (productCode NOT LIKE 'S18%')
ORDER BY discountedTotalPrice DESC;

-- SOAL TAMBAHAN 
SELECT * FROM customers;

SELECT customerNumber, customerName, city, country, postalcode, creditlimit 
FROM customers
WHERE customerName NOT LIKE '%Ltd.' 
AND customerName NOT LIKE '%Co.' 
AND customerName NOT LIKE '%Inc.'
AND customerName NOT LIKE '%Ltd' 
AND customerName NOT LIKE '%Co' 
AND customerName NOT LIKE '%Inc'
AND postalCode IS NOT NULL
ORDER BY creditlimit DESC
LIMIT 10;
