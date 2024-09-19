-- NO. 1
SELECT productcode AS 'Kode Produk', productname AS 'Nama Produk', quantityinstock AS 'Jumlah Stok' FROM products WHERE quantityinstock BETWEEN 5000 AND 6000 

-- NO. 2
SELECT ordernumber AS 'Nomor Pesanan', orderdate AS 'Tanggal Pesanan', status, customernumber AS 'Nomor Pelanggan' FROM orders WHERE STATUS!='shipped' ORDER BY customernumber 

-- NO. 3
SELECT employeenumber AS 'Nomor Karyawan', firstname, lastname, email, jobtitle AS 'Jabatan' FROM employees WHERE jobtitle='Sales Rep' ORDER BY firstname LIMIT 10

-- NO. 4
SELECT productcode AS 'Kode Produk', productname AS 'Nama Produk', productline AS 'Lini Produk', buyprice AS 'Harga Beli' FROM products ORDER BY buyprice DESC LIMIT 5, 10 

-- NO. 5 
SELECT DISTINCT country, city FROM customers ORDER BY country, city 
