USE classicmodels;


-- Nomer 1
SELECT DISTINCT
	customerName AS namaKustomer,
	productName AS namaProduk,
	textDescription
	FROM customers AS c
JOIN orders AS o
	ON o.customerNumber = c.customerNumber
JOIN orderdetails AS od
	ON od.orderNumber = o.orderNumber
JOIN products AS p
	ON p.productCode = od.productCode
JOIN productlines AS pl
	ON p.productLine = pl.productLine
WHERE productName LIKE '%Titanic%'
ORDER BY customerName;

-- Nomer 2
SELECT 
	customerName,
	productName,
	STATUS,
	shippedDate
FROM customers AS c
JOIN orders AS o
	ON o.customerNumber = c.customerNumber
JOIN orderdetails AS od
	ON od.orderNumber = o.orderNumber
JOIN products AS p
	ON p.productCode = od.productCode
WHERE productName LIKE '%Ferrari%' 
AND STATUS = 'Shipped' 
AND shippedDate BETWEEN '2003-10-01' AND '2004-10-01';

-- Nomer 3
SELECT 
    s.firstName AS Supervisor,
    e.lastName AS Karyawan
FROM employees e
JOIN employees s 
	ON e.reportsTo = s.employeeNumber
WHERE s.firstName = 'Gerard'
ORDER BY e.firstName ASC, e.lastName ASC;

-- Nomer 4 (a)
SELECT
	customerName,
	paymentDate,
	lastName AS employeeName,
	amount
FROM customers AS c
JOIN payments AS p
	ON c.customerNumber = p.customerNumber
JOIN employees AS e
	ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE paymentDate LIKE '____-11-__';

-- Nomer 4 (b)
SELECT
	customerName,
	paymentDate,
	lastName AS employeeName,
	amount
FROM customers AS c
JOIN payments AS p
	ON c.customerNumber = p.customerNumber
JOIN employees AS e
	ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE paymentDate LIKE '____-11-__'
ORDER BY amount DESC
LIMIT 1;

-- Nomer 4(c)
SELECT
	customerName,
	productName,
FROM customers AS c
JOIN orders AS o
	ON o.customerNumber = c.customerNumber
JOIN orderdetails AS od
	ON od.orderNumber = o.orderNumber
JOIN products AS p
	ON p.productCode = od.productCode
JOIN payments AS pa
	ON pa.customerNumber = c.customerNumber
WHERE customerName = 'Corporate Gift Ideas Co.' AND paymentDate LIKE '____-11-__';

-- Soal Tambahan
SELECT 
	customerName,
	o.orderNumber,
	orderDate,
	shippedDate,
	productName,
	quantityOrdered,
	buyPrice,
	os.city,
	firstName,
	lastName
FROM customers AS c
JOIN orders AS o
	ON o.customerNumber = c.customerNumber
JOIN orderdetails AS od
	ON od.orderNumber = o.orderNumber
JOIN products AS p
	ON p.productCode = od.productCode
JOIN employees AS e
	ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN offices AS os
	ON os.officeCode = e.officeCode
WHERE productName LIKE '%69%'
AND orderDate BETWEEN '2003-07-01' AND '2003-12-31'
AND os.city = 'Paris' OR os.city = 'London'
AND buyPrice > 70
ORDER BY quantityOrdered DESC;