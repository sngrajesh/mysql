```bash
rajesh@singh:~$ sudo mysql -u root -b
[sudo] password for rajesh: 
sudo: a password is required
rajesh@singh:~$ sudo mysql -u root -p
[sudo] password for rajesh: 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.37-0ubuntu0.22.04.3 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> Use bookstore;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> Drop Table IF EXISTS price_history;
Query OK, 0 rows affected (0.65 sec)

mysql> Drop Table IF EXISTS orders;
Query OK, 0 rows affected (0.98 sec)

mysql> Drop Table IF EXISTS book_reviews;
Query OK, 0 rows affected (0.50 sec)

mysql> Drop Table IF EXISTS books;
Query OK, 0 rows affected (0.45 sec)

mysql> Drop Table IF EXISTS authors ;
Query OK, 0 rows affected (0.48 sec)

mysql> CREATE TABLE authors (
    ->     author_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     first_name VARCHAR(50) NOT NULL,
    ->     last_name VARCHAR(50) NOT NULL,
    ->     birth_date DATE
    -> );
Query OK, 0 rows affected (1.07 sec)

mysql> 
mysql> CREATE TABLE books (
    ->     book_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     title VARCHAR(255) NOT NULL,
    ->     author_id INT,
    ->     description TEXT,
    ->     price DECIMAL(10, 2) NOT NULL,
    ->     publication_date DATE,
    ->     FOREIGN KEY (author_id) REFERENCES authors(author_id)
    -> );
Query OK, 0 rows affected (0.91 sec)

mysql> 
mysql> CREATE TABLE book_reviews (
    ->     review_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     book_id INT,
    ->     rating DECIMAL(3, 2),
    ->     review_text TEXT,
    ->     FOREIGN KEY (book_id) REFERENCES books(book_id)
    -> );
Query OK, 0 rows affected (0.88 sec)

mysql> 
mysql> CREATE TABLE orders (
    ->     order_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     customer_id INT,
    ->     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.74 sec)

mysql> 
mysql> CREATE TABLE price_history (
    ->     history_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     book_id INT,
    ->     price_change DECIMAL(10, 2),
    ->     change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (book_id) REFERENCES books(book_id)
    -> );
Query OK, 0 rows affected (0.91 sec)

mysql> 
mysql> -- Insert data into authors table
mysql> INSERT INTO authors (first_name, last_name, birth_date) VALUES
    -> ('Aarav', 'Patel', '1985-03-15'),
    -> ('Diya', 'Sharma', '1990-07-22'),
    -> ('Vihaan', 'Gupta', '1978-11-30'),
    -> ('Zara', 'Kapoor', '1982-09-05'),
    -> ('Arjun', 'Singh', '1995-01-18');
Query OK, 5 rows affected (0.15 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Insert data into books table
mysql> INSERT INTO books (title, author_id, description, price, publication_date) VALUES
    -> ('Echoes', 1, 'A modern Mumbai', 15.99, '2022-05-10'),
    -> ('Saffron', 2, 'Journey through India', 24.50, '2021-11-15'),
    -> ('Dharma', 3, 'Indian philosophy', 18.75, '2023-02-28'),
    -> ('Monsoon', 4, 'Indian seasons', 12.99, '2022-08-01'),
    -> ('Chakra', 5, 'Spiritual awakening', 20.50, '2023-01-10');
Query OK, 5 rows affected (0.14 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Insert data into book_reviews table
mysql> INSERT INTO book_reviews (book_id, rating, review_text) VALUES
    -> (1, 4.5, 'Captivating plot with unexpected twists!'),
    -> (2, 4.8, 'Beautifully written, made me hungry for Indian cuisine.'),
    -> (3, 4.2, 'Insightful but dense at times.'),
    -> (4, 4.0, 'Lyrical and evocative, truly captures the essence of monsoon.'),
    -> (5, 4.7, 'Life-changing perspective on spiritual growth.');
Query OK, 5 rows affected (0.20 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Insert data into orders table
mysql> INSERT INTO orders (customer_id, created_at) VALUES
    -> (101, '2023-05-01 10:30:00'),
    -> (102, '2023-05-02 14:15:00'),
    -> (103, '2023-05-03 09:45:00'),
    -> (104, '2023-05-04 16:20:00'),
    -> (105, '2023-05-05 11:00:00');
Query OK, 5 rows affected (0.10 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Insert data into price_history table
mysql> INSERT INTO price_history (book_id, price_change, change_date) VALUES
    -> (1, 2.00, '2023-01-01 00:00:00'),
    -> (2, -1.50, '2023-02-15 00:00:00'),
    -> (3, 1.25, '2023-03-10 00:00:00'),
    -> (4, -0.99, '2023-04-05 00:00:00'),
    -> (5, 1.75, '2023-05-01 00:00:00');
Query OK, 5 rows affected (0.15 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- String Functions
mysql> SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM authors;
+--------------+
| full_name    |
+--------------+
| Aarav Patel  |
| Diya Sharma  |
| Vihaan Gupta |
| Zara Kapoor  |
| Arjun Singh  |
+--------------+
5 rows in set (0.00 sec)

mysql> SELECT UPPER(title) FROM books;
+--------------+
| UPPER(title) |
+--------------+
| ECHOES       |
| SAFFRON      |
| DHARMA       |
| MONSOON      |
| CHAKRA       |
+--------------+
5 rows in set (0.00 sec)

mysql> SELECT SUBSTRING(description, 1, 100) AS short_desc FROM books;
+-----------------------+
| short_desc            |
+-----------------------+
| A modern Mumbai       |
| Journey through India |
| Indian philosophy     |
| Indian seasons        |
| Spiritual awakening   |
+-----------------------+
5 rows in set (0.00 sec)

mysql> 
mysql> -- Numeric Functions
mysql> SELECT ROUND(price, 1) FROM books;
+-----------------+
| ROUND(price, 1) |
+-----------------+
|            16.0 |
|            24.5 |
|            18.8 |
|            13.0 |
|            20.5 |
+-----------------+
5 rows in set (0.00 sec)

mysql> SELECT ABS(price_change) FROM price_history;
+-------------------+
| ABS(price_change) |
+-------------------+
|              2.00 |
|              1.50 |
|              1.25 |
|              0.99 |
|              1.75 |
+-------------------+
5 rows in set (0.00 sec)

mysql> SELECT CEIL(rating) FROM book_reviews;
+--------------+
| CEIL(rating) |
+--------------+
|            5 |
|            5 |
|            5 |
|            4 |
|            5 |
+--------------+
5 rows in set (0.00 sec)

mysql> 
mysql> -- Date Functions
mysql> SELECT DATE(created_at) FROM orders;
+------------------+
| DATE(created_at) |
+------------------+
| 2023-05-01       |
| 2023-05-02       |
| 2023-05-03       |
| 2023-05-04       |
| 2023-05-05       |
+------------------+
5 rows in set (0.00 sec)

mysql> SELECT YEAR(publication_date) FROM books;
+------------------------+
| YEAR(publication_date) |
+------------------------+
|                   2022 |
|                   2021 |
|                   2023 |
|                   2022 |
|                   2023 |
+------------------------+
5 rows in set (0.00 sec)

mysql> SELECT DATEDIFF(NOW(), publication_date) AS days_since_publication FROM books;
+------------------------+
| days_since_publication |
+------------------------+
|                    814 |
|                    990 |
|                    520 |
|                    731 |
|                    569 |
+------------------------+
5 rows in set (0.00 sec)

mysql> 
mysql> -- Aggregate Functions
mysql> SELECT COUNT(*) FROM books;
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT AVG(price) FROM books;
+------------+
| AVG(price) |
+------------+
|  18.546000 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(price) FROM books;
+------------+
| MAX(price) |
+------------+
|      24.50 |
+------------+
1 row in set (0.00 sec)

mysql> 
mysql> -- Control Flow Functions
mysql> SELECT title, 
    ->        CASE 
    ->            WHEN price < 10 THEN 'Budget'
    ->            WHEN price < 20 THEN 'Standard'
    ->            ELSE 'Premium'
    ->        END AS price_category
    -> FROM books;
+---------+----------------+
| title   | price_category |
+---------+----------------+
| Echoes  | Standard       |
| Saffron | Premium        |
| Dharma  | Standard       |
| Monsoon | Standard       |
| Chakra  | Premium        |
+---------+----------------+
5 rows in set (0.00 sec)

mysql> 
mysql> -- Window Functions
mysql> SELECT title, price,
    ->        RANK() OVER (ORDER BY price DESC) AS price_rank
    -> FROM books;
+---------+-------+------------+
| title   | price | price_rank |
+---------+-------+------------+
| Saffron | 24.50 |          1 |
| Chakra  | 20.50 |          2 |
| Dharma  | 18.75 |          3 |
| Echoes  | 15.99 |          4 |
| Monsoon | 12.99 |          5 |
+---------+-------+------------+
5 rows in set (0.00 sec)

mysql> 
mysql> -- User-Defined Function
mysql> DELIMITER //
mysql> CREATE FUNCTION calculate_discount(price DECIMAL(10,2), discount_percent INT)
    -> RETURNS DECIMAL(10,2)
    -> DETERMINISTIC
    -> BEGIN
    ->     RETURN price - (price * discount_percent / 100);
    -> END //
mysql> DELIMITER ;
mysql> 
mysql> SELECT title, price, calculate_discount(price, 10) AS discounted_price FROM books;
+---------+-------+------------------+
| title   | price | discounted_price |
+---------+-------+------------------+
| Echoes  | 15.99 |            14.39 |
| Saffron | 24.50 |            22.05 |
| Dharma  | 18.75 |            16.88 |
| Monsoon | 12.99 |            11.69 |
| Chakra  | 20.50 |            18.45 |
+---------+-------+------------------+
5 rows in set, 3 warnings (0.00 sec)

mysql> exit
Bye

```