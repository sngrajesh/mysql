# Perofrm Keys operation in MySQL
import os
from dotenv import load_dotenv
import mysql.connector

"""
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
"""

load_dotenv()

try:
    # Connect to MySQL
    mydb = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
    )

    # Create cursor
    mycursor = mydb.cursor()

    # Select database
    mycursor.execute("USE bookstore;")

    # Create customers table 
    mycursor.execute("CREATE TABLE customers (id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(50) UNIQUE)")
    print("customers table created" , mycursor.rowcount)

    # Create orders table
    mycursor.execute("CREATE TABLE orders (order_id INT PRIMARY KEY, customer_id INT, order_date DATE, FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL)")
    print("orders table created" , mycursor.rowcount)

    # Create order_items table
    mycursor.execute("CREATE TABLE order_items (order_id INT, book_id INT, quantity INT, PRIMARY KEY (order_id, quantity), FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE, FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE SET NULL)")
    print("order_items table created" , mycursor.rowcount)

    # Drop tables
    mycursor.execute("DROP TABLE order_items CASCADE")
    mycursor.execute("DROP TABLE orders CASCADE")
    mycursor.execute("DROP TABLE customers CASCADE")
    print("tables dropped", mycursor.rowcount)

except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))

finally:
    if 'mycursor' in locals():
        mycursor.close()
    if 'mydb' in locals():
        mydb.close()

