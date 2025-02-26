```bash
rajesh@singh:~$ sudo mysql -u root -p
[sudo] password for rajesh: 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 19
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
mysql> DROP INDEX idx_fulltext ON books;
ERROR 1091 (42000): Can't DROP 'idx_fulltext'; check that column/key exists
mysql> 
mysql> CREATE FULLTEXT INDEX idx_fulltext_title_desc ON books(title, description);
ERROR 1061 (42000): Duplicate key name 'idx_fulltext_title_desc'
mysql> 
mysql> DROP TABLE IF EXISTS bookstore_locations;
Query OK, 0 rows affected (0.69 sec)

mysql> 
mysql> CREATE TABLE bookstore_locations (
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(100),
    ->     location POINT NOT NULL SRID 4326,
    ->     SPATIAL INDEX(location)
    -> );
Query OK, 0 rows affected (1.00 sec)

mysql> 
mysql> INSERT INTO bookstore_locations (id, name, location) VALUES
    -> (1, 'Central Bookstore', ST_GeomFromText('POINT(72.8777 19.0760)', 4326));
Query OK, 1 row affected (0.14 sec)

mysql> 
mysql> SELECT name, ST_Distance_Sphere(
    ->     location, 
    ->     ST_GeomFromText('POINT(72.8777 19.0760)', 4326)
    -> ) AS distance_meters
    -> FROM bookstore_locations
    -> WHERE ST_Distance_Sphere(
    ->     location, 
    ->     ST_GeomFromText('POINT(72.8777 19.0760)', 4326)
    -> ) <= 10000;  -- Find locations within 10km
+-------------------+-----------------+
| name              | distance_meters |
+-------------------+-----------------+
| Central Bookstore |               0 |
+-------------------+-----------------+
1 row in set (0.01 sec)

mysql> 
mysql> SHOW INDEX FROM books;
+-------+------------+-------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name                | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------+------------+-------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| books |          0 | PRIMARY                 |            1 | book_id     | A         |           5 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| books |          0 | idx_title               |            1 | title       | A         |           5 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| books |          1 | idx_author_id           |            1 | author_id   | A         |           5 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| books |          1 | idx_author_title        |            1 | author_id   | A         |           5 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| books |          1 | idx_author_title        |            2 | title       | A         |           5 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| books |          1 | idx_fulltext_title_desc |            1 | title       | NULL      |           5 |     NULL |   NULL |      | FULLTEXT   |         |               | YES     | NULL       |
| books |          1 | idx_fulltext_title_desc |            2 | description | NULL      |           5 |     NULL |   NULL | YES  | FULLTEXT   |         |               | YES     | NULL       |
+-------+------------+-------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
7 rows in set (0.01 sec)

mysql> 
mysql> SHOW INDEX FROM bookstore_locations;
+---------------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table               | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| bookstore_locations |          0 | PRIMARY  |            1 | id          | A         |           1 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| bookstore_locations |          1 | location |            1 | location    | A         |           1 |       32 |   NULL |      | SPATIAL    |         |               | YES     | NULL       |
+---------------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.15 sec)

```