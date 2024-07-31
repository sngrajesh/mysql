# Perofrm MySQL TCL Commands -> Transaction Control Language 
import os
from dotenv import load_dotenv
import mysql.connector

"""
USE bookstore;
SELECT * FROM books;
START TRANSACTION;
INSERT INTO books (title, author, price, publication_date) VALUES ('CSC', 'Riya', 11.99, '2002-07-16');
UPDATE books SET price = 13.99 WHERE title = 'CSC';
SAVEPOINT before_delete;
DELETE FROM books WHERE title = 'Python Advance';
ROLLBACK TO SAVEPOINT before_delete;
COMMIT;
START TRANSACTION;
UPDATE books SET price = 9.99 WHERE title = 'Python Advance';
ROLLBACK;  
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

    # Selecting Database
    mycursor.execute("USE bookstore;")

    # Print all records
    mycursor.execute("SELECT * FROM books;")

    for x in mycursor:
        print(x)

    # Transaction Control Language Commands
    mycursor.execute("START TRANSACTION;")
    
    # Insert Data
    mycursor.execute("INSERT INTO books (title, author, price, publication_date) VALUES ('CSC', 'Riya', 11.99, '2002-07-16');")
    
    # Updating book data
    mycursor.execute("UPDATE books SET price = 13.99 WHERE title = 'CSC';")
    
    # Creating a savepoint
    mycursor.execute("SAVEPOINT before_delete;")
    
    # Delete book from books 
    mycursor.execute("DELETE FROM books WHERE title = 'Python Advance';")
    
    # Rollaback to previous savepoint
    mycursor.execute("ROLLBACK TO SAVEPOINT before_delete;")
    
    # Commiting/Saving Changes
    mycursor.execute("COMMIT;")

    # Print all records
    mycursor.execute("SELECT * FROM books;")

    for x in mycursor:
        print(x)


    # Starting new Transaction
    mycursor.execute("START TRANSACTION;")

    # Updating book data
    mycursor.execute("UPDATE books SET price = 9.99 WHERE title = 'Python Advance';")

    # Rollback
    mycursor.execute("ROLLBACK;")

    # Print all records
    mycursor.execute("SELECT * FROM books;")

    for x in mycursor:
        print(x)

except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))

finally:
    if 'mycursor' in locals():
        mycursor.close()
    if 'mydb' in locals():
        mydb.close()

