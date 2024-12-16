-- NO. 1
SELECT c.customername, 
CONCAT(e.firstname,' ', e.lastname) AS salesRep,  
c.creditLimit - SUM(p.amount) AS remainingCredit
FROM payments p 
JOIN customers c USING(customernumber)
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY c.customername
HAVING remainingCredit > 0;


-- NO. 2
SELECT p.productname AS 'Nama Produk',
GROUP_CONCAT(DISTINCT c.customername ORDER BY c.customername SEPARATOR ', ') AS 'Nama Customer',
COUNT(DISTINCT c.customername) AS 'Jumlah Customer',
SUM(od.quantityordered) AS 'Total Quantitas'
FROM products p
JOIN orderdetails od USING(productcode)
JOIN orders USING(ordernumber)
JOIN customers c USING(customernumber)
GROUP BY p.productname;

-- NO. 3 
SELECT CONCAT(e.firstname, ' ', e.lastname) AS employeeName,
COUNT(c.customernumber) AS totalCustomers
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY employeeName
ORDER BY totalCustomers DESC;


-- NO. 4
SELECT CONCAT(e.firstname, ' ', e.lastname) AS 'Nama Karyawan',
p.productname AS 'Nama Produk', 
SUM(od.quantityordered) AS 'Jumlah Pesanan'
FROM employees e 
LEFT JOIN offices oc USING(officecode)
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN orders o USING(customernumber)
LEFT  JOIN orderdetails od USING(ordernumber)
LEFT JOIN products p USING(productcode)
WHERE oc.country = 'Australia'
GROUP BY CONCAT(e.firstname, ' ', e.lastname), p.productname
ORDER BY SUM(od.quantityordered) DESC 

-- NO. 5
SELECT c.customername AS 'Nama Pelanggan', 
GROUP_CONCAT(p.productName) AS 'Nama Produk',
COUNT(p.productline) AS 'Banyak Jenis Produk'
FROM customers c 
JOIN orders o USING(customernumber)
JOIN orderdetails od USING(ordernumber)
JOIN products p USING(productcode)
WHERE o.shippeddate IS NULL 
GROUP BY c.customerName;