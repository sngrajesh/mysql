-- MySQL DML -> Data Manipulation Language Commands

-- Deleting all data before starting
TRUNCATE TABLE books;

-- Insert a single row
INSERT INTO books (title, author, price, publication_date)
VALUES ('Python Beginners', 'Ayush', 11.99, '2001-07-11');

-- Insert multiple rows
INSERT INTO books (title, author, price, publication_date)
VALUES 
('Python Advance', 'Kunal', 10.99, '2005-06-08'),
('Python for experts', 'Rajesh', 9.99, '2010-01-28');

-- Update data
UPDATE books SET price = 12.99 WHERE id = 1;

-- Delete data
DELETE FROM books WHERE publication_date < '2002-01-01';

-- Replace data
REPLACE INTO books (id, title, author, price, publication_date)
VALUES (1, 'Python for beginners', 'Ayush', 13.99, '2001-07-11');

SELECT * FROM books;
