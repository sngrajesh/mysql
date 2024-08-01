Use bookstore;
Drop Table IF EXISTS price_history;
Drop Table IF EXISTS orders;
Drop Table IF EXISTS book_reviews;
Drop Table IF EXISTS books;
Drop Table IF EXISTS authors ;
-- Authors table
CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE
);

-- Books table
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Book Reviews table
CREATE TABLE book_reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    rating DECIMAL(3, 2),
    review_text TEXT,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Price History table
CREATE TABLE price_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    price_change DECIMAL(10, 2),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Insert data into authors table
INSERT INTO authors (first_name, last_name, birth_date) VALUES
('Aarav', 'Patel', '1985-03-15'),
('Diya', 'Sharma', '1990-07-22'),
('Vihaan', 'Gupta', '1978-11-30'),
('Zara', 'Kapoor', '1982-09-05'),
('Arjun', 'Singh', '1995-01-18');

-- Insert data into books table
INSERT INTO books (title, author_id, description, price, publication_date) VALUES
('Echoes', 1, 'A modern Mumbai', 15.99, '2022-05-10'),
('Saffron', 2, 'Journey through India', 24.50, '2021-11-15'),
('Dharma', 3, 'Indian philosophy', 18.75, '2023-02-28'),
('Monsoon', 4, 'Indian seasons', 12.99, '2022-08-01'),
('Chakra', 5, 'Spiritual awakening', 20.50, '2023-01-10');

-- Insert data into book_reviews table
INSERT INTO book_reviews (book_id, rating, review_text) VALUES
(1, 4.5, 'Captivating plot with unexpected twists!'),
(2, 4.8, 'Beautifully written, made me hungry for Indian cuisine.'),
(3, 4.2, 'Insightful but dense at times.'),
(4, 4.0, 'Lyrical and evocative, truly captures the essence of monsoon.'),
(5, 4.7, 'Life-changing perspective on spiritual growth.');

-- Insert data into orders table
INSERT INTO orders (customer_id, created_at) VALUES
(101, '2023-05-01 10:30:00'),
(102, '2023-05-02 14:15:00'),
(103, '2023-05-03 09:45:00'),
(104, '2023-05-04 16:20:00'),
(105, '2023-05-05 11:00:00');

-- Insert data into price_history table
INSERT INTO price_history (book_id, price_change, change_date) VALUES
(1, 2.00, '2023-01-01 00:00:00'),
(2, -1.50, '2023-02-15 00:00:00'),
(3, 1.25, '2023-03-10 00:00:00'),
(4, -0.99, '2023-04-05 00:00:00'),
(5, 1.75, '2023-05-01 00:00:00');

-- String Functions
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM authors;
SELECT UPPER(title) FROM books;
SELECT SUBSTRING(description, 1, 100) AS short_desc FROM books;

-- Numeric Functions
SELECT ROUND(price, 1) FROM books;
SELECT ABS(price_change) FROM price_history;
SELECT CEIL(rating) FROM book_reviews;

-- Date Functions
SELECT DATE(created_at) FROM orders;
SELECT YEAR(publication_date) FROM books;
SELECT DATEDIFF(NOW(), publication_date) AS days_since_publication FROM books;

-- Aggregate Functions
SELECT COUNT(*) FROM books;
SELECT AVG(price) FROM books;
SELECT MAX(price) FROM books;

-- Control Flow Functions
SELECT title, 
       CASE 
           WHEN price < 10 THEN 'Budget'
           WHEN price < 20 THEN 'Standard'
           ELSE 'Premium'
       END AS price_category
FROM books;

-- Window Functions
SELECT title, price,
       RANK() OVER (ORDER BY price DESC) AS price_rank
FROM books;

-- User-Defined Function
DELIMITER //
CREATE FUNCTION calculate_discount(price DECIMAL(10,2), discount_percent INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN price - (price * discount_percent / 100);
END //
DELIMITER ;

SELECT title, price, calculate_discount(price, 10) AS discounted_price FROM books;