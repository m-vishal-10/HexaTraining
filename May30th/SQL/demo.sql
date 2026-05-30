CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    phone VARCHAR(15)
);



INSERT INTO customers VALUES
(1, 'Rahul Sharma', 'Hyderabad', '9876543210'),
(2, 'Priya Reddy', 'Bangalore', '9876543211'),
(3, 'Amit Kumar', 'Mumbai', NULL),
(4, 'Sneha Patel', 'Chennai', '9876543213'),
(5, 'Arjun Verma', NULL, '9876543214'),
(6, 'Neha Singh', 'Delhi', '9876543215');

CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_amount DECIMAL(10,2),
    order_status VARCHAR(30)
);

INSERT INTO orders VALUES
(101, 1, 'Laptop', 55000, 'Delivered'),
(102, 1, 'Mouse', 700, 'Delivered'),
(103, 2, 'Mobile', 25000, 'Shipped'),
(104, 3, 'Keyboard', NULL, 'Pending'),
(105, 7, 'Printer', 18000, 'Delivered'),
(106, NULL, 'Office Chair', 7500, 'Pending'),
(107, 4, NULL, 12000, 'Cancelled'),
(108, 8, 'Monitor', 1500, NULL);

--join exercises
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.product_name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT
    c.customer_name,
    o.product_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT
    c.customer_name,
    o.product_name
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

--subquery exercises

--  Find customers who placed orders
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);

--  Find customers who never placed orders

SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
    WHERE customer_id IS NOT NULL
);

--  Find orders with amount greater than average order amount

SELECT *
FROM orders
WHERE order_amount > (
    SELECT AVG(order_amount)
    FROM orders
);

--  Find customer who placed the highest order

SELECT *
FROM customers
WHERE customer_id = (
    SELECT customer_id
    FROM orders
    WHERE order_amount = (
        SELECT MAX(order_amount)
        FROM orders
    )
);



--  Find orders where customer does not exist in customers table

SELECT *
FROM orders
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM customers
)
OR customer_id IS NULL;


