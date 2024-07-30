# Basic MySQL Queries
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

    mycursor = mydb.cursor()

    # Drop database if exits 
    mycursor.execute("DROP DATABASE IF EXISTS bookstore")

    # Create a database
    mycursor.execute("CREATE DATABASE bookstore")

    # Use the database
    mycursor.execute("USE bookstore")

    # Create a table
    mycursor.execute(
        "CREATE TABLE books (id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(100) NOT NULL, author VARCHAR(100) NOT NULL, price DECIMAL(10, 2), publication_date DATE)"
    )

    # Insert data
    sql = "INSERT INTO books (title, author, price, publication_date) VALUES (%s, %s, %s, %s)"
    val = ("My python", "R. Singh", 12.99, "2024-04-10")
    mycursor.execute(sql, val)

    # Select data
    mycursor.execute("SELECT * FROM books")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)

    # Update data
    sql = "UPDATE books SET price = %s WHERE id = %s"
    val = (14.99, 1)
    mycursor.execute(sql, val)

    # Delete data
    sql = "DELETE FROM books WHERE id = %s"
    val = (1,)
    mycursor.execute(sql, val)

    mydb.commit()

    print(mycursor.rowcount, "record(s) deleted")

except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))

finally:
    mycursor.close()
    mydb.close()

