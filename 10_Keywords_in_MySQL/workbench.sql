# Common Keywords in MySQL
/*
1. SELECT: Retrieves data from one or more tables
2. FROM: Specifies the table to retrieve data from
3. WHERE: Filters the results based on a condition
4. INSERT: Adds new data into a table
5. UPDATE: Modifies existing data in a table
6. DELETE: Removes data from a table
7. CREATE: Creates a new database, table, index, or view
8. ALTER: Modifies an existing database object
9. DROP: Removes an existing database, table, index, or view
10. JOIN: Combines rows from two or more tables
11. UNION: Combines the result set of two or more SELECT statements
12. GROUP BY: Groups rows that have the same values
13. HAVING: Specifies a search condition for a group
14. ORDER BY: Sorts the result set in ascending or descending order
15. LIMIT: Specifies the maximum number of records to return
*/

SELECT products.name, COUNT(orders.id) as order_count
FROM products
LEFT JOIN orders ON products.id = orders.product_id
GROUP BY products.id
HAVING order_count > 0
ORDER BY order_count DESC
LIMIT 10;

