
-- Procedure to add a new book with exception handling
DELIMITER //
CREATE PROCEDURE add_new_book(
    IN p_title VARCHAR(255),
    IN p_author_id INT,
    IN p_description TEXT,
    IN p_price DECIMAL(10, 2),
    IN p_publication_date DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
            @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
        SET @full_error = CONCAT('ERROR ', @errno, ' (', @sqlstate, '): ', @text);
        SELECT @full_error AS 'Error';
        ROLLBACK;
    END;

    START TRANSACTION;
        INSERT INTO books (title, author_id, description, price, publication_date)
        VALUES (p_title, p_author_id, p_description, p_price, p_publication_date);
        
        SELECT CONCAT('Book "', p_title, '" added successfully with ID ', LAST_INSERT_ID()) AS 'Success';
    COMMIT;
END //
DELIMITER ;

-- Procedure to update book price with exception handling
DELIMITER //
CREATE PROCEDURE update_book_price(
    IN p_book_id INT,
    IN p_new_price DECIMAL(10, 2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
            @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
        SET @full_error = CONCAT('ERROR ', @errno, ' (', @sqlstate, '): ', @text);
        SELECT @full_error AS 'Error';
        ROLLBACK;
    END;

    START TRANSACTION;
        UPDATE books SET price = p_new_price WHERE book_id = p_book_id;
        
        IF ROW_COUNT() = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Book ID not found';
        ELSE
            SELECT CONCAT('Price updated for book ID ', p_book_id) AS 'Success';
        END IF;
    COMMIT;
END //
DELIMITER ;
