# MySQL Cheat Sheet

## DDL (Data Definition Language) Commands
```sql
-- Create database/table
CREATE DATABASE database_name;
CREATE TABLE table_name (columns);

-- Alter table
ALTER TABLE table_name ADD column_name datatype;
ALTER TABLE table_name MODIFY column_name datatype;
ALTER TABLE table_name DROP COLUMN column_name;

-- Drop database/table
DROP DATABASE database_name;
DROP TABLE table_name;

-- Truncate table
TRUNCATE TABLE table_name;

-- Rename table
RENAME TABLE old_name TO new_name;
```

## DML (Data Manipulation Language) Commands
```sql
-- Insert data
INSERT INTO table_name (columns) VALUES (values);

-- Update data
UPDATE table_name SET column = value WHERE condition;

-- Delete data
DELETE FROM table_name WHERE condition;

-- Merge data
MERGE INTO target_table
USING source_table
ON (condition)
WHEN MATCHED THEN UPDATE SET column = value
WHEN NOT MATCHED THEN INSERT (columns) VALUES (values);
```

## DQL (Data Query Language) Commands
```sql
-- Basic select
SELECT * FROM table_name;
SELECT column1, column2 FROM table_name WHERE condition;

-- Filtering
SELECT * FROM table_name WHERE condition;
SELECT * FROM table_name WHERE column LIKE 'pattern';
SELECT * FROM table_name WHERE column IN (value1, value2);
SELECT * FROM table_name WHERE column BETWEEN value1 AND value2;

-- Grouping and sorting
SELECT column, COUNT(*) FROM table_name GROUP BY column;
SELECT * FROM table_name ORDER BY column [ASC|DESC];

-- Having clause
SELECT column, COUNT(*) FROM table_name
GROUP BY column HAVING COUNT(*) > value;
```

## DCL (Data Control Language) Commands
```sql
-- Grant privileges
GRANT privilege_type ON database.table TO 'username'@'host';

-- Revoke privileges
REVOKE privilege_type ON database.table FROM 'username'@'host';

-- Create user
CREATE USER 'username'@'host' IDENTIFIED BY 'password';

-- Drop user
DROP USER 'username'@'host';
```

## TCL (Transaction Control Language) Commands
```sql
-- Start transaction
START TRANSACTION;

-- Save changes
COMMIT;

-- Undo changes
ROLLBACK;

-- Create savepoint
SAVEPOINT savepoint_name;

-- Rollback to savepoint
ROLLBACK TO savepoint_name;

-- Set auto-commit
SET autocommit = 0|1;
```

## Connecting MySQL with Python
```python
# Using mysql-connector-python
import mysql.connector

# Connect to database
db = mysql.connector.connect(
    host="localhost",
    user="username",
    password="password",
    database="database_name"
)

# Create cursor
cursor = db.cursor()

# Execute query
cursor.execute("SELECT * FROM table_name")

# Fetch results
results = cursor.fetchall()

# Insert data
sql = "INSERT INTO table_name (column1, column2) VALUES (%s, %s)"
values = ("value1", "value2")
cursor.execute(sql, values)
db.commit()

# Close connection
cursor.close()
db.close()
```

## Keys in MySQL
```sql
-- Primary Key
CREATE TABLE table_name (
    id INT PRIMARY KEY,
    column2 datatype
);

-- Composite Primary Key
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    PRIMARY KEY (column1, column2)
);

-- Foreign Key
CREATE TABLE table_name (
    column1 datatype,
    FOREIGN KEY (column1) REFERENCES parent_table(parent_column)
);

-- Unique Key
CREATE TABLE table_name (
    column1 datatype UNIQUE
);
```

## Constraints in MySQL
```sql
-- Not Null
column_name datatype NOT NULL

-- Unique
column_name datatype UNIQUE

-- Check
column_name datatype CHECK (condition)

-- Default
column_name datatype DEFAULT value

-- Primary Key
column_name datatype PRIMARY KEY

-- Foreign Key
FOREIGN KEY (column_name) REFERENCES table_name(column_name)
```

## Common MySQL Keywords
- SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY
- INSERT, UPDATE, DELETE, TRUNCATE
- CREATE, ALTER, DROP, RENAME
- JOIN, UNION, INTERSECT, EXCEPT
- GRANT, REVOKE
- COMMIT, ROLLBACK, SAVEPOINT
- DISTINCT, AS, BETWEEN, LIKE, IN
- NULL, NOT NULL, DEFAULT
- ASC, DESC
- AND, OR, NOT
- COUNT, SUM, AVG, MIN, MAX

## Join Operations
```sql
-- Inner Join
SELECT * FROM table1
INNER JOIN table2 ON table1.column = table2.column;

-- Left Join
SELECT * FROM table1
LEFT JOIN table2 ON table1.column = table2.column;

-- Right Join
SELECT * FROM table1
RIGHT JOIN table2 ON table1.column = table2.column;

-- Cross Join
SELECT * FROM table1
CROSS JOIN table2;

-- Self Join
SELECT a.column, b.column
FROM table1 a, table1 b
WHERE a.column = b.column;
```

## Functions in MySQL
```sql
-- String Functions
LENGTH(), CONCAT(), SUBSTRING(), UPPER(), LOWER(), TRIM()

-- Numeric Functions
ROUND(), CEIL(), FLOOR(), ABS(), MOD()

-- Date Functions
NOW(), CURDATE(), CURTIME(), DATE_FORMAT(), DATEDIFF()

-- Aggregate Functions
COUNT(), SUM(), AVG(), MIN(), MAX()

-- Control Flow Functions
IF(), CASE, IFNULL(), COALESCE()
```

## Views in MySQL
```sql
-- Create View
CREATE VIEW view_name AS
SELECT columns
FROM table_name
WHERE condition;

-- Update View
ALTER VIEW view_name AS
SELECT columns
FROM table_name
WHERE condition;

-- Drop View
DROP VIEW view_name;

-- Show Views
SHOW FULL TABLES WHERE table_type = 'VIEW';
```

## Setting Environment Variables
```bash
# Windows
set PATH=%PATH%;C:\Program Files\MySQL\MySQL Server 8.0\bin

# Linux/Mac
export PATH=$PATH:/usr/local/mysql/bin
```

## Stored Procedures
```sql
-- Create Procedure
DELIMITER //
CREATE PROCEDURE procedure_name(parameter1 datatype, parameter2 datatype)
BEGIN
    -- SQL statements
END //
DELIMITER ;

-- Call Procedure
CALL procedure_name(value1, value2);

-- Drop Procedure
DROP PROCEDURE procedure_name;

-- Show Procedures
SHOW PROCEDURE STATUS;
```

## Export/Import
```bash
# Export (Backup)
mysqldump -u username -p database_name > backup.sql
mysqldump -u username -p database_name table_name > table_backup.sql

# Import (Restore)
mysql -u username -p database_name < backup.sql
```

## Indexes
```sql
-- Create Index
CREATE INDEX index_name ON table_name (column1, column2);

-- Create Unique Index
CREATE UNIQUE INDEX index_name ON table_name (column);

-- Show Indexes
SHOW INDEX FROM table_name;

-- Drop Index
DROP INDEX index_name ON table_name;
```

## Data Types
1. **Numeric Types**
   - INT, TINYINT, SMALLINT, MEDIUMINT, BIGINT
   - DECIMAL, FLOAT, DOUBLE
   - BIT

2. **String Types**
   - CHAR, VARCHAR
   - TEXT, TINYTEXT, MEDIUMTEXT, LONGTEXT
   - BINARY, VARBINARY
   - BLOB, TINYBLOB, MEDIUMBLOB, LONGBLOB
   - ENUM, SET

3. **Date/Time Types**
   - DATE, TIME, DATETIME
   - TIMESTAMP
   - YEAR

## Exception Handling
```sql
-- Basic Exception Handling
DELIMITER //
CREATE PROCEDURE example_procedure()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Error handling code
        ROLLBACK;
        SELECT 'An error occurred';
    END;
    
    START TRANSACTION;
        -- SQL statements
    COMMIT;
END //
DELIMITER ;

-- Specific Error Handling
DECLARE EXIT HANDLER FOR 1062 -- Duplicate key error
BEGIN
    SELECT 'Duplicate key error occurred';
END;

-- Continue Handler
DECLARE CONTINUE HANDLER FOR SQLWARNING
BEGIN
    -- Warning handling code
END;
```
