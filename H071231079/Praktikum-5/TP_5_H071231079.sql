-- Nama : Harmelia Yuli Rahmatika. A
-- NIM  : H071231079

USE classicmodels;

-- Soal 1
SELECT DISTINCT
		c.customerName AS namaKustomer,
		p.productName AS namaProduk,
		p.productDescription AS textDescription
FROM customers AS c
INNER JOIN orders
USING(customerNumber)
INNER JOIN orderdetails 
USING (orderNumber)
INNER JOIN products AS p
USING (productCode)
WHERE p.productname LIKE '%Titanic%'
ORDER BY c.customerName;
 
 
-- Soal 2
SELECT 
		c.customerName,
		p.productName,
		o.status,
		o.shippedDate
FROM customers AS c
INNER JOIN orders AS o
USING (customerNumber)
INNER JOIN orderdetails 
USING(orderNumber)
INNER JOIN products AS p
USING (productCode)
WHERE (p.productName  LIKE '%Ferrari%')
AND (o.status = 'Shipped')
AND (o.shippedDate BETWEEN '2003-10-1' AND '2004-10-1');

-- Soal 3
SELECT
		CONCAT(e2.firstname, ' ', e2.lastname) AS Supervisor,
		CONCAT(e1.firstname, ' ', e1.lastname) AS Karyawan
FROM employees AS e1
INNER JOIN employees AS e2
ON e1.reportsTo = e2.employeeNumber
WHERE e2.firstname = 'Gerard'
ORDER BY e1.firstname;

-- Soal 4
SELECT
		c.customerName,
		py.paymentDate,
		CONCAT(e.firstName, ' ', e.lastName) AS employeeName,
		py.amount
FROM customers AS c
INNER JOIN payments AS py
USING(customerNumber)
INNER JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE (py.paymentDate LIKE '%-11-%');

-- b
SELECT
		c.customerName,
		py.paymentDate,
		CONCAT(e.firstName, ' ', e.lastName) AS employeeName,
		py.amount
FROM customers AS c
INNER JOIN payments AS py
USING(customerNumber)
INNER JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE (py.paymentDate LIKE '%-11-%')
ORDER BY amount DESC 
LIMIT 1;

-- c
SELECT 
		c.customerName,
		p.productName
FROM customers AS c
INNER JOIN orders
USING(customerNumber)
INNER JOIN orderdetails
USING(orderNumber)
INNER JOIN products AS p
USING(productCode)
WHERE c.customerName = 'Corporate Gift Ideas Co.';

-- Soal Tambahan 
SELECT 
		c.customerName,
		o.orderNumber,
		o.orderDate,
		o.shippedDate,
		p.productName,
		od.priceEach,
		od.quantityOrdered,
		c.city,
		e.firstname,
		e.lastname
FROM customers AS c
INNER JOIN orders AS o
USING(customerNumber)
INNER JOIN orderdetails AS od
USING(orderNumber)
INNER JOIN products AS p
USING(productCode)
INNER JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE (p.productName LIKE '1%r')
AND (o.orderDate < '2004-12-25')
AND (od.quantityOrdered > 10)
AND (c.city = 'NYC')
AND (od.priceEach BETWEEN 20 AND 100)
ORDER BY c.customerName, o.orderDate DESC;

		
		