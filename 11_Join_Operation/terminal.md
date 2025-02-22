```bash
rajesh@singh:~$ sudo mysql -u root -p
[sudo] password for rajesh: 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 8.0.37-0ubuntu0.22.04.3 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> Use bookstore;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> Drop Table IF EXISTS books;
Query OK, 0 rows affected (0.82 sec)

mysql> Drop Table IF EXISTS authors ;
Query OK, 0 rows affected (0.39 sec)

mysql> Drop Table IF EXISTS book_categories;
Query OK, 0 rows affected (0.47 sec)

mysql> 
mysql> CREATE TABLE authors (
    ->   id INT AUTO_INCREMENT,
    ->   name VARCHAR(255) NOT NULL,
    ->   PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (0.76 sec)

mysql> 
mysql> CREATE TABLE book_categories (
    ->   id INT AUTO_INCREMENT,
    ->   category VARCHAR(255) NOT NULL,
    ->   PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (0.71 sec)

mysql> 
mysql> CREATE TABLE books (
    ->   id INT AUTO_INCREMENT,
    ->   title VARCHAR(255) NOT NULL,
    ->   author_id INT,
    ->   category_id INT,
    ->   PRIMARY KEY (id),
    ->   FOREIGN KEY (author_id) REFERENCES authors(id),
    ->   FOREIGN KEY (category_id) REFERENCES book_categories(id)
    -> );
Query OK, 0 rows affected (1.61 sec)

mysql> INSERT INTO authors (name) VALUES
    -> ('name_1'),
    -> ('name_2'),
    -> ('name_3'),
    -> ('name_4'),
    -> ('name_5'),
    -> ('name_6'),
    -> ('name_7'),
    -> ('name_8'),
    -> ('name_9'),
    -> ('name_10');
Query OK, 10 rows affected (0.15 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> INSERT INTO book_categories (category) VALUES
    -> ('category_1'),
    -> ('category_2'),
    -> ('category_3'),
    -> ('category_4'),
    -> ('category_5'),
    -> ('category_6'),
    -> ('category_7'),
    -> ('category_8'),
    -> ('category_9'),
    -> ('category_10');
Query OK, 10 rows affected (0.18 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO books (title, author_id, category_id) VALUES
    -> ('book_1', 1, 1),
    -> ('book_2', 2, 2),
    -> ('book_3', 3, 3),
    -> ('book_4', 4, 4),
    -> ('book_5', 5, 5),
    -> ('book_6', 6, 6),
    -> ('book_7', 7, 7),
    -> ('book_8', 8, 8),
    -> ('book_9', 9, 9),
    -> ('book_10', 10, 10),
    -> ('book_11', 1, 2),
    -> ('book_12', 2, 3),
    -> ('book_13', 3, 4),
    -> ('book_14', 4, 5),
    -> ('book_15', 5, 6);
Query OK, 15 rows affected (0.14 sec)
Records: 15  Duplicates: 0  Warnings: 0

mysql> SELECT books.title, authors.name
    -> FROM books
    -> INNER JOIN authors ON books.author_id = authors.id;
+---------+---------+
| title   | name    |
+---------+---------+
| book_1  | name_1  |
| book_11 | name_1  |
| book_2  | name_2  |
| book_12 | name_2  |
| book_3  | name_3  |
| book_13 | name_3  |
| book_4  | name_4  |
| book_14 | name_4  |
| book_5  | name_5  |
| book_15 | name_5  |
| book_6  | name_6  |
| book_7  | name_7  |
| book_8  | name_8  |
| book_9  | name_9  |
| book_10 | name_10 |
+---------+---------+
15 rows in set (0.00 sec)

mysql> SELECT authors.name, books.title
    -> FROM authors
    -> LEFT JOIN books ON authors.id = books.author_id;
+---------+---------+
| name    | title   |
+---------+---------+
| name_1  | book_1  |
| name_1  | book_11 |
| name_2  | book_2  |
| name_2  | book_12 |
| name_3  | book_3  |
| name_3  | book_13 |
| name_4  | book_4  |
| name_4  | book_14 |
| name_5  | book_5  |
| name_5  | book_15 |
| name_6  | book_6  |
| name_7  | book_7  |
| name_8  | book_8  |
| name_9  | book_9  |
| name_10 | book_10 |
+---------+---------+
15 rows in set (0.00 sec)

mysql> SELECT books.title, book_categories.category
    -> FROM books
    -> RIGHT JOIN book_categories ON books.category_id = book_categories.id;
+---------+-------------+
| title   | category    |
+---------+-------------+
| book_1  | category_1  |
| book_2  | category_2  |
| book_11 | category_2  |
| book_3  | category_3  |
| book_12 | category_3  |
| book_4  | category_4  |
| book_13 | category_4  |
| book_5  | category_5  |
| book_14 | category_5  |
| book_6  | category_6  |
| book_15 | category_6  |
| book_7  | category_7  |
| book_8  | category_8  |
| book_9  | category_9  |
| book_10 | category_10 |
+---------+-------------+
15 rows in set (0.00 sec)

mysql> SELECT authors.name, books.title
    -> FROM authors
    -> LEFT JOIN books ON authors.id = books.author_id
    -> UNION
    -> SELECT authors.name, books.title
    -> FROM authors
    -> RIGHT JOIN books ON authors.id = books.author_id
    -> WHERE authors.id IS NULL;
+---------+---------+
| name    | title   |
+---------+---------+
| name_1  | book_1  |
| name_1  | book_11 |
| name_2  | book_2  |
| name_2  | book_12 |
| name_3  | book_3  |
| name_3  | book_13 |
| name_4  | book_4  |
| name_4  | book_14 |
| name_5  | book_5  |
| name_5  | book_15 |
| name_6  | book_6  |
| name_7  | book_7  |
| name_8  | book_8  |
| name_9  | book_9  |
| name_10 | book_10 |
+---------+---------+
15 rows in set (0.02 sec)

mysql> SELECT books.title, book_categories.category
    -> FROM books
    -> CROSS JOIN book_categories;
+---------+-------------+
| title   | category    |
+---------+-------------+
| book_1  | category_10 |
| book_1  | category_9  |
| book_1  | category_8  |
| book_1  | category_7  |
| book_1  | category_6  |
| book_1  | category_5  |
| book_1  | category_4  |
| book_1  | category_3  |
| book_1  | category_2  |
| book_1  | category_1  |
| book_2  | category_10 |
| book_2  | category_9  |
| book_2  | category_8  |
| book_2  | category_7  |
| book_2  | category_6  |
| book_2  | category_5  |
| book_2  | category_4  |
| book_2  | category_3  |
| book_2  | category_2  |
| book_2  | category_1  |
| book_3  | category_10 |
| book_3  | category_9  |
| book_3  | category_8  |
| book_3  | category_7  |
| book_3  | category_6  |
| book_3  | category_5  |
| book_3  | category_4  |
| book_3  | category_3  |
| book_3  | category_2  |
| book_3  | category_1  |
| book_4  | category_10 |
| book_4  | category_9  |
| book_4  | category_8  |
| book_4  | category_7  |
| book_4  | category_6  |
| book_4  | category_5  |
| book_4  | category_4  |
| book_4  | category_3  |
| book_4  | category_2  |
| book_4  | category_1  |
| book_5  | category_10 |
| book_5  | category_9  |
| book_5  | category_8  |
| book_5  | category_7  |
| book_5  | category_6  |
| book_5  | category_5  |
| book_5  | category_4  |
| book_5  | category_3  |
| book_5  | category_2  |
| book_5  | category_1  |
| book_6  | category_10 |
| book_6  | category_9  |
| book_6  | category_8  |
| book_6  | category_7  |
| book_6  | category_6  |
| book_6  | category_5  |
| book_6  | category_4  |
| book_6  | category_3  |
| book_6  | category_2  |
| book_6  | category_1  |
| book_7  | category_10 |
| book_7  | category_9  |
| book_7  | category_8  |
| book_7  | category_7  |
| book_7  | category_6  |
| book_7  | category_5  |
| book_7  | category_4  |
| book_7  | category_3  |
| book_7  | category_2  |
| book_7  | category_1  |
| book_8  | category_10 |
| book_8  | category_9  |
| book_8  | category_8  |
| book_8  | category_7  |
| book_8  | category_6  |
| book_8  | category_5  |
| book_8  | category_4  |
| book_8  | category_3  |
| book_8  | category_2  |
| book_8  | category_1  |
| book_9  | category_10 |
| book_9  | category_9  |
| book_9  | category_8  |
| book_9  | category_7  |
| book_9  | category_6  |
| book_9  | category_5  |
| book_9  | category_4  |
| book_9  | category_3  |
| book_9  | category_2  |
| book_9  | category_1  |
| book_10 | category_10 |
| book_10 | category_9  |
| book_10 | category_8  |
| book_10 | category_7  |
| book_10 | category_6  |
| book_10 | category_5  |
| book_10 | category_4  |
| book_10 | category_3  |
| book_10 | category_2  |
| book_10 | category_1  |
| book_11 | category_10 |
| book_11 | category_9  |
| book_11 | category_8  |
| book_11 | category_7  |
| book_11 | category_6  |
| book_11 | category_5  |
| book_11 | category_4  |
| book_11 | category_3  |
| book_11 | category_2  |
| book_11 | category_1  |
| book_12 | category_10 |
| book_12 | category_9  |
| book_12 | category_8  |
| book_12 | category_7  |
| book_12 | category_6  |
| book_12 | category_5  |
| book_12 | category_4  |
| book_12 | category_3  |
| book_12 | category_2  |
| book_12 | category_1  |
| book_13 | category_10 |
| book_13 | category_9  |
| book_13 | category_8  |
| book_13 | category_7  |
| book_13 | category_6  |
| book_13 | category_5  |
| book_13 | category_4  |
| book_13 | category_3  |
| book_13 | category_2  |
| book_13 | category_1  |
| book_14 | category_10 |
| book_14 | category_9  |
| book_14 | category_8  |
| book_14 | category_7  |
| book_14 | category_6  |
| book_14 | category_5  |
| book_14 | category_4  |
| book_14 | category_3  |
| book_14 | category_2  |
| book_14 | category_1  |
| book_15 | category_10 |
| book_15 | category_9  |
| book_15 | category_8  |
| book_15 | category_7  |
| book_15 | category_6  |
| book_15 | category_5  |
| book_15 | category_4  |
| book_15 | category_3  |
| book_15 | category_2  |
| book_15 | category_1  |
+---------+-------------+
150 rows in set (0.00 sec)

mysql> SELECT a.title AS book1, b.title AS book2, a.author_id
    -> FROM books a
    -> INNER JOIN books b ON a.author_id = b.author_id AND a.id < b.id;
+--------+---------+-----------+
| book1  | book2   | author_id |
+--------+---------+-----------+
| book_1 | book_11 |         1 |
| book_2 | book_12 |         2 |
| book_3 | book_13 |         3 |
| book_4 | book_14 |         4 |
| book_5 | book_15 |         5 |
+--------+---------+-----------+
5 rows in set (0.00 sec)

mysql> exit
Bye

```