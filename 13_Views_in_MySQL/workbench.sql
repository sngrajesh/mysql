USE bookstore;

-- Create a simple view
CREATE VIEW expensive_books AS
SELECT title, CONCAT(a.first_name, ' ', a.last_name) AS author, price
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE price > 20;

-- Query the view
SELECT * FROM expensive_books;

-- Create a view with joins
CREATE VIEW book_details AS
SELECT b.title, CONCAT(a.first_name, ' ', a.last_name) AS author_name, b.description, b.price
FROM books b
JOIN authors a ON b.author_id = a.author_id;

-- Query the complex view
SELECT * FROM book_details WHERE price > 15;

-- Update a view (if it's updatable)
UPDATE expensive_books SET price = price * 1.1 WHERE author = 'Aarav Patel';

-- Create or replace a view
CREATE OR REPLACE VIEW high_rated_books AS
SELECT b.title, CONCAT(a.first_name, ' ', a.last_name) AS author, br.rating
FROM books b
JOIN authors a ON b.author_id = a.author_id
JOIN book_reviews br ON b.book_id = br.book_id
WHERE br.rating > 4.5;

-- Drop a view
DROP VIEW IF EXISTS expensive_books;