USE classicmodels;

--Nomor 1
SELECT DISTINCT c.customerName AS namaKustomer, p.productName AS namaProduk, p.productDescription AS textDescription
FROM products AS p
JOIN orderdetails AS od
	ON p.productCode = od.productCode
JOIN orders AS o
	ON od.orderNumber =  o.orderNumber
JOIN customers AS c
	ON c.customerNumber = o.customerNumber
WHERE p.productName LIKE '%Titanic%'
ORDER BY customerName;

-- Nomor 2
SELECT c.customerName, p.productName, o.status, o.shippedDate
FROM products AS p
JOIN orderdetails AS od
	ON p.productCode = od.productCode
JOIN orders AS o
	ON od.orderNumber = o.orderNumber
JOIN customers AS c
	ON c.customerNumber = o.customerNumber
WHERE p.productName LIKE '%ferrari%' AND o.status = 'Shipped' AND o.shippedDate BETWEEN '2003-10-01' AND '2004-10-01'
ORDER BY o.shippedDate DESC;

--Nomor 3
SELECT e1.firstName AS Supervisor, e2.firstName AS Karyawan
FROM employees AS e1
INNER JOIN employees AS e2
	 ON e1.employeeNumber = e2.reportsTo 
WHERE e1.firstName = 'Gerard'
ORDER BY e2.firstName;

--Nomor 4
-- A
SELECT c.customerName, p.paymentDate, e.firstName AS employeeName, p.amount
FROM customers AS c
JOIN payments AS p
	ON c.customerNumber = p.customerNumber
JOIN employees AS e
	ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '%-11-%'
ORDER BY p.amount DESC;

--B
SELECT c.customerName, p.paymentDate, e.firstName AS employeeName, p.amount
FROM customers AS c
INNER JOIN payments AS p
   ON c.customerNumber = p.customerNumber
INNER JOIN employees AS e
   ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '%-11-%'
ORDER BY p.amount DESC
LIMIT 1;

-- C
SELECT c.customerName, p.productName
FROM customers AS c
JOIN orders AS o
	ON o.customerNumber = c.customerNumber
JOIN orderdetails AS od
	ON o.orderNumber = od.orderNumber
JOIN products AS p
	ON p.productCode = od.productCode
JOIN payments AS pa
	ON pa.customerNumber = c.customerNumber
WHERE c.customerName = 'Corporate Gift Ideas Co.' AND pa.paymentDate LIKE '%-11-%';