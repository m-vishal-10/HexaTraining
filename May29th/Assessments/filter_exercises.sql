SELECT * 
FROM products
WHERE category = 'Electronics';

SELECT *
FROM products
WHERE NOT category = 'Electronics';

SELECT *
FROM products
WHERE category = 'Electronics'
AND price > 20000;

SELECT *
FROM products
WHERE supplier_city = 'Hyderabad'
OR supplier_city = 'Delhi';

SELECT *
FROM products
WHERE price BETWEEN 500 AND 20000;

SELECT *
FROM products
WHERE supplier_city IN ('Hyderabad', 'Delhi');

-- Starts with P
SELECT *
FROM products
WHERE product_name LIKE 'P%';

-- Ends with r
SELECT *
FROM products
WHERE product_name LIKE '%r';

-- Contains top
SELECT *
FROM products
WHERE product_name LIKE '%top%';