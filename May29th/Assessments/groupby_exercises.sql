SELECT category,
COUNT(*) AS product_count
FROM products
GROUP BY category;

SELECT category,
SUM(price) AS total_price
FROM products
GROUP BY category;

SELECT category,
COUNT(*) AS total_products
FROM products
GROUP BY category
HAVING COUNT(*) > 1;