-- Name : Harmelia Yuli Rahmatika. A
-- NIM  : H071231079

USE classicmodels

-- Soal 1
SELECT c.customerName,
		 CONCAT(e.firstname, ' ', e.lastname) AS 'salesRep',
		 c.creditLimit - (SUM(p.amount)) AS 'remainingCredit'
FROM customers AS c
JOIN employees AS e
ON c.salesrepemployeeNumber = e.employeeNumber
JOIN payments AS p
USING(customerNumber)
GROUP BY c.customerName
HAVING remainingCredit > 0;


-- Soal 2
SELECT p.productName AS 'Nama Produk',
		 GROUP_CONCAT(c.customerName ORDER BY c.customerName) AS 'Nama Customer',
		 COUNT(DISTINCT(c.customerNumber)) AS 'Jumlah Customer',
		 SUM(od.quantityOrdered) AS 'TTotal Kuantitas'
FROM products AS p
JOIN orderdetails AS od
USING(productCode)
JOIN orders AS o
USING(orderNumber)
JOIN customers AS c
USING(customerNumber)
GROUP BY p.productName;

-- Soal 3
SELECT CONCAT(e.firstname, ' ', e.lastname) AS 'employees',
		 COUNT(c.customerNumber) AS 'totalCustomers'
FROM employees AS e
JOIN customers AS c
ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY e.employeeNumber
ORDER BY totalCustomers DESC;

-- Soal 4
SELECT CONCAT(e.firstname, ' ', e.lastname) AS 'Nama Karyawan',
		 p.productName AS 'Nama Produk',
		 SUM(od.quantityordered) AS 'Jumlah Pesanan'
FROM employees AS e
LEFT JOIN offices AS OF
USING(officeCode)
LEFT JOIN customers AS c
ON c.salesrepemployeeNumber = e.employeeNumber
LEFT JOIN orders
USING(customerNumber)
LEFT JOIN orderdetails AS od
USING(orderNumber)
LEFT JOIN products AS p
USING(productCode)
WHERE OF.country = 'Australia'
GROUP BY p.productName, employeeNumber
ORDER BY SUM(od.quantityordered)  DESC;

-- Soal 5
SELECT c.customerName AS 'Nama Pelanggan',
	  	 GROUP_CONCAT(p.productName ORDER BY p.productName) AS 'Nama Produk',
	  	 COUNT(p.productCode) AS 'Banyak Jenis Produk'
FROM products p
JOIN orderdetails od
USING(productCode)
JOIN orders AS o
USING(orderNumber)
JOIN customers AS c
USING(customerNumber)
WHERE o.shippedDate IS NULL 
GROUP BY c.customerName;




