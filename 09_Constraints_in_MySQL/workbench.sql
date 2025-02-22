# Constraints in MySQL
-- 0. Setting up database
CREATE DATABASE company;
USE company;

-- 1. NOT NULL: Ensures a column cannot have a NULL value
CREATE TABLE employees (
   id INT NOT NULL,
   name VARCHAR(100) NOT NULL
);

-- 2. UNIQUE: Ensures all values in a column are different
CREATE TABLE users (
   id INT,
   email VARCHAR(100) UNIQUE
);

-- 3. PRIMARY KEY: Uniquely identifies each record in a table
CREATE TABLE products (
   id INT PRIMARY KEY,
   name VARCHAR(100)
);

-- 4. FOREIGN KEY: Links two tables together
CREATE TABLE orders (
   id INT PRIMARY KEY,
   product_id INT,
   FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE SET NULL
);

-- 5. CHECK: Ensures that all values in a column satisfy a specific condition
CREATE TABLE products_price (
id INT,
product_id INT,
price DECIMAL(10,2) CHECK (price > 0),
FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- 6. DEFAULT: Sets a default value for a column when no value is specified
CREATE TABLE banner (
id INT,
status VARCHAR(20) DEFAULT 'active'
);

-- 7. AUTO_INCREMENT: Automatically generates a unique number
CREATE TABLE customers (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100)
);


DROP TABLE employees CASCADE;
DROP TABLE users CASCADE;
DROP TABLE orders CASCADE;
DROP TABLE products_price CASCADE;
DROP TABLE products CASCADE;
DROP TABLE banner CASCADE;
DROP TABLE customers CASCADE;

DROP DATABASE company;