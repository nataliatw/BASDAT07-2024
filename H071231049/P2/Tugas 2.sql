USE classicmodels;

-- Nomer 1
SELECT productCode AS 'Kode Produk', productName AS 'Nama Produk', quantityInStock AS 'Jumlah Stok'  FROM products
WHERE quantityInStock >= 5000 AND quantityInStock <= 6000;

-- Nomer 2
SELECT orderNumber AS 'Nomor Pesanan', orderDate AS 'Tanggal Pesanan', STATUS, customerNumber AS 'Nomor Pelanggan' FROM orders
WHERE STATUS != 'Shipped'
ORDER BY customerNumber;

-- Nomer 3
SELECT employeeNumber AS 'Nomor Karyawan', firstName, lastName, email, jobTitle AS 'Jabatan' FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY firstName
LIMIT 10;

-- Nomer 4
SELECT productCode AS 'Kode Produk', productName AS 'Nama Produk', productLine AS 'Lini Produk', buyPrice AS 'Harga Beli' FROM products
ORDER BY buyPrice DESC
LIMIT 5, 10;

-- Nomer 5
SELECT DISTINCT country, city FROM customers
ORDER BY country, city;

-- Nomer Tambahan
SELECT DISTINCT productVendor, productLine, productScale FROM products
WHERE productLine = 'Planes'
ORDER BY productVendor DESC;

SELECT * FROM employees