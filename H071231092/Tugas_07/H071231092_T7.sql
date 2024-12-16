# Nomor 1
SELECT 
	p.productCode,
	p.productName,
	p.buyPrice
FROM products p
WHERE buyPrice > (SELECT AVG(buyPrice) FROM products);

# Nomor 2
SELECT
	o.orderNumber,
	o.orderDate
FROM orders o
JOIN customers c
USING(customerNumber)
WHERE c.salesRepEmployeeNumber IN (
	SELECT e.employeeNumber
	FROM employees e
	JOIN offices os
	USING(officeCode)
	WHERE os.city = 'Tokyo'
);	

# Nomor 3
SELECT 
	c.customerName,
	o.orderNumber,
	o.shippedDate,
	o.requiredDate,
	GROUP_CONCAT(p.productName SEPARATOR ', ') AS 'product',
	SUM(od.quantityOrdered) AS 'total_quantity_ordered',
	CONCAT(e.firstName, ' ', e.lastName) AS 'employeeName'
FROM customers c
JOIN orders o
USING(customerNumber)
JOIN orderdetails od
USING(orderNumber)
JOIN products p
USING(productCode)
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE o.shippedDate > o.requiredDate
GROUP BY c.customerName, o.orderNumber, o.shippedDate, o.requiredDate, e.firstName, e.lastName;

# Nomor 4
SELECT 
	p.productName,
	p.productLine,
	SUM(od.quantityOrdered) AS 'total_quantity_ordered'
FROM products p
JOIN orderdetails od
USING(productCode)
WHERE p.productLine IN (
	SELECT productLine FROM (
		SELECT p2.productLine,
			SUM(od2.quantityOrdered) AS 'total'
			FROM products p2
			JOIN orderdetails od2
			USING(productCode)
			GROUP BY p2.productLine
			ORDER BY `total` DESC
			LIMIT 3
		) AS top3
)		
GROUP BY p.productName, p.productLine
ORDER BY p.productLine,`total_quantity_ordered` DESC;

#soal tambahan
SELECT 
    e.firstName,
    e.lastName,
    c.customerName,
    SUM(p.amount) AS totalPayment
FROM employees e
JOIN customers c
    ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p
    USING (customerNumber)
GROUP BY e.firstName, e.lastName, c.customerName
HAVING SUM(p.amount) > (
    SELECT AVG(p2.amount)
    FROM payments p2
)
ORDER BY totalPayment DESC;


