-- Basic MySQL Queries

-- Create a database
CREATE DATABASE bookstore;

-- Use the database
USE bookstore;

-- Create a table
CREATE TABLE books (
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	author VARCHAR(100) NOT NULL,
	price DECIMAL(10, 2),
	publication_date DATE
);

-- Insert data
INSERT INTO books (title, author, price, publication_date)
VALUES ('My python', 'R. Singh', 12.99, '2024-04-10');

-- Select data
SELECT * FROM books;

-- Update data
UPDATE books SET price = 14.99 WHERE id = 1;

-- Delete data
DELETE FROM books WHERE id = 1;
