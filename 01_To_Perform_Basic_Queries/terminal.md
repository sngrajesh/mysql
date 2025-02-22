```bash
sudo mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.37-0ubuntu0.22.04.3 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE bookstore;
Query OK, 1 row affected (0.16 sec)

mysql> USE bookstore;
Database changed
mysql> CREATE TABLE books (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> title VARCHAR(100) NOT NULL,
    -> author VARCHAR(100) NOT NULL,
    -> price DECIMAL(10, 2),
    -> publication_date DATE
    -> );

Query OK, 0 rows affected (1.28 sec)

mysql>
mysql> INSERT INTO books (title, author, price, publication_date)
    -> VALUES ('My python', 'R. Singh', 12.99, '2024-04-10');
Query OK, 1 row affected (0.11 sec)

mysql> SELECT * FROM books;
+----+-----------+----------+-------+------------------+
| id | title     | author   | price | publication_date |
+----+-----------+----------+-------+------------------+
|  1 | My python | R. Singh | 12.99 | 2024-04-10       |
+----+-----------+----------+-------+------------------+
1 row in set (0.00 sec)

mysql> UPDATE books SET price = 14.99 WHERE id = 1;
Query OK, 1 row affected (0.15 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM books WHERE id = 1;
Query OK, 1 row affected (0.11 sec)

mysql> exit
Bye
```