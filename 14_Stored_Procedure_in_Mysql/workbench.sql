USE bookstore;

-- Create a simple stored procedure
DELIMITER //
CREATE PROCEDURE GetAllBooks()
BEGIN
    SELECT * FROM books;
END //
DELIMITER ;

-- Call the stored procedure
CALL GetAllBooks();

-- Stored procedure with parameters
DELIMITER //
CREATE PROCEDURE GetBooksByAuthor(IN author_first_name VARCHAR(50), IN author_last_name VARCHAR(50))
BEGIN
    SELECT b.title, b.publication_date, b.price
    FROM books b
    JOIN authors a ON b.author_id = a.author_id
    WHERE a.first_name = author_first_name AND a.last_name = author_last_name;
END //
DELIMITER ;

-- Call the parameterized stored procedure
CALL GetBooksByAuthor('Aarav', 'Patel');

-- Stored procedure with OUT parameter
DELIMITER //
CREATE PROCEDURE GetBookCount(OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total FROM books;
END //
DELIMITER ;

-- Call procedure with OUT parameter
CALL GetBookCount(@total);
SELECT @total AS total_books;

-- Stored procedure with conditional logic (CORRECTED)
DELIMITER //
CREATE PROCEDURE ClassifyBook(IN input_book_id INT, OUT classification VARCHAR(20))
BEGIN
    DECLARE book_price DECIMAL(10,2);
    
    SELECT price INTO book_price FROM books WHERE book_id = input_book_id;
    
    IF book_price IS NULL THEN
        SET classification = 'Book not found';
    ELSEIF book_price < 15 THEN
        SET classification = 'Budget';
    ELSEIF book_price < 20 THEN
        SET classification = 'Standard';
    ELSE
        SET classification = 'Premium';
    END IF;
END //
DELIMITER ;

-- Call the classification procedure
CALL ClassifyBook(1, @classification);
SELECT @classification;

-- Drop a stored procedure
DROP PROCEDURE IF EXISTS GetAllBooks;
DROP PROCEDURE IF EXISTS GetBooksByAuthor;
DROP PROCEDURE IF EXISTS ClassifyBook;
DROP PROCEDURE IF EXISTS GetBookCount;
