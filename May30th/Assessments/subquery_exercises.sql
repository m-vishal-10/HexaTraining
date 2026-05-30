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


