# Perofrm DDL Commands
import os
from dotenv import load_dotenv
import mysql.connector

"""
CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(50)
);
ALTER TABLE authors ADD COLUMN email VARCHAR(100);
ALTER TABLE authors MODIFY COLUMN name VARCHAR(150) NOT NULL;
ALTER TABLE authors DROP COLUMN email;
CREATE INDEX idx_name ON authors(name);
DROP INDEX idx_name ON authors;
TRUNCATE TABLE authors;
DROP TABLE authors;
DROP DATABASE bookstore;
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

    # Drop database if exits 
    mycursor.execute("DROP DATABASE IF EXISTS bookstore")

    # Create a database
    mycursor.execute("CREATE DATABASE bookstore")

    # Use the database
    mycursor.execute("USE bookstore")

    # Create a table
    mycursor.execute(
        "CREATE TABLE authors (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100) NOT NULL, birth_date DATE, nationality VARCHAR(50))"
    )

    # Add column
    mycursor.execute("ALTER TABLE authors ADD COLUMN email VARCHAR(100)")

    # Modify column
    mycursor.execute("ALTER TABLE authors MODIFY COLUMN name VARCHAR(151) NOT NULL")

    # Drop column
    mycursor.execute("ALTER TABLE authors DROP COLUMN email")

    # Create index
    mycursor.execute("CREATE INDEX idx_name ON authors(name)")

    # Drop index
    mycursor.execute("DROP INDEX idx_name ON authors")

    # Truncate table
    mycursor.execute("TRUNCATE TABLE authors")

    # Drop table
    mycursor.execute("DROP TABLE authors")

    # Drop database
    mycursor.execute("DROP DATABASE bookstore")

    # Commit changes
    mydb.commit()

    print(mycursor.rowcount, "record(s) affected")

except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))

finally:
    mycursor.close()
    mydb.close()

