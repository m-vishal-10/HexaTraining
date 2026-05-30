SELECT COUNT(*) AS total_products
FROM products;

SELECT MAX(price) AS highest_price
FROM products;

SELECT MIN(price) AS lowest_price
FROM products;

SELECT AVG(price) AS average_price
FROM products;

SELECT SUM(stock_quantity) AS total_stock
FROM products;