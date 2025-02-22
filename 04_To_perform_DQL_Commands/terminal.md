```bash
rajesh@singh:~$ sudo mysql -u root -p
[sudo] password for rajesh: 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 33
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
mysql> TRUNCATE TABLE authors; 
Query OK, 0 rows affected (1.27 sec)

mysql> INSERT INTO authors (id, name, birth_date, nationality)
    -> VALUES
    -> (1, 'Rajesh', '1996-07-31', 'Indian'),
    -> (2, 'Ayush', '2000-09-20', 'Indian'),
    -> (3, 'Kunal', '1990-01-01', 'Nepal'),
    -> (4, 'Amit', '1980-01-01', 'Indian'),
    -> (5, 'Sunny', '1995-01-01', 'Indian');
Query OK, 5 rows affected (0.13 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM books;
+----+----------------------+--------+-------+------------------+
| id | title                | author | price | publication_date |
+----+----------------------+--------+-------+------------------+
|  1 | Python for beginners | Ayush  | 13.99 | 2001-07-11       |
|  2 | Python Advance       | Kunal  | 10.99 | 2005-06-08       |
|  3 | Python for experts   | Rajesh |  9.99 | 2010-01-28       |
+----+----------------------+--------+-------+------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM authors
    -> ;
+----+--------+------------+-------------+
| id | name   | birth_date | nationality |
+----+--------+------------+-------------+
|  1 | Rajesh | 1996-07-31 | Indian      |
|  2 | Ayush  | 2000-09-20 | Indian      |
|  3 | Kunal  | 1990-01-01 | Nepal       |
|  4 | Amit   | 1980-01-01 | Indian      |
|  5 | Sunny  | 1995-01-01 | Indian      |
+----+--------+------------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT title, author FROM books WHERE price < 12.00;
+--------------------+--------+
| title              | author |
+--------------------+--------+
| Python Advance     | Kunal  |
| Python for experts | Rajesh |
+--------------------+--------+
2 rows in set (0.00 sec)

mysql> SELECT title, price FROM books ORDER BY price DESC;
+----------------------+-------+
| title                | price |
+----------------------+-------+
| Python for beginners | 13.99 |
| Python Advance       | 10.99 |
| Python for experts   |  9.99 |
+----------------------+-------+
3 rows in set (0.00 sec)

mysql> SELECT author, COUNT(*) as book_count, AVG(price) as avg_price
    -> FROM books
    -> GROUP BY author;
+--------+------------+-----------+
| author | book_count | avg_price |
+--------+------------+-----------+
| Ayush  |          1 | 13.990000 |
| Kunal  |          1 | 10.990000 |
| Rajesh |          1 |  9.990000 |
+--------+------------+-----------+
3 rows in set (0.00 sec)

mysql> SELECT author, COUNT(*) as book_count
    -> FROM books
    -> GROUP BY author
    -> HAVING book_count > 1;
Empty set (0.00 sec)

mysql> SELECT books.title, authors.name
    -> FROM books
    -> INNER JOIN authors ON books.author = authors.name;
+----------------------+--------+
| title                | name   |
+----------------------+--------+
| Python for experts   | Rajesh |
| Python for beginners | Ayush  |
| Python Advance       | Kunal  |
+----------------------+--------+
3 rows in set (0.00 sec)

mysql> SELECT title, price
    -> FROM books
    -> WHERE price > (SELECT AVG(price) FROM books);
+----------------------+-------+
| title                | price |
+----------------------+-------+
| Python for beginners | 13.99 |
+----------------------+-------+
1 row in set (0.00 sec)

mysql> SELECT title, price FROM books ORDER BY price DESC LIMIT 5;
+----------------------+-------+
| title                | price |
+----------------------+-------+
| Python for beginners | 13.99 |
| Python Advance       | 10.99 |
| Python for experts   |  9.99 |
+----------------------+-------+
3 rows in set (0.01 sec)

mysql> exit
Bye

```