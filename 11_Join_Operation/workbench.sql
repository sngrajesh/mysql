Use bookstore;
Drop Table IF EXISTS books;
Drop Table IF EXISTS authors ;
Drop Table IF EXISTS book_categories;

CREATE TABLE authors (
  id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE book_categories (
  id INT AUTO_INCREMENT,
  category VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE books (
  id INT AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  author_id INT,
  category_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (category_id) REFERENCES book_categories(id)
);


-- Insert data
INSERT INTO authors (name) VALUES
('name_1'),
('name_2'),
('name_3'),
('name_4'),
('name_5'),
('name_6'),
('name_7'),
('name_8'),
('name_9'),
('name_10');

INSERT INTO book_categories (category) VALUES
('category_1'),
('category_2'),
('category_3'),
('category_4'),
('category_5'),
('category_6'),
('category_7'),
('category_8'),
('category_9'),
('category_10');


INSERT INTO books (title, author_id, category_id) VALUES
('book_1', 1, 1),
('book_2', 2, 2),
('book_3', 3, 3),
('book_4', 4, 4),
('book_5', 5, 5),
('book_6', 6, 6),
('book_7', 7, 7),
('book_8', 8, 8),
('book_9', 9, 9),
('book_10', 10, 10),
('book_11', 1, 2),
('book_12', 2, 3),
('book_13', 3, 4),
('book_14', 4, 5),
('book_15', 5, 6);


-- INNER JOIN
SELECT books.title, authors.name
FROM books
INNER JOIN authors ON books.author_id = authors.id;

-- LEFT JOIN
SELECT authors.name, books.title
FROM authors
LEFT JOIN books ON authors.id = books.author_id;

-- RIGHT JOIN
SELECT books.title, book_categories.category
FROM books
RIGHT JOIN book_categories ON books.category_id = book_categories.id;

-- FULL OUTER JOIN - MySQL doesn't support FULL OUTER JOIN directly - UNION use to do FULL JOIN
SELECT authors.name, books.title
FROM authors
LEFT JOIN books ON authors.id = books.author_id
UNION
SELECT authors.name, books.title
FROM authors
RIGHT JOIN books ON authors.id = books.author_id
WHERE authors.id IS NULL;

-- CROSS JOIN
SELECT books.title, book_categories.category
FROM books
CROSS JOIN book_categories;

-- SELF JOIN
SELECT a.title AS book1, b.title AS book2, a.author_id
FROM books a
INNER JOIN books b ON a.author_id = b.author_id AND a.id < b.id;