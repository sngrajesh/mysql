# Perofrm DML -> Data Manipulation Language Commands
import os
from dotenv import load_dotenv
import mysql.connector

"""
USE bookstore;
TRUNCATE TABLE books;
INSERT INTO books (title, author, price, publication_date)
VALUES ('Python Beginners', 'Ayush', 11.99, '2001-07-11');
INSERT INTO books (title, author, price, publication_date)
VALUES 
('Python Advance', 'Kunal', 10.99, '2005-06-08'),
('Python for experts', 'Rajesh', 9.99, '2010-01-28');
UPDATE books SET price = 12.99 WHERE id = 1;
DELETE FROM books WHERE publication_date < '2002-01-01';
REPLACE INTO books (id, title, author, price, publication_date)
VALUES (1, 'Python for beginners', 'Ayush', 13.99, '2001-07-11');
SELECT * FROM books;
"""

load_dotenv()

try:
    # Connect to MySQL
    mydb = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
    )

    mycursor = mydb.cursor()

    # Select Database
    mycursor.execute("USE bookstore")

    # Delete previous records from TABLE
    mycursor.execute("TRUNCATE TABLE books")

    # Insert records
    sql = "INSERT INTO books (title, author, price, publication_date) VALUES (%s, %s, %s, %s)"
    val = [
        ('Python Beginners', 'Ayush', 11.99, '2001-07-11'),
        ('Python Advance', 'Kunal', 10.99, '2005-06-08'),
        ('Python for experts', 'Rajesh', 9.99, '2010-01-28'),
    ]
    mycursor.executemany(sql, val)
    mydb.commit()
    print(mycursor.rowcount, "record inserted.")

    # Update record
    sql = "UPDATE books SET price = 12.99 WHERE id = 1"
    mycursor.execute(sql)
    mydb.commit()
    print(mycursor.rowcount, "record updated.")

    # Delete record
    sql = "DELETE FROM books WHERE publication_date < '2002-01-01'"
    mycursor.execute(sql)
    mydb.commit()
    print(mycursor.rowcount, "record deleted.")

    # Replace record
    sql = "REPLACE INTO books (id, title, author, price, publication_date) VALUES (1, 'Python for beginners', 'Ayush', 13.99, '2001-07-11')"
    mycursor.execute(sql)
    mydb.commit()
    print(mycursor.rowcount, "record replaced.")

    # Display records
    mycursor.execute("SELECT * FROM books")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)

except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))

finally:
    mycursor.close()
    mydb.close()

