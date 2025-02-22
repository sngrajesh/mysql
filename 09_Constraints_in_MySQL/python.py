
# Perofrm Constraints
import os
from dotenv import load_dotenv
import mysql.connector

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

    # Setting up database
    mycursor.execute("CREATE DATABASE company")
    mycursor.execute("USE company")
    
    # NOT NULL
    mycursor.execute("CREATE TABLE employees (id INT NOT NULL, name VARCHAR(100) NOT NULL)")

    # UNIQUE
    mycursor.execute("CREATE TABLE users (id INT, email VARCHAR(100) UNIQUE)")

    # PRIMARY KEY
    mycursor.execute("CREATE TABLE products (id INT PRIMARY KEY, name VARCHAR(100))")

    # FOREIGN KEY
    mycursor.execute("CREATE TABLE orders (id INT PRIMARY KEY, product_id INT, FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE SET NULL)")

    # CHECK
    mycursor.execute("CREATE TABLE products_price (id INT, product_id INT, price DECIMAL(10,2) CHECK (price > 0), FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE)")

    # DEFAULT
    mycursor.execute("CREATE TABLE banner (id INT, status VARCHAR(20) DEFAULT 'active')")

    # AUTO_INCREMENT
    mycursor.execute("CREATE TABLE customers (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100))")

    # DROP ALL TABLES
    mycursor.execute("DROP TABLE employees CASCADE")
    mycursor.execute("DROP TABLE users CASCADE")
    mycursor.execute("DROP TABLE orders CASCADE")
    mycursor.execute("DROP TABLE products_price CASCADE")
    mycursor.execute("DROP TABLE products CASCADE")
    mycursor.execute("DROP TABLE banner CASCADE")
    mycursor.execute("DROP TABLE customers CASCADE")

    # DROP DATABASE
    mycursor.execute("DROP DATABASE company")

except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))

finally:
    if 'mycursor' in locals():
        mycursor.close()
    if 'mydb' in locals():
        mydb.close()

