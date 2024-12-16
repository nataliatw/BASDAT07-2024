# Nomor 1
USE classicmodels;

(SELECT 
	productName,
	SUM(priceEach * quantityOrdered) AS 'Revenue',
	'Pendapatan Tinggi' AS Pendapatan
FROM products
JOIN orderdetails USING(productCode)
JOIN orders USING(orderNumber)
WHERE MONTH(orderdate) = 9
GROUP BY productName
ORDER BY `Revenue` DESC
LIMIT 5)

UNION

(SELECT 
	productName,
	SUM(priceEach * quantityOrdered) AS 'Revenue',
	'Pendapatan Terendah (Kayak Kamu)' AS Pendapatan
FROM products
JOIN orderdetails USING(productCode)
JOIN orders USING(orderNumber)
WHERE MONTH(orderdate) = 9
GROUP BY productName
ORDER BY `Revenue` ASC 
LIMIT 5);


#Nomor 2
SELECT 
	productName
FROM products

EXCEPT

(SELECT 
	productName
FROM products p
JOIN orderdetails od USING(productCode)
JOIN orders o USING(orderNumber)
JOIN customers c USING(customerNumber)
WHERE c.customerNumber IN(
	SELECT 
		customerNumber
	FROM customers
	JOIN orders USING(customerNumber)
	JOIN orderdetails USING(orderNumber)
	JOIN products USING(productCode)
	WHERE buyPrice > (SELECT AVG(buyPrice) FROM products)
	GROUP BY customerNumber
	HAVING COUNT(DISTINCT orderNumber) > 10)
);

# Nomor 3
SELECT 
	customerName
FROM customers
JOIN payments USING(customerNumber)
GROUP BY customerName
HAVING SUM(amount) > 2*(
	SELECT AVG(totalAverage)
	FROM (
		SELECT SUM(amount) AS 'totalAverage'
		FROM payments
		GROUP BY customerNumber
	) AS hasil
)

INTERSECT 

SELECT 
	customerName
FROM customers
JOIN orders USING(customerNumber)
JOIN orderdetails USING(orderNumber)
JOIN products USING(productCode)
WHERE productLine = 'Planes' OR productLine = 'Trains'
GROUP BY customerName
HAVING SUM(quantityOrdered * priceEach) > 20000;


# Nomor 4
SELECT 
    o.orderDate AS 'Tanggal',
    c.customerNumber AS 'CustomerNumber',
    'Membayar Pesanan dan Memesan Barang' AS 'riwayat'
FROM orders o
JOIN customers c USING (customerNumber)
JOIN payments p ON o.orderDate = p.paymentDate
HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003

UNION

SELECT 
    orderDate, 
    customerNumber,
    'Memesan Barang' 
FROM orders
WHERE MONTH(orderDate) = 09 AND YEAR(orderDate) = 2003
AND orderDate NOT IN (  
	SELECT o.orderDate AS 'Tanggal'
	FROM orders o
	JOIN customers c USING (customerNumber)
	JOIN payments p ON o.orderDate = p.paymentDate
	HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003
)
UNION

SELECT 
    paymentDate, 
    customerNumber, 
    'Membayar Pesanan'  FROM payments
WHERE MONTH(paymentDate) = 09 AND YEAR(paymentDate) = 2003
AND paymentDate NOT IN (  
	SELECT p.paymentDate AS 'Tanggal'
	FROM orders o
	JOIN customers c USING (customerNumber)
	JOIN payments p ON o.orderDate = p.paymentDate
	HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003
)
ORDER BY Tanggal;


# Nomor 5
SELECT DISTINCT productCode FROM products
JOIN orderdetails USING(productCode)
WHERE priceEach > (
    SELECT AVG(priceEach) FROM orderdetails
    join orders USING(orderNumber)
    where orderDate BETWEEN '2001-01-01' and '2004-03-31'
)
AND quantityOrdered > 48
AND left(productVendor, 1) IN ('A', 'I', 'U','E','O')

EXCEPT

SELECT DISTINCT productCode FROM products
JOIN orderdetails USING(productCode)
JOIN orders USING(orderNumber)
JOIN customers using(customerNumber)
WHERE country in ("Japan", "Germany", "Italy");

#Soal tambahan
SELECT
	productName AS 'NAME',
	productLine,
	SUM(quantityInStock) AS TotalStock,
	'High Stock' AS Category
FROM products
WHERE productLine = 'Cars'
GROUP BY productName, productLine
HAVING SUM(quantityInStock) > 5000

UNION 

SELECT
	productName AS 'NAME',
	productLine,
	SUM(quantityInStock) AS TotalStock,
	'Low Stock' AS Category
FROM products
WHERE productLine = 'Cars'
GROUP BY productName, productLine
HAVING SUM(quantityInStock) <= 5000

UNION

SELECT
	productName AS 'NAME',
	productLine,
	SUM(quantityInStock) AS TotalStock,
	'High Stock' AS Category
FROM products
WHERE productLine != 'Cars'
GROUP BY productName, productLine
HAVING SUM(quantityInStock) > 2500

UNION

SELECT
	productName AS 'NAME',
	productLine,
	SUM(quantityInStock) AS TotalStock,
	'Low Stock' AS Category
FROM products
WHERE productLine != 'Cars'
GROUP BY productName, productLine
HAVING SUM(quantityInStock) <= 2500
ORDER BY category DESC, productLine;