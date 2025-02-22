```bash
rajesh@singh:~$ sudo mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 28
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
mysql> TRUNCATE TABLE books;
Query OK, 0 rows affected (1.48 sec)

mysql> INSERT INTO books (title, author, price, publication_date)
    -> VALUES ('Python Beginners', 'Ayush', 11.99, '2001-07-11');
Query OK, 1 row affected (0.11 sec)

mysql> INSERT INTO books (title, author, price, publication_date)
    -> VALUES 
    -> ('Python Advance', 'Kunal', 10.99, '2005-06-08'),
    -> ('Python for experts', 'Rajesh', 9.99, '2010-01-28');
Query OK, 2 rows affected (0.15 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> UPDATE books SET price = 12.99 WHERE id = 1;
Query OK, 1 row affected (0.15 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM books WHERE publication_date < '2002-01-01';
Query OK, 1 row affected (0.10 sec)

mysql> REPLACE INTO books (id, title, author, price, publication_date)
    -> VALUES (1, 'Python for beginners', 'Ayush', 13.99, '2001-07-11');
Query OK, 1 row affected (0.13 sec)

mysql> SELECT * FROM books;
+----+----------------------+--------+-------+------------------+
| id | title                | author | price | publication_date |
+----+----------------------+--------+-------+------------------+
|  1 | Python for beginners | Ayush  | 13.99 | 2001-07-11       |
|  2 | Python Advance       | Kunal  | 10.99 | 2005-06-08       |
|  3 | Python for experts   | Rajesh |  9.99 | 2010-01-28       |
+----+----------------------+--------+-------+------------------+
3 rows in set (0.00 sec)

```