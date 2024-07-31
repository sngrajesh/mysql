# Perofrm MySQL DCL Commands -> Data Control Language
import os
from dotenv import load_dotenv
import mysql.connector

"""
CREATE USER 'user_rajesh'@'localhost' IDENTIFIED BY 'P@ssw0rd#987';
GRANT SELECT, INSERT, UPDATE ON bookstore.books TO 'user_rajesh'@'localhost';
GRANT ALL PRIVILEGES ON bookstore.* TO 'user_rajesh'@'localhost';
SHOW GRANTS FOR 'user_rajesh'@'localhost';
REVOKE INSERT, UPDATE ON bookstore.books FROM 'user_rajesh'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user_rajesh'@'localhost';
DROP USER 'user_rajesh'@'localhost';
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

    # Create User 
    mycursor.execute("CREATE USER 'user_rajesh'@'localhost' IDENTIFIED BY 'P@ssw0rd#987'")
    
    # Grant Privileges -> Select, Insert, Update -> on bookstore.books
    mycursor.execute("GRANT SELECT, INSERT, UPDATE ON bookstore.books TO 'user_rajesh'@'localhost'")

    # Grant All Privileges -> on bookstore.*
    mycursor.execute("GRANT ALL PRIVILEGES ON bookstore.* TO 'user_rajesh'@'localhost'")

    # Show Grants
    mycursor.execute("SHOW GRANTS FOR 'user_rajesh'@'localhost'")
    grants = mycursor.fetchall()

    for grant in grants:
        print(grant)

    # Revoke Privileges
    mycursor.execute("REVOKE INSERT, UPDATE ON bookstore.books FROM 'user_rajesh'@'localhost'")

    # Revoke All Privileges
    mycursor.execute("REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user_rajesh'@'localhost'")

    # Drop User
    mycursor.execute("DROP USER 'user_rajesh'@'localhost'")

except mysql.connector.Error as err:
    print("Something went wrong: {}".format(err))

finally:
    mycursor.close()
    mydb.close()

