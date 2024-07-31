-- Keys operation in MySQL

/*
1. Primary Key: 
   - Uniquely identifies each record in a table
   - Cannot contain NULL values
   - Example: `id INT PRIMARY KEY`

2. Foreign Key: 
   - Creates a link between two tables
   - References the primary key of another table
   - Example: `author_id INT, FOREIGN KEY (author_id) REFERENCES authors(id)`

3. Unique Key: 
   - Ensures all values in a column are different
   - Can contain NULL values
   - Example: `email VARCHAR(100) UNIQUE`

4. Composite Key: 
   - A key that consists of multiple columns
   - Example: `PRIMARY KEY (order_id, product_id)`

5. Super Key: 
   - Any set of columns that can uniquely identify a row

6. Candidate Key: 
   - A minimal super key (no subset of its columns can uniquely identify a row)

7. Alternate Key: 
   - A candidate key that is not selected as the primary key

Example of using different keys:
*/

USE bookstore;

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
    email VARCHAR(50) UNIQUE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL
);

CREATE TABLE order_items (
    order_id INT,
    book_id INT,
    quantity INT,
    PRIMARY KEY (order_id, quantity),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE SET NULL
);

-- Drop all tables before exiting
DROP TABLE order_items CASCADE;
DROP TABLE orders CASCADE;
DROP TABLE customers CASCADE;



