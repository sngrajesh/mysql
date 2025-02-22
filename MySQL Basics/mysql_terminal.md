```bash
sudo mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 19
Server version: 8.0.37-0ubuntu0.22.04.3 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE InfoStretch;
ERROR 1007 (HY000): Can't create database 'InfoStretch'; database exists
mysql> USE InfoStretch;
Database changed
mysql> CREATE TABLE Course (
    ->     COURSE_ID INT NOT NULL PRIMARY KEY,
    ->     COURSE_NAME VARCHAR(50),
    ->     COURSE_DURATION INT,
    ->     COURSE_FEE INT
    -> );
Query OK, 0 rows affected (0.78 sec)

mysql> INSERT INTO Course (COURSE_ID, COURSE_NAME, COURSE_DURATION, COURSE_FEE)
    -> VALUES
    -> (1, 'Python Programming', 30, 5000),
    -> (2, 'Java Programming', 30, 6000),
    -> (3, 'Data Science with Python', 45, 8000),
    -> (4, 'Machine Learning with Python', 45, 10000),
    -> (5, 'Web Development with HTML/CSS/JS', 60, 12000),
    -> (6, 'Android App Development', 60, 15000),
    -> (7, 'Cloud Computing', 30, 7000),
    -> (8, 'Cyber Security', 45, 9000),
    -> (9, 'Data Analytics', 30, 6000),
    -> (10, 'Artificial Intelligence', 60, 18000);
Query OK, 10 rows affected (0.10 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE Student (
    ->     STUDENT_ID INT NOT NULL PRIMARY KEY,
    ->     STUDENT_NAME VARCHAR(50),
    ->     EMAIL VARCHAR(100),
    ->     PHONE VARCHAR(20),
    ->     COURSE_ID INT,
    ->     FOREIGN KEY (COURSE_ID) REFERENCES Course(COURSE_ID)
    -> );
Query OK, 0 rows affected (2.12 sec)

mysql> INSERT INTO Student (STUDENT_ID, STUDENT_NAME, EMAIL, PHONE, COURSE_ID)
    -> VALUES
    -> (1, 'John Doe', 'john.doe@example.com', '1234567890', 1),
    -> (2, 'Jane Smith', 'jane.smith@example.com', '0987654321', 2),
    -> (3, 'Bob Johnson', 'bob.johnson@example.com', '1112223333', 3),
    -> (4, 'Alice Brown', 'alice.brown@example.com', '4445556666', 4),
    -> (5, 'Mike Davis', 'mike.davis@example.com', '7778889999', 5),
    -> (6, 'Emily Chen', 'emily.chen@example.com', '2223334444', 6),
    -> (7, 'David Lee', 'david.lee@example.com', '5556667777', 7),
    -> (8, 'Sarah Taylor', 'sarah.taylor@example.com', '8889990000', 8),
    -> (9, 'Kevin White', 'kevin.white@example.com', '3334445555', 9),
    -> (10, 'Lisa Nguyen', 'lisa.nguyen@example.com', '6667778888', 10);
Query OK, 10 rows affected (0.17 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Course WHERE COURSE_DURATION > 45;
+-----------+----------------------------------+-----------------+------------+
| COURSE_ID | COURSE_NAME                      | COURSE_DURATION | COURSE_FEE |
+-----------+----------------------------------+-----------------+------------+
|         5 | Web Development with HTML/CSS/JS |              60 |      12000 |
|         6 | Android App Development          |              60 |      15000 |
|        10 | Artificial Intelligence          |              60 |      18000 |
+-----------+----------------------------------+-----------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Student WHERE COURSE_ID = 3;
+------------+--------------+-------------------------+------------+-----------+
| STUDENT_ID | STUDENT_NAME | EMAIL                   | PHONE      | COURSE_ID |
+------------+--------------+-------------------------+------------+-----------+
|          3 | Bob Johnson  | bob.johnson@example.com | 1112223333 |         3 |
+------------+--------------+-------------------------+------------+-----------+
1 row in set (0.00 sec)

mysql> SELECT * FROM Course ORDER BY COURSE_FEE ASC;
+-----------+----------------------------------+-----------------+------------+
| COURSE_ID | COURSE_NAME                      | COURSE_DURATION | COURSE_FEE |
+-----------+----------------------------------+-----------------+------------+
|         1 | Python Programming               |              30 |       5000 |
|         2 | Java Programming                 |              30 |       6000 |
|         9 | Data Analytics                   |              30 |       6000 |
|         7 | Cloud Computing                  |              30 |       7000 |
|         3 | Data Science with Python         |              45 |       8000 |
|         8 | Cyber Security                   |              45 |       9000 |
|         4 | Machine Learning with Python     |              45 |      10000 |
|         5 | Web Development with HTML/CSS/JS |              60 |      12000 |
|         6 | Android App Development          |              60 |      15000 |
|        10 | Artificial Intelligence          |              60 |      18000 |
+-----------+----------------------------------+-----------------+------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM Student ORDER BY STUDENT_NAME DESC;
+------------+--------------+--------------------------+------------+-----------+
| STUDENT_ID | STUDENT_NAME | EMAIL                    | PHONE      | COURSE_ID |
+------------+--------------+--------------------------+------------+-----------+
|          8 | Sarah Taylor | sarah.taylor@example.com | 8889990000 |         8 |
|          5 | Mike Davis   | mike.davis@example.com   | 7778889999 |         5 |
|         10 | Lisa Nguyen  | lisa.nguyen@example.com  | 6667778888 |        10 |
|          9 | Kevin White  | kevin.white@example.com  | 3334445555 |         9 |
|          1 | John Doe     | john.doe@example.com     | 1234567890 |         1 |
|          2 | Jane Smith   | jane.smith@example.com   | 0987654321 |         2 |
|          6 | Emily Chen   | emily.chen@example.com   | 2223334444 |         6 |
|          7 | David Lee    | david.lee@example.com    | 5556667777 |         7 |
|          3 | Bob Johnson  | bob.johnson@example.com  | 1112223333 |         3 |
|          4 | Alice Brown  | alice.brown@example.com  | 4445556666 |         4 |
+------------+--------------+--------------------------+------------+-----------+
10 rows in set (0.00 sec)

mysql> INSERT INTO Course (COURSE_ID, COURSE_NAME, COURSE_DURATION, COURSE_FEE)
    -> VALUES (11, 'Data Engineering', 60, 20000);
Query OK, 1 row affected (0.10 sec)

mysql> INSERT INTO Student (STUDENT_ID, STUDENT_NAME, EMAIL, PHONE, COURSE_ID)
    -> VALUES (11, 'Olivia Martin', 'olivia.martin@example.com', '1234567890', 11);
Query OK, 1 row affected (0.12 sec)

mysql> DELETE FROM Course WHERE COURSE_ID = 2;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`InfoStretch`.`Student`, CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`COURSE_ID`) REFERENCES `Course` (`COURSE_ID`))
mysql> DELETE FROM Student WHERE STUDENT_ID = 5;
Query OK, 1 row affected (0.19 sec)

mysql> SELECT s.STUDENT_NAME, c.COURSE_NAME
    -> FROM Student s
    -> JOIN Course c ON s.COURSE_ID = c.COURSE_ID;
+---------------+------------------------------+
| STUDENT_NAME  | COURSE_NAME                  |
+---------------+------------------------------+
| John Doe      | Python Programming           |
| Jane Smith    | Java Programming             |
| Bob Johnson   | Data Science with Python     |
| Alice Brown   | Machine Learning with Python |
| Emily Chen    | Android App Development      |
| David Lee     | Cloud Computing              |
| Sarah Taylor  | Cyber Security               |
| Kevin White   | Data Analytics               |
| Lisa Nguyen   | Artificial Intelligence      |
| Olivia Martin | Data Engineering             |
+---------------+------------------------------+
10 rows in set (0.00 sec)

mysql> SELECT s.STUDENT_NAME, c.COURSE_FEE
    -> FROM Student s
    -> JOIN Course c ON s.COURSE_ID = c.COURSE_ID;
+---------------+------------+
| STUDENT_NAME  | COURSE_FEE |
+---------------+------------+
| John Doe      |       5000 |
| Jane Smith    |       6000 |
| Bob Johnson   |       8000 |
| Alice Brown   |      10000 |
| Emily Chen    |      15000 |
| David Lee     |       7000 |
| Sarah Taylor  |       9000 |
| Kevin White   |       6000 |
| Lisa Nguyen   |      18000 |
| Olivia Martin |      20000 |
+---------------+------------+
10 rows in set (0.00 sec)

mysql> DROP TABLE Student;
Query OK, 0 rows affected (0.54 sec)

mysql> DROP TABLE Course;
Query OK, 0 rows affected (0.53 sec)

mysql> exit
Bye
```