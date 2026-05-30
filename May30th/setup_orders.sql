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
