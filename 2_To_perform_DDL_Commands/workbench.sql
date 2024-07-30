-- MYSQL DDL -> Data Definition Language Commands


-- Create a database
CREATE DATABASE IF NOT EXISTS bookstore;

-- Use the database
USE bookstore;

-- Create a table
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(50)
);

-- Alter table: Add a column
ALTER TABLE authors ADD COLUMN email VARCHAR(100);

-- Alter table: Modify a column
ALTER TABLE authors MODIFY COLUMN name VARCHAR(150) NOT NULL;

-- Alter table: Drop a column
ALTER TABLE authors DROP COLUMN email;

-- Create an index
CREATE INDEX idx_name ON authors(name);

-- Drop an index
DROP INDEX idx_name ON authors;

-- Truncate a table -> remove all data
TRUNCATE TABLE authors;

-- Drop a table
DROP TABLE authors;

-- Drop a database
DROP DATABASE bookstore;	