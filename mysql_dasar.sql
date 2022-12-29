show engines;

show tables;

create table barang
(
	id INT not null,
    nama VARCHAR(100) not null default '',
    harga INT not null default 0,
    jumlah INT
) engine = InnoDB;

describe barang;

show create table barang;

alter table barang
	add column deskripsi text;
    
alter table barang
	add column salah text;
    
alter table barang
	drop column salah;
    
alter table barang
	modify nama varchar(200) after deskripsi;

alter table barang
	modify nama varchar(200) first;

alter table barang
modify id int not null;

alter table barang
modify nama varchar(200) not null;

show create table barang;

alter table barang
modify jumlah int not null default 0;

alter table barang
modify harga int not null default 0;

alter table barang
add waktu_dibuat timestamp not null default current_timestamp;

insert into barang (id, nama) values (1, 'apel');

select * from barang;

TRUNCATE BARANG;

SHOW TABLES;

DROP TABLE barang;

CREATE TABLE products(
id VARCHAR(10) NOT NULL,
name VARCHAR(100) NOT NULL,
description TEXT,
price INT UNSIGNED NOT NULL,
quantity INT UNSIGNED NOT NULL DEFAULT 0,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;

SHOW TABLES;

DESCRIBE products;

INSERT INTO products(id, name, price, quantity)
VALUES ('P0001', 'Mie Ayam Original', 15000, 100);

SELECT * FROM products;

INSERT INTO products(id, name, description, price, quantity)
VALUES ('P0002', 'Mie Ayam Baso', 'Mie Ayam Original + Baso', 20000, 100);

INSERT INTO products(id, name, price, quantity)
VALUES ('P0003', 'Mie Ayam Ceker', 20000, 100),
	   ('P0004', 'Mie Ayam Spesial', 25000, 100),
       ('P0005', 'Mie Ayam Ceker', 15000, 100);
       
INSERT INTO products(id, name, price, quantity)
VALUES ('P0006', 'Mie Ayam Yamin', 10000, 110),
	   ('P0007', 'Mie Ayam Goreng', 12000, 120),
       ('P0008', 'Nasi Goreng Ayam', 16000, 150),
       ('P0009', 'Nasi Goreng Baso', 17000, 170),
       ('P0010', 'Nasi Goreng Spesial', 22000, 180),
       ('P0011', 'Nasi Goreng Telur', 20000, 190),
       ('P0012', 'Kwetiauw Goreng Ayam', 19000, 200),
       ('P0013', 'Kwetiauw Goreng Baso', 13000, 240),
       ('P0014', 'Kwetiauw Goreng Spesial', 14000, 220),
       ('P0015', 'Kwetiauw Goreng telur', 26000, 215);

SELECT * FROM products;

SELECT id, name, price, quantity FROM products;

SELECT name, quantity, id FROM products;

ALTER TABLE products
ADD PRIMARY KEY (id);

DESCRIBE products;

SELECT id, name, price, quantity FROM products
WHERE quantity = 0;

SELECT id, name, price, quantity FROM products
WHERE quantity = 100;

SELECT id, name, price, quantity FROM products
WHERE price = 15000;

SELECT * FROM products WHERE id = 'P0001';

SELECT * FROM products WHERE name = 'Mie Ayam Baso';

DESCRIBE products;

ALTER TABLE products
ADD COLUMN category ENUM ('Makanan', 'Minuman', 'Lain-Lain') AFTER name;

SELECT * FROM products WHERE id = 'P0001';

UPDATE products
SET category = 'Makanan'
WHERE id = 'P0001';

SELECT * FROM products;

UPDATE products
SET category = 'Makanan',
	description = 'Mie Ayam Original + Ceker'
WHERE id = 'P0003';

UPDATE products
SET category = 'Makanan',
	description = 'Mie Ayam Original + Baso'
WHERE id = 'P0002';

UPDATE products
SET price = price + 5000
WHERE id = 'P0004';

UPDATE products
SET description = 'Mie Ayam Original'
WHERE id = 'P0001';

DESCRIBE products;

SELECT * FROM products;

DELETE FROM products
WHERE id = 'P0009';

INSERT INTO products(id, name, price, quantity)
VALUES ('P0009', 'Nasi Goreng Original', 10000, 200);

SELECT id AS 'Kode',
	   name AS 'Nama',
       category AS 'Kategori',
       price AS 'Harga',
       quantity AS 'Jumlah'
FROM products;

SELECT p.id AS 'Kode',
	   p.name AS 'Nama',
       p.category AS 'Kategori',
       p.price AS 'Harga',
       p.quantity AS 'Jumlah'
FROM products AS p;

SELECT * FROM products
WHERE quantity > 100;

SELECT * FROM products
WHERE quantity >= 100;

SELECT * FROM products
WHERE category = 'Makanan';

INSERT INTO products(id, name, category, price, quantity)
VALUES ('P0016', 'Es Jeruk', 'Minuman', 5000, 100),
	   ('P0017', 'Es Teh', 'Minuman', 4000, 120),
       ('P0018', 'Kerupuk', 'Lain-Lain', 500, 90),
       ('P0019', 'Acar', 'Lain-Lain', 2000, 170);

SELECT * FROM products
WHERE category != 'Makanan';

SELECT * FROM products;

SELECT * FROM products
WHERE quantity > 100 AND price > 20000;

SELECT * FROM products 
WHERE category = 'Makanan' AND price < 20000;

SELECT * FROM products
WHERE quantity > 100 OR price > 20000;

SELECT * FROM products
WHERE (category = 'Makanan' OR quantity > 500) AND price > 20000;

UPDATE products
SET category = 'Makanan'
WHERE id = 'P0005';

SELECT * FROM products
WHERE name LIKE '%mie%';

SELECT * FROM products
WHERE name LIKE '%baso%';

SELECT * FROM products
WHERE description IS NULL;

SELECT * FROM products
WHERE description IS NOT NULL;

SELECT * FROM products
WHERE price BETWEEN 10000 AND 20000;

SELECT * FROM products
WHERE price NOT BETWEEN 10000 AND 20000;

SELECT * FROM products
WHERE category IN ('Makanan', 'Minuman');

SELECT * FROM products
WHERE category NOT IN ('Makanan', 'Minuman');