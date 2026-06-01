
-- CREATE DATABASE retail_capstone_db;
-- USE retail_capstone_db;


-- customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    gender VARCHAR(10),
    membership_type VARCHAR(30)
);

-- products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

-- order items table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

-- payments table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_mode VARCHAR(30),
    payment_status VARCHAR(30),
    amount DECIMAL(10,2),

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
);

-- deliveries table
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    delivery_partner VARCHAR(50),
    delivery_status VARCHAR(30),
    delivery_city VARCHAR(50),

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
);


INSERT INTO customers VALUES
(1, 'Aarav Sharma', 'Mumbai', 'Maharashtra', 'Male', 'Gold'),
(2, 'Priya Nair', 'Chennai', 'Tamil Nadu', 'Female', 'Silver'),
(3, 'Rohan Mehta', 'Hyderabad', 'Telangana', 'Male', 'Gold'),
(4, 'Sneha Reddy', 'Hyderabad', 'Telangana', 'Female', 'Regular'),
(5, 'Karan Patel', 'Ahmedabad', 'Gujarat', 'Male', 'Silver'),
(6, 'Divya Iyer', 'Chennai', 'Tamil Nadu', 'Female', 'Gold'),
(7, 'Amit Verma', 'Delhi', 'Delhi', 'Male', 'Regular'),
(8, 'Pooja Singh', 'Mumbai', 'Maharashtra', 'Female', 'Silver'),
(9, 'Rahul Gupta', 'Hyderabad', 'Telangana', 'Male', 'Regular'),
(10, 'Anjali Desai', 'Ahmedabad', 'Gujarat', 'Female', 'Gold');


INSERT INTO products VALUES
(1, 'Samsung Galaxy M34', 'Electronics', 18999.00),
(2, 'boAt Rockerz 450', 'Electronics', 1499.00),
(3, 'Nike Running Shoes', 'Fashion', 4599.00),
(4, 'Levis Jeans 511', 'Fashion', 2999.00),
(5, 'Prestige Induction', 'Home', 3299.00),
(6, 'Milton Water Bottle', 'Home', 499.00),
(7, 'Organic Honey 500g', 'Grocery', 349.00),
(8, 'Tata Tea Premium', 'Grocery', 220.00),
(9, 'Casio Digital Watch', 'Electronics', 2199.00),
(10, 'Woodland Casual Shirt', 'Fashion', 1799.00);


INSERT INTO orders VALUES
(101, 1, '2026-01-05', 'Delivered'),
(102, 2, '2026-01-10', 'Delivered'),
(103, 3, '2026-01-15', 'Delivered'),
(104, 4, '2026-01-18', 'Cancelled'),
(105, 5, '2026-01-20', 'Delivered'),
(106, 6, '2026-01-22', 'Pending'),
(107, 1, '2026-02-01', 'Delivered'),
(108, 3, '2026-02-05', 'Pending'),
(109, 7, '2026-02-08', 'Delivered'),
(110, 8, '2026-02-10', 'Cancelled'),
(111, 9, '2026-02-14', 'Delivered'),
(112, 10, '2026-02-18', 'Delivered'),
(113, 2, '2026-03-01', 'Pending'),
(114, 6, '2026-03-05', 'Delivered'),
(115, 1, '2026-03-10', 'Delivered');


INSERT INTO order_items VALUES
(1001, 101, 1, 1),
(1002, 101, 2, 2),
(1003, 102, 3, 1),
(1004, 103, 1, 1),
(1005, 103, 9, 1),
(1006, 104, 4, 2),
(1007, 105, 5, 1),
(1008, 105, 6, 3),
(1009, 106, 7, 4),
(1010, 107, 10, 2),
(1011, 107, 4, 1),
(1012, 108, 2, 1),
(1013, 109, 3, 2),
(1014, 109, 4, 1),
(1015, 110, 8, 5),
(1016, 111, 9, 1),
(1017, 112, 1, 1),
(1018, 113, 6, 2),
(1019, 114, 5, 1),
(1020, 115, 7, 3);


INSERT INTO payments VALUES
(201, 101, 'UPI', 'Success', 21997.00),
(202, 102, 'Credit Card', 'Success', 4599.00),
(203, 103, 'Net Banking', 'Success', 21198.00),
(204, 104, 'UPI', 'Failed', 0.00),
(205, 105, 'Debit Card', 'Success', 4796.00),
(206, 106, 'UPI', 'Pending', 1396.00),
(207, 107, 'Cash on Del', 'Success', 6597.00),
(208, 108, 'UPI', 'Pending', 1499.00),
(209, 109, 'Credit Card', 'Success', 12197.00),
(210, 110, 'Net Banking', 'Failed', 1100.00),
(211, 111, 'UPI', 'Success', 2199.00),
(212, 112, 'Debit Card', 'Success', 18999.00),
(213, 113, 'UPI', 'Pending', 998.00),
(214, 114, 'Credit Card', 'Success', 3299.00),
(215, 115, 'UPI', 'Success', 1047.00);


INSERT INTO deliveries VALUES
(301, 101, 'Delhivery', 'Delivered', 'Mumbai'),
(302, 102, 'Blue Dart', 'Delivered', 'Chennai'),
(303, 103, 'Ekart', 'Delivered', 'Hyderabad'),
(304, 104, 'Delhivery', 'Cancelled', 'Hyderabad'),
(305, 105, 'DTDC', 'Delivered', 'Ahmedabad'),
(306, 106, 'Ekart', 'Pending', 'Chennai'),
(307, 107, 'Blue Dart', 'Delivered', 'Mumbai'),
(308, 108, 'Delhivery', 'Pending', 'Hyderabad'),
(309, 109, 'DTDC', 'Delivered', 'Delhi'),
(310, 110, 'Ekart', 'Cancelled', 'Mumbai'),
(311, 111, 'Blue Dart', 'Delivered', 'Hyderabad'),
(312, 112, 'Delhivery', 'Delivered', 'Ahmedabad'),
(313, 113, 'Ekart', 'Pending', 'Chennai'),
(314, 114, 'Blue Dart', 'Delivered', 'Chennai'),
(315, 115, 'DTDC', 'Delivered', 'Mumbai');


--  Display all customers.
SELECT * FROM customers;

-- Display customer name, city, and membership type.
SELECT customer_name, city, membership_type
FROM customers;

--  Display all products sorted by price descending.
SELECT * FROM products
ORDER BY price DESC;

--  Find customers from Hyderabad.
SELECT * FROM customers
WHERE city = 'Hyderabad';

-- Find Gold membership customers.
SELECT * FROM customers
WHERE membership_type = 'Gold';

-- Find products priced between ₹500 and ₹5000.
SELECT * FROM products
WHERE price BETWEEN 500 AND 5000;

-- Find products from categories Electronics and Fashion.
SELECT * FROM products
WHERE category IN ('Electronics', 'Fashion');

-- Find orders placed after 2026-01-01.
SELECT * FROM orders
WHERE order_date > '2026-01-01';

--  Find payments made using UPI.
SELECT * FROM payments
WHERE payment_mode = 'UPI';

-- Find deliveries that are still pending.
SELECT * FROM deliveries
WHERE delivery_status = 'Pending';


-- AGGREGATE QUERIES 

--  Count total customers.
SELECT COUNT(*) AS total_customers FROM customers;

-- Count total orders.
SELECT COUNT(*) AS total_orders FROM orders;

-- Count total products.
SELECT COUNT(*) AS total_products FROM products;

--  Find total revenue from successful payments.
SELECT SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'Success';

-- Find average order payment amount.
SELECT ROUND(AVG(amount), 2) AS avg_payment_amount
FROM payments;

--  Find highest payment amount.
SELECT MAX(amount) AS highest_payment FROM payments;

--  Find lowest payment amount.
SELECT MIN(amount) AS lowest_payment FROM payments;

-- Count customers by city.
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city
ORDER BY customer_count DESC;

--  Count products by category.
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

-- Count orders by order status.
SELECT order_status, COUNT(*) AS order_count
FROM orders
GROUP BY order_status;


-- JOINS

-- Display customer name with order ID and order date.
SELECT c.customer_name, o.order_id, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

--  Display order ID, product name, quantity, and price.
SELECT oi.order_id, p.product_name, oi.quantity, p.price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

--  Display customer name, product name, quantity, and order date.
SELECT c.customer_name, p.product_name, oi.quantity, o.order_date
FROM customers c
JOIN orders     o  ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id   = oi.order_id
JOIN products    p  ON oi.product_id = p.product_id;

-- Display order ID with payment mode, payment status, and amount.
SELECT o.order_id, py.payment_mode, py.payment_status, py.amount
FROM orders o
JOIN payments py ON o.order_id = py.order_id;

--  Display order ID with delivery partner and delivery status.
SELECT o.order_id, d.delivery_partner, d.delivery_status
FROM orders o
JOIN deliveries d ON o.order_id = d.order_id;

-- Full order report.
SELECT
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    p.product_name,
    p.category,
    oi.quantity,
    p.price,
    py.payment_status,
    d.delivery_status
FROM customers   c
JOIN orders      o  ON c.customer_id  = o.customer_id
JOIN order_items oi ON o.order_id     = oi.order_id
JOIN products    p  ON oi.product_id  = p.product_id
JOIN payments    py ON o.order_id     = py.order_id
JOIN deliveries  d  ON o.order_id     = d.order_id;


-- GROUP BY AND HAVING 

-- Total revenue by city.
SELECT c.city, SUM(py.amount) AS total_revenue
FROM customers c
JOIN orders    o  ON c.customer_id = o.customer_id
JOIN payments  py ON o.order_id    = py.order_id
WHERE py.payment_status = 'Success'
GROUP BY c.city
ORDER BY total_revenue DESC;

--  Total revenue by customer.
SELECT c.customer_name, SUM(py.amount) AS total_spent
FROM customers c
JOIN orders    o  ON c.customer_id = o.customer_id
JOIN payments  py ON o.order_id    = py.order_id
WHERE py.payment_status = 'Success'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-- Total quantity sold by product.
SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold
FROM products    p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC;

-- Revenue by product category.
SELECT p.category, SUM(py.amount) AS category_revenue
FROM products    p
JOIN order_items oi ON p.product_id  = oi.product_id
JOIN orders       o ON oi.order_id   = o.order_id
JOIN payments    py ON o.order_id    = py.order_id
WHERE py.payment_status = 'Success'
GROUP BY p.category
ORDER BY category_revenue DESC;

--  Number of orders by customer.
SELECT c.customer_name, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders    o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY order_count DESC;

-- Customers having more than 1 order.
SELECT c.customer_name, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders    o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1;

-- Product categories having revenue greater than ₹10,000.
SELECT p.category, SUM(py.amount) AS category_revenue
FROM products    p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders       o ON oi.order_id  = o.order_id
JOIN payments    py ON o.order_id   = py.order_id
WHERE py.payment_status = 'Success'
GROUP BY p.category
HAVING SUM(py.amount) > 10000;

-- Cities having more than 2 customers.
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city
HAVING COUNT(*) > 2;

--  Products sold more than 3 times (total quantity > 3).
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM products    p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(oi.quantity) > 3;


-- SUBQUERIES

-- Find customers who placed orders.
SELECT * FROM customers
WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders);

-- Find customers who never placed orders.
SELECT * FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);

-- Find products that were never ordered.
SELECT * FROM products
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM order_items);

-- Fnd orders with payment amount greater than average payment amount.
SELECT o.*, py.amount
FROM orders   o
JOIN payments py ON o.order_id = py.order_id
WHERE py.amount > (SELECT AVG(amount) FROM payments);

-- Find the customer who made the highest payment.
SELECT c.*
FROM customers c
JOIN orders    o  ON c.customer_id = o.customer_id
JOIN payments  py ON o.order_id    = py.order_id
WHERE py.amount = (SELECT MAX(amount) FROM payments);

-- Find products priced above the average product price.
SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- Find customers who ordered Electronics products.
SELECT DISTINCT c.*
FROM customers c
WHERE c.customer_id IN (
    SELECT o.customer_id
    FROM orders o
    JOIN order_items oi ON o.order_id   = oi.order_id
    JOIN products    p  ON oi.product_id = p.product_id
    WHERE p.category = 'Electronics'
);

-- Find orders that have successful payments.
SELECT * FROM orders
WHERE order_id IN (
    SELECT order_id FROM payments
    WHERE payment_status = 'Success'
);

-- Find orders that are not delivered yet.
SELECT * FROM orders
WHERE order_id IN (
    SELECT order_id FROM deliveries
    WHERE delivery_status != 'Delivered'
);

-- Find customers whose total spending is above average customer spending.
SELECT c.customer_name, SUM(py.amount) AS total_spent
FROM customers c
JOIN orders    o  ON c.customer_id = o.customer_id
JOIN payments  py ON o.order_id    = py.order_id
WHERE py.payment_status = 'Success'
GROUP BY c.customer_id, c.customer_name
HAVING SUM(py.amount) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT c2.customer_id, SUM(py2.amount) AS customer_total
        FROM customers c2
        JOIN orders    o2  ON c2.customer_id = o2.customer_id
        JOIN payments  py2 ON o2.order_id    = py2.order_id
        WHERE py2.payment_status = 'Success'
        GROUP BY c2.customer_id
    ) AS spending_summary
);

--  DATA QUALITY CHECKS

-- Find orders without payment records.
SELECT * FROM orders
WHERE order_id NOT IN (SELECT order_id FROM payments);

-- Find orders without delivery records.
SELECT * FROM orders
WHERE order_id NOT IN (SELECT order_id FROM deliveries);

-- Find payments where amount is NULL or 0.
SELECT * FROM payments
WHERE amount IS NULL OR amount = 0;

-- Find cancelled orders with successful payment.
SELECT o.order_id, o.order_status, py.payment_status, py.amount
FROM orders   o
JOIN payments py ON o.order_id = py.order_id
WHERE o.order_status = 'Cancelled'
  AND py.payment_status = 'Success';

-- Find delivered orders with failed payment.
SELECT o.order_id, o.order_status, py.payment_status, py.amount
FROM orders   o
JOIN payments py ON o.order_id = py.order_id
WHERE o.order_status = 'Delivered'
  AND py.payment_status = 'Failed';

-- Find order items with invalid product IDs (no matching product).
SELECT * FROM order_items
WHERE product_id NOT IN (SELECT product_id FROM products);

-- Find orders with invalid customer IDs (no matching customer).
SELECT * FROM orders
WHERE customer_id NOT IN (SELECT customer_id FROM customers);
