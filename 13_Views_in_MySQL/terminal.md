```bash
rajesh@singh:~$ sudo mysql -u root -p
[sudo] password for rajesh: 
@Sorry, try again.
[sudo] password for rajesh: 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
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
mysql> 
mysql> -- Create a simple view
mysql> CREATE VIEW expensive_books AS
    -> SELECT title, CONCAT(a.first_name, ' ', a.last_name) AS author, price
    -> FROM books b
    -> JOIN authors a ON b.author_id = a.author_id
    -> WHERE price > 20;
Query OK, 0 rows affected (0.56 sec)

mysql> 
mysql> -- Query the view
mysql> SELECT * FROM expensive_books;
+---------+-------------+-------+
| title   | author      | price |
+---------+-------------+-------+
| Saffron | Diya Sharma | 24.50 |
| Chakra  | Arjun Singh | 20.50 |
+---------+-------------+-------+
2 rows in set (0.00 sec)

mysql> 
mysql> -- Create a view with joins
mysql> CREATE VIEW book_details AS
    -> SELECT b.title, CONCAT(a.first_name, ' ', a.last_name) AS author_name, b.description, b.price
    -> FROM books b
    -> JOIN authors a ON b.author_id = a.author_id;
ERROR 1050 (42S01): Table 'book_details' already exists
mysql> 
mysql> -- Query the complex view
mysql> SELECT * FROM book_details WHERE price > 15;
+---------+--------------+-----------------------+-------+
| title   | author_name  | description           | price |
+---------+--------------+-----------------------+-------+
| Echoes  | Aarav Patel  | A modern Mumbai       | 15.99 |
| Saffron | Diya Sharma  | Journey through India | 24.50 |
| Dharma  | Vihaan Gupta | Indian philosophy     | 18.75 |
| Chakra  | Arjun Singh  | Spiritual awakening   | 20.50 |
+---------+--------------+-----------------------+-------+
4 rows in set (0.00 sec)

mysql> 
mysql> -- Update a view (if its updatable)
mysql> UPDATE expensive_books SET price = price * 1.1 WHERE author = 'Aarav Patel';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> 
mysql> -- Create or replace a view
mysql> CREATE OR REPLACE VIEW high_rated_books AS
    -> SELECT b.title, CONCAT(a.first_name, ' ', a.last_name) AS author, br.rating
    -> FROM books b
    -> JOIN authors a ON b.author_id = a.author_id
    -> JOIN book_reviews br ON b.book_id = br.book_id
    -> WHERE br.rating > 4.5;
Query OK, 0 rows affected (0.71 sec)

mysql> 
mysql> -- Drop a view
mysql> DROP VIEW IF EXISTS expensive_books;
Query OK, 0 rows affected (0.24 sec)

mysql> exit
Bye
```