Use bookstore;
-- Drop the existing fulltext index if it exists
DROP INDEX idx_fulltext ON books;

-- Create a fulltext index with a new name
CREATE FULLTEXT INDEX idx_fulltext_title_desc ON books(title, description);

-- Drop the existing bookstore_locations table if it exists
DROP TABLE IF EXISTS bookstore_locations;

-- Create the bookstore_locations table with SRID
CREATE TABLE bookstore_locations (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    location POINT NOT NULL SRID 4326,
    SPATIAL INDEX(location)
);

-- Insert a sample record into bookstore_locations
INSERT INTO bookstore_locations (id, name, location) VALUES
(1, 'Central Bookstore', ST_GeomFromText('POINT(72.8777 19.0760)', 4326));

-- Spatial query example
SELECT name, ST_Distance_Sphere(
    location, 
    ST_GeomFromText('POINT(72.8777 19.0760)', 4326)
) AS distance_meters
FROM bookstore_locations
WHERE ST_Distance_Sphere(
    location, 
    ST_GeomFromText('POINT(72.8777 19.0760)', 4326)
) <= 10000;  -- Find locations within 10km

-- Show indexes on the books table
SHOW INDEX FROM books;

-- Show indexes on the bookstore_locations table
SHOW INDEX FROM bookstore_locations;