```bash
rajesh@singh:~$ sudo mysql -u root -p
[sudo] password for rajesh: 
Sorry, try again.
[sudo] password for rajesh: 
sudo: 1 incorrect password attempt
rajesh@singh:~$ ^C
rajesh@singh:~$ sudo mysql -u root -p
[sudo] password for rajesh: 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 52
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
mysql> SELECT * FROM books;
+----+----------------------+--------+-------+------------------+
| id | title                | author | price | publication_date |
+----+----------------------+--------+-------+------------------+
|  1 | Python for beginners | Ayush  | 13.99 | 2001-07-11       |
|  2 | Python Advance       | Kunal  | 10.99 | 2005-06-08       |
|  3 | Python for experts   | Rajesh |  9.99 | 2010-01-28       |
|  4 | CSC                  | Riya   | 13.99 | 2002-07-16       |
|  5 | CSC                  | Riya   | 13.99 | 2002-07-16       |
+----+----------------------+--------+-------+------------------+
5 rows in set (0.00 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> INSERT INTO books (title, author, price, publication_date)
    -> VALUES 
    -> ('CSC', 'Riya', 11.99, '2002-07-16');
Query OK, 1 row affected (0.01 sec)

mysql> UPDATE books SET price = 13.99 WHERE title = 'CSC';
Query OK, 1 row affected (0.00 sec)
Rows matched: 3  Changed: 1  Warnings: 0

mysql> SAVEPOINT before_delete;
Query OK, 0 rows affected (0.00 sec)

mysql> DELETE FROM books WHERE title = 'Python Advance';
Query OK, 1 row affected (0.00 sec)

mysql> ROLLBACK TO SAVEPOINT before_delete;
Query OK, 0 rows affected (0.00 sec)

mysql> COMMIT;
Query OK, 0 rows affected (0.12 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE books SET price = 9.99 WHERE title = 'Python Advance';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> ROLLBACK;  
Query OK, 0 rows affected (0.08 sec)

mysql> exit
Bye

```