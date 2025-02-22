```bash
rajesh@singh:~$ sudo mysql -u root -p
[sudo] password for rajesh: 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 63
Server version: 8.0.37-0ubuntu0.22.04.3 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE bookstore;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> CREATE TABLE customers(
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    -> first_name VARCHAR(50),
    -> last_name VARCHAR(50),
    ->     email VARCHAR(50) UNIQUE
    -> );
ERROR 1050 (42S01): Table 'customers' already exists
mysql> exit
Bye
rajesh@singh:~$ sudo mysql -u root -p
[sudo] password for rajesh: 
Sorry, try again.
[sudo] password for rajesh: 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 64
Server version: 8.0.37-0ubuntu0.22.04.3 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE bookstore;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> CREATE TABLE customers(
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    -> first_name VARCHAR(50),
    -> last_name VARCHAR(50),
    ->     email VARCHAR(50) UNIQUE
    -> );
Query OK, 0 rows affected (1.23 sec)

mysql> CREATE TABLE orders (
    ->     order_id INT PRIMARY KEY,
    ->     customer_id INT,
    ->     order_date DATE,
    ->     FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL 
    -> );
Query OK, 0 rows affected (0.94 sec)

mysql> CREATE TABLE order_items (
    ->     order_id INT,
    ->     book_id INT,
    ->     quantity INT,
    ->     PRIMARY KEY (order_id, quantity),
    ->     FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE, 
    ->     FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE SET NULL
    -> );
Query OK, 0 rows affected (1.48 sec)

mysql> DROP TABLE order_items CASCADE;
Query OK, 0 rows affected (0.50 sec)

mysql> DROP TABLE orders CASCADE;
Query OK, 0 rows affected (0.46 sec)

mysql> DROP TABLE customers CASCADE;
Query OK, 0 rows affected (0.50 sec)

mysql> exit
Bye

```