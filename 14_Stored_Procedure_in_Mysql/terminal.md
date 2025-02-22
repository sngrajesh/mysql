```bash
rajesh@singh:~$ sudo mysql -u root -p
[sudo] password for rajesh: 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 14
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
mysql> -- Create a simple stored procedure
mysql> DELIMITER //
mysql> CREATE PROCEDURE GetAllBooks()
    -> BEGIN
    ->     SELECT * FROM books;
    -> END //
Query OK, 0 rows affected (0.20 sec)

mysql> DELIMITER ;
mysql> 
mysql> -- Call the stored procedure
mysql> CALL GetAllBooks();
+---------+---------+-----------+-----------------------+-------+------------------+
| book_id | title   | author_id | description           | price | publication_date |
+---------+---------+-----------+-----------------------+-------+------------------+
|       1 | Echoes  |         1 | A modern Mumbai       | 15.99 | 2022-05-10       |
|       2 | Saffron |         2 | Journey through India | 24.50 | 2021-11-15       |
|       3 | Dharma  |         3 | Indian philosophy     | 18.75 | 2023-02-28       |
|       4 | Monsoon |         4 | Indian seasons        | 12.99 | 2022-08-01       |
|       5 | Chakra  |         5 | Spiritual awakening   | 20.50 | 2023-01-10       |
+---------+---------+-----------+-----------------------+-------+------------------+
5 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> -- Stored procedure with parameters
mysql> DELIMITER //
mysql> CREATE PROCEDURE GetBooksByAuthor(IN author_first_name VARCHAR(50), IN author_last_name VARCHAR(50))
    -> BEGIN
    ->     SELECT b.title, b.publication_date, b.price
    ->     FROM books b
    ->     JOIN authors a ON b.author_id = a.author_id
    ->     WHERE a.first_name = author_first_name AND a.last_name = author_last_name;
    -> END //
Query OK, 0 rows affected (0.21 sec)

mysql> DELIMITER ;
mysql> 
mysql> -- Call the parameterized stored procedure
mysql> CALL GetBooksByAuthor('Aarav', 'Patel');
+--------+------------------+-------+
| title  | publication_date | price |
+--------+------------------+-------+
| Echoes | 2022-05-10       | 15.99 |
+--------+------------------+-------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> -- Stored procedure with OUT parameter
mysql> DELIMITER //
mysql> CREATE PROCEDURE GetBookCount(OUT total INT)
    -> BEGIN
    ->     SELECT COUNT(*) INTO total FROM books;
    -> END //
Query OK, 0 rows affected (0.48 sec)

mysql> DELIMITER ;
mysql> 
mysql> -- Call procedure with OUT parameter
mysql> CALL GetBookCount(@total);
Query OK, 1 row affected (0.00 sec)

mysql> SELECT @total AS total_books;
+-------------+
| total_books |
+-------------+
|           5 |
+-------------+
1 row in set (0.00 sec)

mysql> 
mysql> -- Stored procedure with conditional logic (CORRECTED)
mysql> DELIMITER //
mysql> CREATE PROCEDURE ClassifyBook(IN input_book_id INT, OUT classification VARCHAR(20))
    -> BEGIN
    ->     DECLARE book_price DECIMAL(10,2);
    ->     
    ->     SELECT price INTO book_price FROM books WHERE book_id = input_book_id;
    ->     
    ->     IF book_price IS NULL THEN
    ->         SET classification = 'Book not found';
    ->     ELSEIF book_price < 15 THEN
    ->         SET classification = 'Budget';
    ->     ELSEIF book_price < 20 THEN
    ->         SET classification = 'Standard';
    ->     ELSE
    ->         SET classification = 'Premium';
    ->     END IF;
    -> END //
Query OK, 0 rows affected (0.17 sec)

mysql> DELIMITER ;
mysql> 
mysql> -- Call the classification procedure
mysql> CALL ClassifyBook(1, @classification);
Query OK, 1 row affected (0.00 sec)

mysql> SELECT @classification;
+-----------------+
| @classification |
+-----------------+
| Standard        |
+-----------------+
1 row in set (0.00 sec)

mysql> 
mysql> -- Drop a stored procedure
mysql> DROP PROCEDURE IF EXISTS GetAllBooks;
Query OK, 0 rows affected (0.15 sec)

mysql> DROP PROCEDURE IF EXISTS GetBooksByAuthor;
Query OK, 0 rows affected (0.17 sec)

mysql> DROP PROCEDURE IF EXISTS ClassifyBook;
Query OK, 0 rows affected (0.38 sec)

mysql> DROP PROCEDURE IF EXISTS GetBookCount;
Query OK, 0 rows affected (0.20 sec)

mysql> exit
Bye

```