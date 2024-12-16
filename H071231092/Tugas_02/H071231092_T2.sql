#nomor 1
SELECT productCode AS `Kode Produk`, productName AS `Nama Produk`, quantityInStock AS `Jumlah Stok` FROM products
WHERE quantityInStock BETWEEN 5000 AND 6000;

#nomor 2
SELECT orderNumber AS `Nomor Pesanan`, orderDate AS `Tanggal Pesanan`, STATUS, customerNumber AS `Nomor Pelanggan` FROM orders
WHERE STATUS != 'Shipped'
ORDER BY `Nomor Pelanggan`;

#nomor 3
SELECT employeeNumber AS `Nomor Karyawan`, firstname, lastname, email, jobTitle AS `Jabatan` FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY firstName
LIMIT 10;

#nomor 4
SELECT productCode AS `Kode Produk`, productName AS `Nama Produk`, productLine AS `Lini Produk`, buyPrice AS `Harga Beli` FROM products
ORDER BY `Harga Beli` DESC
LIMIT 10 OFFSET 5;

#nomor 5
SELECT DISTINCT country, city FROM customers
ORDER BY country;

#Soal Tambahan
SELECT firstName AS `Nama Depan`, lastName AS `Nama Belakang`, officeCode AS `Code Kantor`, email AS `E-mail` FROM employees
WHERE jobTitle = 'Sales Rep' AND officeCode = 1 OR officeCode = 3 OR officeCode = 5 OR officeCode = 7
ORDER BY `Nama Depan`;