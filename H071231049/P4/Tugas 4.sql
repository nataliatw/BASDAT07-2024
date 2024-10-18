USE classicmodels;

-- Nomer 1
SELECT customerNumber, customerName, country FROM customers
WHERE country = 'USA' AND creditLimit > 50000  AND creditLimit < 100000
OR country != 'USA' AND creditLimit >= 100000 AND creditLimit <= 200000
ORDER BY creditLimit DESC;

-- Nomer 2
SELECT productCode, productName, quantityInStock, buyPrice FROM products
WHERE quantityInStock BETWEEN 1000 AND 2000
AND buyPrice < 50 OR buyPrice > 150
AND productLine <> 'Vintage Cars';

-- Nomer 3
SELECT productCode, productName, MSRP FROM products
WHERE productLine LIKE '%Classic%' AND buyPrice > 50;

-- Nomer 4
SELECT orderNumber, orderDate, status, customerNumber FROM orders
WHERE orderNumber > 10205 
AND status NOT IN ('Shipped', 'Cancelled')
AND orderDate >= '2004-01-01' AND orderDate <= '2005-12-31';

-- Nomer 5
SELECT *, quantityOrdered * (priceEach * 0.95) AS discountedTotalPrice FROM orderdetails
WHERE quantityOrdered > 50 AND priceEach > 100 AND productCode NOT LIKE 'S18%'
ORDER BY discountedTotalPrice DESC;

-- Soal Tambahan
SELECT * FROM customers
WHERE customerName LIKE '%Gifts%' AND 
country IN ('France', 'Germany', 'Norway', 'Singapore');