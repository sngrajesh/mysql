import os
import mysql.connector
from dotenv import load_dotenv

load_dotenv()

try:
    # Connect to MySQL
    mydb = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
    )

    mycursor = mydb.cursor()

    # Drop database if exist
    mycursor.execute("DROP DATABASE IF EXISTS mydatabase")
    # Create database
    mycursor.execute("CREATE DATABASE mydatabase")
    mycursor.execute("SHOW DATABASES")

    for x in mycursor:
        print(x)

    # Connect to database - mydatabase
    mydb = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME"),
    )

    mycursor = mydb.cursor()

    # Create table customers
    mycursor.execute("CREATE TABLE customers (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), address VARCHAR(255))")
    mycursor.execute("SHOW TABLES")

    for x in mycursor:
        print(x)

    # Inserting many records
    sql = "INSERT INTO customers (name, address) VALUES (%s, %s)"
    val = [
        ('Devendra', 'Vashi 4'),
        ('Chandru', 'Vashi 6'),
        ('Vinit', 'Borivali 12'),
        ('Shreyas', 'Kharghar 8'),
    ]

    # Inserting many records
    mycursor.executemany(sql, val)
    mydb.commit()
    print(mycursor.rowcount, "was inserted.")

    # Describing the table
    mycursor.execute("DESCRIBE customers")
    for x in mycursor:
        print(x)

    # Display records
    mycursor.execute("SELECT * FROM customers")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)

    # Update record
    sql = "UPDATE customers SET address = 'Vashi 7' WHERE name = 'Chandru'"
    mycursor.execute(sql)
    mydb.commit()
    print(mycursor.rowcount, "record affected")

    # Display records after update
    mycursor.execute("SELECT * FROM customers")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)

    # Delete record
    sql = "DELETE FROM customers WHERE name = 'Vinit'"
    mycursor.execute(sql)
    mydb.commit()
    print(mycursor.rowcount, "record deleted")

    # Display records after delete
    mycursor.execute("SELECT * FROM customers")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(x)

except mysql.connector.Error as err:
    print(err)

finally:
    if 'mydb' in locals() and mydb.is_connected():
        mydb.close()
