CREATE DATABASE IF NOT EXISTS expense_tracker;
USE expense_tracker;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_on DATE NOT NULL
);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    expense_date DATE NOT NULL,
    description VARCHAR(255),
    payment_method VARCHAR(30),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO users (user_name, email, created_on) VALUES
('Arjun Mehta', 'arjun.mehta@email.com', '2025-01-15'),
('Priya Nair', 'priya.nair@email.com', '2025-02-10'),
('Karthik Iyer', 'karthik.iyer@email.com', '2025-01-22'),
('Sneha Reddy', 'sneha.reddy@email.com', '2025-03-05'),
('Rohan Verma', 'rohan.verma@email.com', '2025-02-28');

INSERT INTO categories (category_name) VALUES
('Groceries'),
('Utilities'),
('Transportation'),
('Entertainment'),
('Dining Out'),
('Healthcare'),
('Shopping');

INSERT INTO expenses (user_id, category_id, amount, expense_date, description, payment_method) VALUES
(1, 1, 2450.00, '2026-06-01', 'Weekly grocery run', 'Card'),
(1, 3, 380.50, '2026-06-02', 'Cab to office', 'UPI'),
(1, 5, 950.00, '2026-06-03', 'Dinner with friends', 'Card'),
(1, 2, 1800.00, '2026-06-05', 'Electricity bill', 'Net Banking'),
(1, 1, 1200.00, '2026-06-08', 'Vegetables and fruits', 'Cash'),
(1, 4, 600.00, '2026-06-10', 'Movie tickets', 'UPI'),
(1, 7, 3200.00, '2026-06-12', 'New shoes', 'Card'),
(1, 6, 850.00, '2026-06-14', 'Pharmacy purchase', 'UPI'),
(1, 1, 2100.00, '2026-06-16', 'Monthly grocery stock', 'Card'),
(1, 3, 420.00, '2026-06-18', 'Auto rides', 'Cash'),
(2, 1, 1950.00, '2026-06-01', 'Grocery shopping', 'UPI'),
(2, 2, 1600.00, '2026-06-04', 'Water and gas bill', 'Net Banking'),
(2, 5, 1100.00, '2026-06-06', 'Weekend brunch', 'Card'),
(2, 4, 750.00, '2026-06-09', 'Concert tickets', 'Card'),
(2, 7, 2800.00, '2026-06-11', 'Clothing', 'UPI'),
(2, 1, 1750.00, '2026-06-15', 'Grocery top-up', 'Cash'),
(2, 6, 1200.00, '2026-06-17', 'Doctor consultation', 'Card'),
(2, 3, 500.00, '2026-06-19', 'Fuel', 'UPI'),
(3, 1, 2300.00, '2026-06-02', 'Monthly groceries', 'Card'),
(3, 2, 2100.00, '2026-06-03', 'Internet and electricity', 'Net Banking'),
(3, 3, 650.00, '2026-06-05', 'Metro card recharge', 'UPI'),
(3, 5, 1350.00, '2026-06-07', 'Family dinner', 'Card'),
(3, 7, 4200.00, '2026-06-10', 'Electronics accessory', 'Card'),
(3, 4, 480.00, '2026-06-13', 'Streaming subscription', 'UPI'),
(3, 1, 1600.00, '2026-06-16', 'Grocery run', 'Cash'),
(3, 6, 920.00, '2026-06-18', 'Medicines', 'UPI'),
(4, 1, 2050.00, '2026-06-01', 'Groceries', 'Card'),
(4, 3, 300.00, '2026-06-03', 'Bus pass', 'Cash'),
(4, 5, 1450.00, '2026-06-06', 'Dinner outing', 'Card'),
(4, 2, 1750.00, '2026-06-08', 'Electricity bill', 'Net Banking'),
(4, 7, 3600.00, '2026-06-12', 'Festive shopping', 'UPI'),
(4, 4, 550.00, '2026-06-14', 'Gaming subscription', 'Card'),
(4, 1, 1900.00, '2026-06-17', 'Grocery restock', 'UPI'),
(4, 6, 700.00, '2026-06-19', 'Health checkup', 'Card'),
(5, 1, 2200.00, '2026-06-02', 'Weekly groceries', 'UPI'),
(5, 2, 1550.00, '2026-06-04', 'Utility bills', 'Net Banking'),
(5, 3, 410.00, '2026-06-07', 'Ride sharing', 'UPI'),
(5, 5, 1050.00, '2026-06-09', 'Lunch with colleagues', 'Card'),
(5, 7, 2950.00, '2026-06-13', 'New gadget', 'Card'),
(5, 4, 620.00, '2026-06-15', 'Theatre show', 'Cash'),
(5, 1, 1850.00, '2026-06-18', 'Grocery shopping', 'Card');

INSERT INTO expenses (user_id, category_id, amount, expense_date, description, payment_method)
VALUES (1, 5, 1100.00, '2026-06-20', 'Birthday dinner', 'Card');

UPDATE expenses
SET amount = 2600.00, description = 'Weekly grocery run, corrected'
WHERE expense_id = 1;

UPDATE expenses
SET payment_method = 'UPI'
WHERE expense_id = 12;

SELECT expense_id, amount, expense_date, description, payment_method
FROM expenses
WHERE user_id = 1
ORDER BY expense_date;

SELECT e.expense_id, u.user_name, c.category_name, e.amount, e.expense_date
FROM expenses e
JOIN users u ON e.user_id = u.user_id
JOIN categories c ON e.category_id = c.category_id
WHERE c.category_name = 'Shopping';

DELETE FROM expenses
WHERE expense_id = 41;

DELIMITER $$

CREATE PROCEDURE GetMonthlyExpenseByCategory(
    IN p_user_id INT,
    IN p_month INT,
    IN p_year INT
)
BEGIN
    SELECT
        c.category_name,
        SUM(e.amount) AS total_amount
    FROM expenses e
    JOIN categories c ON e.category_id = c.category_id
    WHERE e.user_id = p_user_id
      AND MONTH(e.expense_date) = p_month
      AND YEAR(e.expense_date) = p_year
    GROUP BY c.category_name
    ORDER BY total_amount DESC;
END$$

DELIMITER ;

CALL GetMonthlyExpenseByCategory(1, 6, 2026);
CALL GetMonthlyExpenseByCategory(3, 6, 2026);
