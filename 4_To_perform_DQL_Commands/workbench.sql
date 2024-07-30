-- MySQL DQL Commands-> Data Query Language

USE bookstore;

-- Delete previous data
TRUNCATE TABLE authors; 

-- Insert into authors
INSERT INTO authors (id, name, birth_date, nationality)
VALUES
(1, 'Rajesh', '1996-07-31', 'Indian'),
(2, 'Ayush', '2000-09-20', 'Indian'),
(3, 'Kunal', '1990-01-01', 'Nepal'),
(4, 'Amit', '1980-01-01', 'Indian'),
(5, 'Sunny', '1995-01-01', 'Indian');

-- Basic SELECT
SELECT * FROM books;

-- SELECT with conditions
SELECT title, author FROM books WHERE price < 12.00;

-- SELECT with ORDER BY
SELECT title, price FROM books ORDER BY price DESC;

-- SELECT with GROUP BY and aggregate functions
SELECT author, COUNT(*) as book_count, AVG(price) as avg_price
FROM books
GROUP BY author;

-- SELECT with HAVING clause
SELECT author, COUNT(*) as book_count
FROM books
GROUP BY author
HAVING book_count > 1;

-- SELECT with JOIN
SELECT books.title, authors.name
FROM books
INNER JOIN authors ON books.author = authors.name;

-- Subquery in SELECT
SELECT title, price
FROM books
WHERE price > (SELECT AVG(price) FROM books);

-- SELECT with LIMIT
SELECT title, price FROM books ORDER BY price DESC LIMIT 5;
