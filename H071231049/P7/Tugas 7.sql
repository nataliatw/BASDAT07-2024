USE classicmodels:

-- Nomer 1
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice > (SELECT AVG(buyPrice) FROM products);


-- Nomer 2
SELECT orderNumber, orderDate
FROM orders
WHERE customerNumber IN (
    SELECT customerNumber
    FROM customers
    WHERE salesRepEmployeeNumber IN (
        SELECT employeeNumber
        FROM employees
        WHERE officeCode = (
            SELECT officeCode
            FROM offices
            WHERE city = 'Tokyo'
        )
    )
);
-- Nomer 3
SELECT 
	c.customerName,
   o.orderNumber,
   o.shippedDate,
   o.requiredDate,
   GROUP_CONCAT(p.productName SEPARATOR ', ') AS products,
   SUM(od.quantityOrdered) AS total_quantity_ordered,
   CONCAT(e.firstName, ' ', e.lastName) AS employeeName
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
WHERE o.shippedDate > o.requiredDate
GROUP BY o.orderNumber, o.shippedDate, o.requiredDate, c.customerName, employeeName;

-- Nomer 4
SELECT 
	productName, 
	productLine,
	( SELECT SUM(quantityOrdered) AS qo FROM orderdetails o WHERE o.productCode = p.productCode ) AS total_quantity_ordered 
FROM products p
WHERE productLine IN (
    SELECT productLine 
    FROM (
        SELECT 
            p.productLine,
            SUM(o.quantityOrdered) AS total_quantity_ordered
        FROM 
            products p
        JOIN 
            orderdetails o ON p.productCode = o.productCode
        GROUP BY 
            p.productLine
        ORDER BY 
            total_quantity_ordered DESC
         LIMIT 3
    ) AS urutan
)
GROUP BY productLine, productName
HAVING total_quantity_ordered IS NOT null
ORDER BY productline, total_quantity_ordered DESC;

-- Soal tambahan
SELECT 
	firstName,
	lastName,
	customerName,
	SUM(amount) AS totalPayment
FROM customers AS c
JOIN employees AS e
	ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments AS p
	ON c.customerNumber = p.customerNumber
GROUP BY customerName
HAVING `totalPayment` > (SELECT AVG(amount) FROM payments)
ORDER BY `totalPayment` DESC;