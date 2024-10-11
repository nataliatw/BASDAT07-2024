--soal 1
SELECT 
	customerNumber,
	customerName,
	country,
	creditLimit
FROM customers
WHERE country = 'USA' AND creditLimit > 50000 AND creditLimit < 100000  OR country <> 'USA' AND creditLimit BETWEEN 100000 AND 200000
ORDER BY creditLimit DESC;

--soal 2
SELECT 
	productCode,
	productName,
	quantityInStock,
	buyPrice,
	productLine
FROM products
WHERE quantityInStock >= 1000 AND quantityInStock <= 2000 AND buyPrice < 50 OR buyPrice > 150 AND productLine LIKE '%vintage%'; 

--soal 3
SELECT 
	productCode,
	productName,
	MSRP
FROM products
WHERE productLine LIKE '%Classic%' AND buyPrice > 50;

--soal 4
SELECT ordernumber, orderdate, STATUS, customernumber FROM orders
WHERE ordernumber >10250 AND STATUS != 'shipped' AND STATUS  !='cancelled' AND 
orderdate BETWEEN '2004-01-01' AND '2005-12-31';

--soal 5
SELECT ordernumber,orderlinenumber ,productcode, quantityordered, priceeach, priceeach - (priceeach * 0.05)  AS hasildiskon FROM orderdetails 
WHERE quantityordered > 50 AND priceeach > 100 AND productcode != '%S18%' 
ORDER BY hasildiskon DESC;

--soal Bonus
SELECT 
	customerName,
	country
FROM customers
WHERE customerName LIKE '%Gifts%' AND country IN ('France','Germany','Norway','Singapore');
