-- NO. 1
SELECT productCode, productName, buyPrice 
FROM products 
WHERE buyPrice > (
							SELECT AVG(buyPrice) FROM products
						);
		
-- NO. 2
SELECT orderNumber, orderDate
FROM orders  
JOIN customers c USING(customerNumber)
WHERE c.salesRepEmployeeNumber IN (
	SELECT employeeNumber FROM employees
	JOIN offices f USING(officeCode)
	WHERE f.city = 'Tokyo'
);



-- NO. 3
SELECT c.customerName, o.orderNumber, o.shippedDate, o.requiredDate, 
GROUP_CONCAT(p.productName SEPARATOR ',') AS products,
SUM(od.quantityOrdered) total_quantity_ordered, 
CONCAT(e.firstName, ' ', e.lastName) AS employeeName
FROM customers c 
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING(orderNumber)
JOIN products p USING(productCode)
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE o.orderNumber IN (
		SELECT orderNumber FROM orders WHERE shippedDate > requiredDate 
	);

-- NO. 4
SELECT 
	p.productName,
	p.productLine,
	SUM(od.quantityOrdered) AS total_quantity_ordered
FROM products p
JOIN orderdetails od
USING(productCode)
WHERE p.productLine IN 
(
	SELECT productline
	FROM (
		SELECT p2.productline FROM products  p2
		JOIN orderdetails od2
		USING(productCode)
		GROUP BY p2.productline
		ORDER BY SUM(od2.quantityOrdered) DESC 
		LIMIT 3
	) AS sesuatu 
)
GROUP BY productName, productline
ORDER BY productline, total_quantity_ordered DESC;


-- Soal Tambahan
SELECT e.firstName, e.lastName, c.customerName, SUM(p.amount) totalPayment
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p USING(customernumber)
GROUP BY c.customerNumber
HAVING SUM(p.amount) > (
	SELECT AVG(amount) FROM payments
)
ORDER BY totalPayment DESC;


		