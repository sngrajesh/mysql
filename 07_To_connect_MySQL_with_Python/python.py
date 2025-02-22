# Perofrm MySQL Python connection 
import os
from dotenv import load_dotenv
import mysql.connector

load_dotenv()

try:
	# Establish a connection
	mydb = mysql.connector.connect(
		host=os.getenv("DB_HOST"),
		user=os.getenv("DB_USER"),
		password=os.getenv("DB_PASSWORD"),
	)

	# Create a cursor object
	mycursor = mydb.cursor()

	# Select database
	mycursor.execute("USE bookstore;")

	# Execute a query
	mycursor.execute("SELECT * FROM books")

	# Fetch all results
	results = mycursor.fetchall()

	# Print results
	for row in results:
		print(f"ID: {row[0]}, Title: {row[1]}, Author: {row[2]}, Price: {row[3]}, Date: {row[4]}")

	# Insert a new book
	new_book = ("Some Kind", "Rajnish", 14.99, "2002-09-21")
	mycursor.execute("INSERT INTO books (title, author, price, publication_date) VALUES (%s, %s, %s, %s)", new_book)

	# Commit the changes
	mycursor.execute("COMMIT;")

except mysql.connector.Error as err:
	print("Something went wrong: {}".format(err))

finally:
	if 'mycursor' in locals():
		mycursor.close()
	if 'mydb' in locals():
		mydb.close()

