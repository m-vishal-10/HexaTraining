CREATE TABLE books 
( 
    book_id INT PRIMARY KEY, 
    book_title VARCHAR(100), 
    category VARCHAR(50),
    author VARCHAR(50), 
    price DECIMAL(10,2), 
    stock INT, 
    published_year INT 
); 
INSERT INTO books VALUES 
(1, 'Python Basics', 'Programming', 'Ravi Kumar', 550, 30, 2021), 
(2, 'Advanced SQL', 'Database', 'Priya Sharma', 750, 15, 2020), 
(3, 'Data Engineering Guide', 'Data', 'Amit Verma', 1200, 10, 2023), 
(4, 'Machine Learning Start', 'AI', 'Neha Reddy', 950, 8, 2022), 
(5, 'Excel for Business', 'Business', 'Kiran Rao', 400, 50, 2019), 
(6, 'Power BI Reports', 'Data', 'Sneha Patel', 850, 12, 2021), 
(7, 'Java Fundamentals', 'Programming', 'Arjun Mehta', 600, 20, 2018), 
(8, 'Cloud Basics', 'Cloud', 'Rahul Nair', 700, 18, 2022), 
(9, 'SQL Interview Prep', 'Database', 'Farhan Ali', 500, 25, 2024), 
(10, 'AI for Beginners', 'AI', 'Meera Singh', 650, 5, 2023); 


-- Exercise 1

SELECT * FROM books;

-- Exercise 2

SELECT book_title, category, price
FROM books;

-- Exercise 3

SELECT DISTINCT category
FROM books;

-- Exercise 4

SELECT *
FROM books
WHERE category = 'Programming';

-- Exercise 5

SELECT *
FROM books
WHERE price > 700;

-- Exercise 6

SELECT *
FROM books
WHERE stock < 15;

-- Exercise 7

SELECT *
FROM books
WHERE category IN ('Programming', 'Database', 'AI');

-- Exercise 8

SELECT *
FROM books
WHERE price BETWEEN 500 AND 900;

-- Exercise 9

SELECT *
FROM books
WHERE book_title LIKE '%SQL%';

-- Exercise 10

SELECT *
FROM books
WHERE book_title LIKE 'Data%';

-- Exercise 11

SELECT *
FROM books
ORDER BY price DESC;

-- Exercise 12

SELECT *
FROM books
ORDER BY category ASC, price DESC;

--
-- Aggregate Functions, GROUP BY, HAVING

-- Exercise 13

SELECT COUNT(*) AS total_books
FROM books;

-- Exercise 14

SELECT MAX(price) AS highest_price
FROM books;

-- Exercise 15

SELECT MIN(price) AS lowest_price
FROM books;

-- Exercise 16

SELECT AVG(price) AS average_price
FROM books;

-- Exercise 17

SELECT SUM(stock) AS total_stock
FROM books;

-- Exercise 18

SELECT category, COUNT(*) AS book_count
FROM books
GROUP BY category;

-- Exercise 19

SELECT category, AVG(price) AS average_price
FROM books
GROUP BY category;

-- Exercise 20

SELECT category, SUM(stock) AS total_stock
FROM books
GROUP BY category;

-- Exercise 21

SELECT category, COUNT(*) AS book_count
FROM books
GROUP BY category
HAVING COUNT(*) > 1;

-- Exercise 22

SELECT category, AVG(price) AS average_price
FROM books
GROUP BY category
HAVING AVG(price) > 700;

--
-- JOINs and NULL Handling

-- Exercise 23

SELECT e.employee_name,
       e.salary,
       d.department_name,
       d.location
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- Exercise 24

SELECT e.employee_name,
       e.salary,
       d.department_name,
       d.location
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- Exercise 25

SELECT e.employee_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- Exercise 26

SELECT d.department_name,
       e.employee_name,
       e.salary
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

-- Exercise 27

SELECT d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

-- Exercise 28

SELECT *
FROM employees
WHERE salary IS NULL;

-- Exercise 29

SELECT *
FROM employees
WHERE city IS NULL;

-- Exercise 30

SELECT *
FROM departments
WHERE location IS NULL;

-- Exercise 31

SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Exercise 32

SELECT d.department_name,
       AVG(e.salary) AS average_salary
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Exercise 33

SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 2;

-- Exercise 34

SELECT d.department_name,
       MAX(e.salary) AS highest_salary
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

--
-- Subqueries

-- Exercise 35

SELECT *
FROM customers_new
WHERE customer_id IN (
    SELECT customer_id
    FROM payments
    WHERE customer_id IS NOT NULL
);

-- Exercise 36

SELECT *
FROM customers_new
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM payments
    WHERE customer_id IS NOT NULL
);

-- Exercise 37

SELECT *
FROM payments
WHERE amount > (
    SELECT AVG(amount)
    FROM payments
    WHERE amount IS NOT NULL
);

-- Exercise 38

SELECT *
FROM customers_new
WHERE customer_id = (
    SELECT customer_id
    FROM payments
    WHERE amount = (
        SELECT MAX(amount)
        FROM payments
    )
);

-- Exercise 39

SELECT *
FROM customers_new
WHERE membership_type = 'Gold'
AND customer_id IN (
    SELECT customer_id
    FROM payments
    WHERE customer_id IS NOT NULL
);

-- Exercise 40

SELECT customer_id,
       SUM(amount) AS total_payment
FROM payments
WHERE amount IS NOT NULL
GROUP BY customer_id
HAVING SUM(amount) > 10000;

-- Exercise 41

SELECT *
FROM payments
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM customers_new
)
OR customer_id IS NULL;

-- Exercise 42

SELECT *
FROM customers_new c
WHERE EXISTS (
    SELECT 1
    FROM payments p
    WHERE c.customer_id = p.customer_id
);

-- Exercise 43

SELECT *
FROM customers_new c
WHERE NOT EXISTS (
    SELECT 1
    FROM payments p
    WHERE c.customer_id = p.customer_id
);

-- Exercise 44

SELECT *
FROM payments
WHERE amount > ALL (
    SELECT amount
    FROM payments
    WHERE customer_id = 2
    AND amount IS NOT NULL
);
