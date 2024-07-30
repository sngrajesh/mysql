# Perofrm DQL Commands -> Data Query Language 
import os
from dotenv import load_dotenv
import mysql.connector

"""
USE bookstore;
TRUNCATE TABLE authors; 
INSERT INTO authors (id, name, birth_date, nationality)
VALUES
(1, 'Rajesh', '1996-07-31', 'Indian'),
(2, 'Ayush', '2000-09-20', 'Indian'),
(3, 'Kunal', '1990-01-01', 'Nepal'),
(4, 'Amit', '1980-01-01', 'Indian'),
(5, 'Sunny', '1995-01-01', 'Indian');

SELECT * FROM books;

SELECT title, author FROM books WHERE price < 12.00;

SELECT title, price FROM books ORDER BY price DESC;

SELECT author, COUNT(*) as book_count, AVG(price) as avg_price
FROM books
GROUP BY author;

SELECT author, COUNT(*) as book_count
FROM books
GROUP BY author
HAVING book_count > 1;

SELECT books.title, authors.name
FROM books
INNER JOIN authors ON books.author = authors.name;

SELECT title, price
FROM books
WHERE price > (SELECT AVG(price) FROM books);

SELECT title, price FROM books ORDER BY price DESC LIMIT 5;
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

    mycursor.execute("USE bookstore;")
    mycursor.execute("TRUNCATE TABLE authors;")

    # Inserting data into author table 
    sql = "INSERT INTO authors (id, name, birth_date, nationality) VALUES (%s, %s, %s, %s)"
    val = [
        (1, 'Rajesh', '1996-07-31', 'Indian'),
        (2, 'Ayush', '2000-09-20', 'Indian'),
        (3, 'Kunal', '1990-01-01', 'Nepal'),
        (4, 'Amit', '1980-01-01', 'Indian'),
        (5, 'Sunny', '1995-01-01', 'Indian'),
    ]
    mycursor.executemany(sql, val)
    mydb.commit()

    print(mycursor.rowcount, "record inserted.")
    

    # Select all data from author table
    mycursor.execute("SELECT * FROM authors;")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)

    # Select with condition 
    mycursor.execute("SELECT title, author FROM books WHERE price < 12.00;")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)

    # Select with order by
    mycursor.execute("SELECT title, price FROM books ORDER BY price DESC;")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)

    # Select with group by
    mycursor.execute("SELECT author, COUNT(*) as book_count, AVG(price) as avg_price FROM books GROUP BY author;")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)

    # Select with group by and having
    mycursor.execute("SELECT author, COUNT(*) as book_count FROM books GROUP BY author HAVING book_count > 1;")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)

    # Select with join
    mycursor.execute("SELECT books.title, authors.name FROM books INNER JOIN authors ON books.author = authors.name;")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)

    # Select with subquery
    mycursor.execute("SELECT title, price FROM books WHERE price > (SELECT AVG(price) FROM books);")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)

    # Select with limit
    mycursor.execute("SELECT title, price FROM books ORDER BY price DESC LIMIT 5;")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)



except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))

finally:
    mycursor.close()
    mydb.close()

