USE classicmodels;

-- Nomer 1
SELECT c.customerName,
CONCAT(e.firstName, ' ', e.lastName)  AS salesRep,
(c.creditLimit - SUM(p.amount)) AS 'remainingCredit'
FROM customers AS c
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments AS p
USING (customerNumber)
GROUP BY (c.customerName)
HAVING remainingCredit >= 0;
 
-- Nomer 2
SELECT
	productName AS 'Nama Produk',
	GROUP_CONCAT(DISTINCT c.customerName ORDER BY c.customerName SEPARATOR ',') AS 'Nama Customer',
	COUNT(DISTINCT c.customerNumber) AS 'Jumlah Customer',
	SUM(od.quantityOrdered) AS 'Total Quantitas'
FROM customers AS c
JOIN orders AS o
	ON o.customerNumber = c.customerNumber
JOIN orderdetails AS od
	ON od.orderNumber = o.orderNumber
JOIN products AS p
	ON p.productCode = od.productCode
GROUP BY 
	p.productName;	

-- Nomer 3
SELECT 
   CONCAT(e.firstName, ' ', e.lastName) AS 'employeeName',
   COUNT(c.customerNumber) AS 'totalCustomers'
FROM employees AS e
JOIN customers AS c
	ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY `employeeName`
ORDER BY `totalCustomers` DESC;

-- Nomer 4
SELECT
   CONCAT(e.firstName, ' ', e.lastName) AS 'Employee Name',
   p.productName AS 'Product Name',
   SUM(od.quantityOrdered) AS 'Total Quantity Ordered'
FROM products AS p
JOIN orderdetails AS od
USING (productCode)
JOIN orders AS o
USING (orderNumber)
JOIN customers AS c
USING (customerNumber)
RIGHT JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices AS oc
USING (officeCode)
WHERE oc.country = 'Australia'
GROUP BY `Employee Name`, p.productName
ORDER BY `Total Quantity Ordered` DESC;

-- Nomer 5
SELECT c.customerName,
p.productName, COUNT(p.productLine) AS "Banyak Jenis Produk"
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE (o.shippedDate IS NULL)
GROUP BY (c.customerName);