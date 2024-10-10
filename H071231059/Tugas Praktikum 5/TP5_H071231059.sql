-- NO. 1
SELECT DISTINCT c.customername AS namaKostumer, p.productName AS namaProduk, pl.textDescription 
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails  od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productcode = p.productcode
JOIN productlines pl ON p.productline = pl.productline
WHERE productName LIKE '%Titanic%' ORDER BY customername;


-- NO. 2
SELECT c.customernumber, p.productname, o.status, o.shippeddate
FROM customers c
JOIN orders o ON c.customernumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
WHERE productName LIKE '%ferrari%' 
AND status = 'Shipped'
AND (shippedDate BETWEEN '2003-10-01' AND '2004-10-01')
ORDER BY shippedDate DESC;


-- NO. 3
SELECT s.firstname AS Supervisor, k.firstname AS Karyawan
FROM employees s
JOIN employees k ON s.employeeNumber = k.reportsTo
WHERE s.firstname = 'Gerard'
ORDER BY Karyawan;


-- No. 4 bagian A
SELECT c.customername, p.paymentdate, e.firstname AS employeeName, p.amount
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '%-11-%';

-- NO. 4 bagian B
SELECT c.customername, p.paymentdate, e.firstname, p.amount
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '%-11-%' 
ORDER BY p.amount DESC LIMIT 1;

-- NO. 4 bagian C
SELECT c.customername, p.productname
FROM customers c
JOIN orders o ON c.customernumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
JOIN payments pay ON c.customerNumber = pay.customerNumber
WHERE c.customername = 'Corporate Gift Ideas Co.'
AND pay.paymentDate LIKE '%-11-%' 

 





SELECT * FROM employees;
SELECT * FROM offices
