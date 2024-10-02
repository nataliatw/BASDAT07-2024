-- NO. 1
SELECT customernumber, customername, country FROM customers
WHERE (country = 'USA' AND creditlimit BETWEEN 50000 AND  100000) 
OR (country != 'USA' AND creditlimit BETWEEN 100000 AND 200000)
ORDER BY creditlimit DESC;


-- NO. 2
SELECT productcode, productname, quantityinstock, buyprice FROM products
WHERE quantityinstock BETWEEN 1000 AND 2000
AND (buyprice < 50 OR buyprice > 150)
AND productline NOT LIKE 'Vintage%';


-- NO. 3
SELECT productcode, productname, msrp FROM products
WHERE productline LIKE 'Classic%' AND buyprice > 50;


-- NO.4
SELECT ordernumber, orderdate, status, customernumber FROM orders
WHERE ordernumber > 10250 
AND STATUS NOT IN ('Shipped', 'Cancelled') 
AND (orderdate > '2003-12-31' AND  orderdate <'2006-01-01');


-- NO. 5
SELECT ordernumber, orderlinenumber, productcode, quantityordered ,priceeach , 
(quantityordered * priceeach * 0.95) discountedtotalprice
FROM orderdetails
WHERE quantityordered > 50
AND priceeach > 100
AND productcode NOT LIKE 'S18%'
ORDER BY discountedtotalprice DESC; 

