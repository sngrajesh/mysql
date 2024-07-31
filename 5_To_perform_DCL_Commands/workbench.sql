-- MySQL DCL Commands -> Data Control Language

-- Create a new user
CREATE USER 'user_rajesh'@'localhost' IDENTIFIED BY 'P@ssw0rd#987';

-- Grant privileges
GRANT SELECT, INSERT, UPDATE ON bookstore.books TO 'user_rajesh'@'localhost';

-- Grant all privileges on a specific database
GRANT ALL PRIVILEGES ON bookstore.* TO 'user_rajesh'@'localhost';

-- Show grants for a user
SHOW GRANTS FOR 'user_rajesh'@'localhost';

-- Revoke specific privileges
REVOKE INSERT, UPDATE ON bookstore.books FROM 'user_rajesh'@'localhost';

-- Revoke all privileges
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user_rajesh'@'localhost';

-- Delete a user
DROP USER 'user_rajesh'@'localhost';