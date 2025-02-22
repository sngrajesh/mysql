```bash
sudo mysql -u root -p
[sudo] password for rajesh:
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 16
Server version: 8.0.37-0ubuntu0.22.04.3 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE IF NOT EXISTS bookstore;
Query OK, 1 row affected (0.15 sec)

mysql> USE bookstore;
Database changed
mysql> CREATE TABLE authors (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     name VARCHAR(100) NOT NULL,
    ->     birth_date DATE,
    ->     nationality VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.79 sec)

mysql> ALTER TABLE authors ADD COLUMN email VARCHAR(100);
Query OK, 0 rows affected (0.63 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> ALTER TABLE authors MODIFY COLUMN name VARCHAR(150) NOT NULL;
Query OK, 0 rows affected (0.26 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE authors DROP COLUMN email;
Query OK, 0 rows affected (0.71 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX idx_name ON authors(name);
Query OK, 0 rows affected (0.53 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DROP INDEX idx_name ON authors;
Query OK, 0 rows affected (0.35 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> TRUNCATE TABLE authors;
Query OK, 0 rows affected (1.54 sec)

mysql> DROP TABLE authors;
Query OK, 0 rows affected (0.57 sec)

mysql> DROP DATABASE bookstore;
Query OK, 0 rows affected (0.29 sec)

mysql> exit
Bye
```