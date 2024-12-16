-- Nama  : Harmelia Yuli Rahmatika. A
-- NIM   : H071231079

-- TUGAS 2
USE classicmodels;

-- soal 1
SELECT productCode AS 'Kode Produk', 
productName AS 'Nama Produk', 
quantityInStock AS 'Jumlah Stok'
FROM products
WHERE quantityInStock BETWEEN 5000 AND 6000
ORDER BY quantityInStock;

-- soal2
SELECT orderNumber AS 'Nomor Pesanan', 
orderDate AS 'Tanggal Pesanan', 
STATUS, 
customerNumber AS 'Nomor Pelanggan'
FROM orders
WHERE STATUS != 'Shipped'
ORDER BY customerNumber;

-- soal 3
SELECT employeeNumber AS 'Nomor Karyawan',
firstName, lastName, email, jobTitle AS 'Jabatan'
FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY firstName
LIMIT 10;

-- soal 4
SELECT productCode AS 'Kode Produk',
productName AS 'Nama Produk',
productLine AS 'Lini Produk',
buyPrice AS 'Harga Beli'
FROM products
ORDER BY buyPrice DESC
LIMIT 10 OFFSET 5;

-- soal 5
SELECT DISTINCT country, city FROM customers
ORDER BY country, city;

-- soal tambahan 
SELECT customerName AS 'Nama Pelanggan',
phone AS 'Nomor Telepon',
addressLine1 AS 'Alamat Utama',
city AS 'Kota',
creditLimit AS 'Limit Kredit'
FROM customers 
WHERE country = 'Germany' 
ORDER BY creditLimit DESC
LIMIT 3;


 