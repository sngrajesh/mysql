```bash
rajesh@singh:~$ sudo mysql -u root -p
[sudo] password for rajesh: 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 69
Server version: 8.0.37-0ubuntu0.22.04.3 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE company;
Query OK, 1 row affected (0.25 sec)

mysql> USE company;
Database changed
mysql> CREATE TABLE employees (
    ->    id INT NOT NULL,
    ->    name VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.86 sec)

mysql> CREATE TABLE users (
    ->    id INT,
    ->    email VARCHAR(100) UNIQUE
    -> );

Query OK, 0 rows affected (1.18 sec)

mysql> 
mysql> CREATE TABLE products (
    ->    id INT PRIMARY KEY,
    ->    name VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.88 sec)

mysql> CREATE TABLE orders (
    ->    id INT PRIMARY KEY,
    ->    product_id INT,
    ->    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE SET NULL
    -> );
Query OK, 0 rows affected (2.25 sec)

mysql> CREATE TABLE products_price (
    -> id INT,
    -> product_id INT,
    -> price DECIMAL(10,2) CHECK (price > 0),
    -> FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (2.29 sec)

mysql> CREATE TABLE banner (
    -> id INT,
    -> status VARCHAR(20) DEFAULT 'active'
    -> );
Query OK, 0 rows affected (1.49 sec)

mysql> CREATE TABLE customers (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(100)
    -> );
	Query OK, 0 rows affected (0.84 sec)

mysql> DROP TABLE employees CASCADE;
Query OK, 0 rows affected (0.47 sec)

mysql> DROP TABLE users CASCADE;
Query OK, 0 rows affected (0.50 sec)

mysql> DROP TABLE orders CASCADE;
Query OK, 0 rows affected (1.65 sec)

mysql> DROP TABLE products_price CASCADE;
Query OK, 0 rows affected (0.69 sec)

mysql> DROP TABLE products CASCADE;
Query OK, 0 rows affected (0.52 sec)

mysql> DROP TABLE banner CASCADE;
Query OK, 0 rows affected (0.64 sec)

mysql> DROP TABLE customers CASCADE;
Query OK, 0 rows affected (0.52 sec)

mysql> 
mysql> DROP DATABASE company;
Query OK, 0 rows affected (0.16 sec)

mysql> exit
Bye

```