# Perofrm Join Operation in Python
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
    
    # Select database 
    mycursor.execute("USE bookstore")

    # Delete pre-existing tables
    mycursor.execute("DROP TABLE IF EXISTS books")
    mycursor.execute("DROP TABLE IF EXISTS authors")
    mycursor.execute("DROP TABLE IF EXISTS book_categories")

    # Create authors, books and book_categories table
    mycursor.execute("CREATE TABLE authors (id INT AUTO_INCREMENT, name VARCHAR(255) NOT NULL, PRIMARY KEY (id))")
    mycursor.execute("CREATE TABLE book_categories (id INT AUTO_INCREMENT, category VARCHAR(255) NOT NULL, PRIMARY KEY (id))")
    mycursor.execute("CREATE TABLE books (id INT AUTO_INCREMENT, title VARCHAR(255) NOT NULL, author_id INT, category_id INT, PRIMARY KEY (id), FOREIGN KEY (author_id) REFERENCES authors(id), FOREIGN KEY (category_id) REFERENCES book_categories(id))")

    # Inserting data
    mycursor.execute("INSERT INTO authors (name) VALUES ('name_1'), ('name_2'), ('name_3'), ('name_4'), ('name_5'), ('name_6'), ('name_7'), ('name_8'), ('name_9'), ('name_10')")
    res = mycursor.fetchall()
    for x in res:
        print(x)
    

    mycursor.execute("INSERT INTO book_categories (category) VALUES ('category_1'), ('category_2'), ('category_3'), ('category_4'), ('category_5'), ('category_6'), ('category_7'), ('category_8'), ('category_9'), ('category_10')")
    res = mycursor.fetchall()
    for x in res:
        print(x)
    

    mycursor.execute("INSERT INTO books (title, author_id, category_id) VALUES ('book_1', 1, 1), ('book_2', 2, 2), ('book_3', 3, 3), ('book_4', 4, 4), ('book_5', 5, 5), ('book_6', 6, 6), ('book_7', 7, 7), ('book_8', 8, 8), ('book_9', 9, 9), ('book_10', 10, 10), ('book_11', 1, 2), ('book_12', 2, 3), ('book_13', 3, 4), ('book_14', 4, 5), ('book_15', 5, 6)")
    res = mycursor.fetchall()
    for x in res:
        print(x)

    mydb.commit()

    
    # INNER JOIN
    mycursor.execute("SELECT books.title, authors.name FROM books INNER JOIN authors ON books.author_id = authors.id")
    res = mycursor.fetchall()
    for x in res:
        print(x)

    # LEFT JOIN
    mycursor.execute("SELECT authors.name, books.title FROM authors LEFT JOIN books ON authors.id = books.author_id")
    res = mycursor.fetchall()
    for x in res:
        print(x)

    # RIGHT JOIN
    mycursor.execute("SELECT books.title, book_categories.category FROM books RIGHT JOIN book_categories ON books.category_id = book_categories.id")
    res = mycursor.fetchall()
    for x in res:
        print(x)

    # FULL JOIN
    mycursor.execute("SELECT authors.name, books.title FROM authors LEFT JOIN books ON authors.id = books.author_id UNION SELECT authors.name, books.title FROM authors RIGHT JOIN books ON authors.id = books.author_id WHERE authors.id IS NULL;")
    res  = mycursor.fetchall()
    for x in res:
        print(x)

    # CROSS JOIN
    mycursor.execute("SELECT books.title, book_categories.category FROM books CROSS JOIN book_categories")
    res = mycursor.fetchall()
    for x in res:
        print(x)

    # SELF JOIN
    mycursor.execute("SELECT a.title AS book1, b.title AS book2, a.author_id FROM books a INNER JOIN books b ON a.author_id = b.author_id AND a.id < b.id;")
    res = mycursor.fetchall()
    for x in res:
        print(x)


    

except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))

finally:
    if 'mycursor' in locals():
        mycursor.close()
    if 'mydb' in locals():
        mydb.close()

