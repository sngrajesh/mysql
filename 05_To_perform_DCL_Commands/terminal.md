```bash
rajesh@singh:~$ sudo mysql -u root -p
[sudo] password for rajesh: 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 38
Server version: 8.0.37-0ubuntu0.22.04.3 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE USER 'user_rajesh'@'localhost' IDENTIFIED BY 'P@ssw0rd#987';
Query OK, 0 rows affected (0.13 sec)

mysql> GRANT SELECT, INSERT, UPDATE ON bookstore.books TO 'user_rajesh'@'localhost';
Query OK, 0 rows affected (0.17 sec)

mysql> GRANT ALL PRIVILEGES ON bookstore.* TO 'user_rajesh'@'localhost';
Query OK, 0 rows affected (0.15 sec)

mysql> SHOW GRANTS FOR 'user_rajesh'@'localhost';
+----------------------------------------------------------------------------------+
| Grants for user_rajesh@localhost                                                 |
+----------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `user_rajesh`@`localhost`                                  |
| GRANT ALL PRIVILEGES ON `bookstore`.* TO `user_rajesh`@`localhost`               |
| GRANT SELECT, INSERT, UPDATE ON `bookstore`.`books` TO `user_rajesh`@`localhost` |
+----------------------------------------------------------------------------------+
3 rows in set (0.00 sec)

mysql> REVOKE INSERT, UPDATE ON bookstore.books FROM 'user_rajesh'@'localhost';
Query OK, 0 rows affected (0.11 sec)

mysql> REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user_rajesh'@'localhost';
Query OK, 0 rows affected (0.24 sec)

mysql> DROP USER 'user_rajesh'@'localhost';
Query OK, 0 rows affected (0.15 sec)

mysql> exit
Bye
```