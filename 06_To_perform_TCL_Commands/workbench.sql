-- MySQL TCL Commands -> Transaction Control Language

USE bookstore;

SELECT * FROM books;

-- Start a transaction
START TRANSACTION;

-- Insert a new book
INSERT INTO books (title, author, price, publication_date)
VALUES 
('CSC', 'Riya', 11.99, '2002-07-16');

-- Update a book's price
UPDATE books SET price = 13.99 WHERE title = 'CSC';

-- Create a savepoint
SAVEPOINT before_delete;

-- Delete a book
DELETE FROM books WHERE title = 'Python Advance';

-- Rollback to the savepoint
ROLLBACK TO SAVEPOINT before_delete;

-- Commit the transaction
COMMIT;

-- Rollback example with new transaction
START TRANSACTION;

-- Update book detail
UPDATE books SET price = 9.99 WHERE title = 'Python Advance';

-- This will undo the update
ROLLBACK;  