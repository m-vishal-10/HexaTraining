-- CREATE DATABASE IF NOT EXISTS hospital_capstone_db;
-- USE hospital_capstone_db;

-- patients table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    phone VARCHAR(15)
);

-- departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- doctors table
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    department_id INT,
    consultation_fee DECIMAL(10,2),

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

-- appointments table
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_status VARCHAR(30),

    FOREIGN KEY (patient_id)
    REFERENCES patients(patient_id),

    FOREIGN KEY (doctor_id)
    REFERENCES doctors(doctor_id)
);

-- treatments table
CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY,
    appointment_id INT,
    treatment_name VARCHAR(100),
    treatment_cost DECIMAL(10,2),

    FOREIGN KEY (appointment_id)
    REFERENCES appointments(appointment_id)
);

-- bills table
CREATE TABLE bills (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    appointment_id INT,
    bill_date DATE,
    total_amount DECIMAL(10,2),
    bill_status VARCHAR(30),

    FOREIGN KEY (patient_id)
    REFERENCES patients(patient_id),

    FOREIGN KEY (appointment_id)
    REFERENCES appointments(appointment_id)
);

-- payments table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    bill_id INT,
    payment_mode VARCHAR(30),
    paid_amount DECIMAL(10,2),
    payment_status VARCHAR(30),

    FOREIGN KEY (bill_id)
    REFERENCES bills(bill_id)
);


INSERT INTO departments VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'General Medicine'),
(5, 'Dermatology');


INSERT INTO patients VALUES
(1, 'Aarav Sharma', 'Male', 45, 'Hyderabad', '9876543210'),
(2, 'Priya Nair', 'Female', 32, 'Chennai', '9823456781'),
(3, 'Rohan Mehta', 'Male', 58, 'Mumbai', '9734562890'),
(4, 'Sneha Reddy', 'Female', 27, 'Hyderabad', '9645673901'),
(5, 'Karan Patel', 'Male', 41, 'Ahmedabad', '9556784012'),
(6, 'Divya Iyer', 'Female', 36, 'Chennai', '9467895123'),
(7, 'Amit Verma', 'Male', 62, 'Delhi', '9378906234'),
(8, 'Pooja Singh', 'Female', 29, 'Mumbai', '9289017345'),
(9, 'Rahul Gupta', 'Male', 50, 'Hyderabad', '9190128456'),
(10, 'Anjali Desai', 'Female', 44, 'Ahmedabad', '9001239567'),
(11, 'Vikram Nair', 'Male', 33, 'Delhi', '8912340678'),
(12, 'Meera Pillai', 'Female', 55, 'Chennai', '8823451789');


INSERT INTO doctors VALUES
(1, 'Dr. Suresh Kumar', 'Cardiologist', 1, 1200.00),
(2, 'Dr. Anitha Rao', 'Neurologist', 2, 1500.00),
(3, 'Dr. Prakash Menon', 'Orthopedic Surgeon', 3, 900.00),
(4, 'Dr. Kavya Reddy', 'General Physician', 4, 600.00),
(5, 'Dr. Ramesh Iyer', 'Dermatologist', 5, 750.00),
(6, 'Dr. Leela Sharma', 'Cardiologist', 1, 1100.00),
(7, 'Dr. Arjun Pillai', 'Neurologist', 2, 1400.00),
(8, 'Dr. Nisha Verma', 'General Physician', 4, 650.00);


INSERT INTO appointments VALUES
(101, 1, 1, '2026-01-05', 'Completed'),
(102, 2, 3, '2026-01-08', 'Completed'),
(103, 3, 2, '2026-01-12', 'Completed'),
(104, 4, 4, '2026-01-15', 'Cancelled'),
(105, 5, 5, '2026-01-18', 'Completed'),
(106, 6, 1, '2026-01-22', 'Completed'),
(107, 7, 6, '2026-01-25', 'Completed'),
(108, 8, 3, '2026-02-01', 'Cancelled'),
(109, 9, 2, '2026-02-04', 'Completed'),
(110, 10, 7, '2026-02-07', 'Completed'),
(111, 11, 4, '2026-02-10', 'Completed'),
(112, 12, 5, '2026-02-14', 'Completed'),
(113, 1, 6, '2026-02-18', 'Completed'),
(114, 3, 1, '2026-02-22', 'Completed'),
(115, 5, 8, '2026-02-25', 'Cancelled'),
(116, 2, 7, '2026-03-01', 'Completed'),
(117, 6, 3, '2026-03-05', 'Completed'),
(118, 9, 4, '2026-03-08', 'Completed'),
(119, 11, 2, '2026-03-12', 'Completed'),
(120, 12, 6, '2026-03-15', 'Completed');


INSERT INTO treatments VALUES
(201, 101, 'ECG', 800.00),
(202, 102, 'X-Ray', 600.00),
(203, 103, 'MRI Scan', 4500.00),
(204, 105, 'Skin Biopsy', 1200.00),
(205, 106, 'Echo Cardiogram', 2500.00),
(206, 107, 'Stress Test', 1800.00),
(207, 109, 'CT Scan', 3500.00),
(208, 110, 'EEG', 2000.00),
(209, 111, 'Blood Test', 400.00),
(210, 112, 'Patch Test', 750.00),
(211, 113, 'Angiography', 6000.00),
(212, 114, 'ECG', 800.00),
(213, 116, 'MRI Scan', 4500.00),
(214, 117, 'Physiotherapy', 1500.00),
(215, 118, 'Blood Glucose', 350.00);


INSERT INTO bills VALUES
(301, 1, 101, '2026-01-05', 2000.00, 'Paid'),
(302, 2, 102, '2026-01-08', 1500.00, 'Paid'),
(303, 3, 103, '2026-01-12', 6000.00, 'Paid'),
(304, 4, 104, '2026-01-15', 600.00, 'Cancelled'),
(305, 5, 105, '2026-01-18', 1950.00, 'Paid'),
(306, 6, 106, '2026-01-22', 3600.00, 'Paid'),
(307, 7, 107, '2026-01-25', 2900.00, 'Paid'),
(308, 9, 109, '2026-02-04', 4950.00, 'Unpaid'),
(309, 10, 110, '2026-02-07', 3400.00, 'Paid'),
(310, 11, 111, '2026-02-10', 1000.00, 'Paid'),
(311, 12, 112, '2026-02-14', 1500.00, 'Paid'),
(312, 1, 113, '2026-02-18', 7100.00, 'Paid'),
(313, 3, 114, '2026-02-22', 1900.00, 'Unpaid'),
(314, 2, 116, '2026-03-01', 5900.00, 'Paid'),
(315, 6, 117, '2026-03-05', 2400.00, 'Paid');


INSERT INTO payments VALUES
(401, 301, 'UPI', 2000.00, 'Success'),
(402, 302, 'Cash', 1500.00, 'Success'),
(403, 303, 'Credit Card', 6000.00, 'Success'),
(404, 304, 'UPI', 0.00, 'Cancelled'),
(405, 305, 'Debit Card', 1950.00, 'Success'),
(406, 306, 'UPI', 3600.00, 'Success'),
(407, 307, 'Net Banking', 2900.00, 'Success'),
(408, 308, 'UPI', 0.00, 'Pending'),
(409, 309, 'Credit Card', 3400.00, 'Success'),
(410, 310, 'Cash', 1000.00, 'Success'),
(411, 311, 'UPI', 1500.00, 'Success'),
(412, 312, 'Debit Card', 7100.00, 'Success'),
(413, 313, 'Net Banking', 0.00, 'Pending'),
(414, 314, 'UPI', 5900.00, 'Success'),
(415, 315, 'Cash', 2000.00, 'Success');

-- BASIC QUERIES

-- Display all patients.
SELECT * FROM patients;

-- Display all doctors.
SELECT * FROM doctors;

-- Find patients from Hyderabad.
SELECT * FROM patients
WHERE city = 'Hyderabad';

-- Find doctors from Cardiology department.
SELECT d.*
FROM doctors d
JOIN departments dp ON d.department_id = dp.department_id
WHERE dp.department_name = 'Cardiology';

-- Find appointments scheduled after 2026-01-01.
SELECT * FROM appointments
WHERE appointment_date > '2026-01-01';

--  Find cancelled appointments.
SELECT * FROM appointments
WHERE appointment_status = 'Cancelled';

-- Find bills where total amount is greater than ₹5,000.
SELECT * FROM bills
WHERE total_amount > 5000;

-- Find payments made using UPI.
SELECT * FROM payments
WHERE payment_mode = 'UPI';

-- Display patients aged between 30 and 50.
SELECT * FROM patients
WHERE age BETWEEN 30 AND 50;

--  Display doctors with consultation fee above ₹800.
SELECT * FROM doctors
WHERE consultation_fee > 800;


-- AGGREGATE QUERIES

--  Count total patients.
SELECT COUNT(*) AS total_patients FROM patients;

-- Count total doctors.
SELECT COUNT(*) AS total_doctors FROM doctors;

--  Count total appointments.
SELECT COUNT(*) AS total_appointments FROM appointments;

--  Find average consultation fee.
SELECT ROUND(AVG(consultation_fee), 2) AS avg_consultation_fee FROM doctors;

--  Find highest treatment cost.
SELECT MAX(treatment_cost) AS highest_treatment_cost FROM treatments;

--  Find total billing amount.
SELECT SUM(total_amount) AS total_billing_amount FROM bills;

--  Find total paid amount.
SELECT SUM(paid_amount) AS total_paid_amount
FROM payments
WHERE payment_status = 'Success';

-- Count patients by city.
SELECT city, COUNT(*) AS patient_count
FROM patients
GROUP BY city
ORDER BY patient_count DESC;

-- Count doctors by specialization.
SELECT specialization, COUNT(*) AS doctor_count
FROM doctors
GROUP BY specialization;

-- Count appointments by status.
SELECT appointment_status, COUNT(*) AS appointment_count
FROM appointments
GROUP BY appointment_status;


-- JOINS

-- Display patient name with appointment date and status.
SELECT p.patient_name, a.appointment_date, a.appointment_status
FROM patients    p
JOIN appointments a ON p.patient_id = a.patient_id;

-- Display doctor name with department name.
SELECT d.doctor_name, dp.department_name
FROM doctors     d
JOIN departments dp ON d.department_id = dp.department_id;

-- Display patient name, doctor name, and appointment date.
SELECT p.patient_name, d.doctor_name, a.appointment_date
FROM appointments a
JOIN patients     p ON a.patient_id = p.patient_id
JOIN doctors      d ON a.doctor_id  = d.doctor_id;

-- Display appointment ID with treatment name and cost.
SELECT a.appointment_id, t.treatment_name, t.treatment_cost
FROM appointments a
JOIN treatments   t ON a.appointment_id = t.appointment_id;

-- Display bill ID with patient name and total amount.
SELECT b.bill_id, p.patient_name, b.total_amount
FROM bills    b
JOIN patients p ON b.patient_id = p.patient_id;

-- Display bill ID with payment mode, paid amount, and payment status.
SELECT b.bill_id, py.payment_mode, py.paid_amount, py.payment_status
FROM bills    b
JOIN payments py ON b.bill_id = py.bill_id;

--  Full appointment report.
SELECT
    p.patient_name,
    d.doctor_name,
    dp.department_name   AS department,
    a.appointment_date,
    a.appointment_status,
    t.treatment_name,
    t.treatment_cost,
    b.total_amount       AS bill_amount,
    py.payment_status
FROM appointments a
JOIN patients      p  ON a.patient_id     = p.patient_id
JOIN doctors       d  ON a.doctor_id      = d.doctor_id
JOIN departments   dp ON d.department_id  = dp.department_id
LEFT JOIN treatments t  ON a.appointment_id = t.appointment_id
LEFT JOIN bills      b  ON a.appointment_id = b.appointment_id
LEFT JOIN payments   py ON b.bill_id        = py.bill_id;


-- GROUP BY AND HAVING 

-- Count appointments by doctor.
SELECT d.doctor_name, COUNT(a.appointment_id) AS appointment_count
FROM doctors      d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name
ORDER BY appointment_count DESC;

--  Count appointments by department.
SELECT dp.department_name, COUNT(a.appointment_id) AS appointment_count
FROM departments  dp
JOIN doctors      d  ON dp.department_id = d.department_id
JOIN appointments a  ON d.doctor_id      = a.doctor_id
GROUP BY dp.department_id, dp.department_name
ORDER BY appointment_count DESC;

--  Total revenue by department.
SELECT dp.department_name, SUM(b.total_amount) AS total_revenue
FROM departments  dp
JOIN doctors      d  ON dp.department_id  = d.department_id
JOIN appointments a  ON d.doctor_id       = a.doctor_id
JOIN bills        b  ON a.appointment_id  = b.appointment_id
WHERE b.bill_status != 'Cancelled'
GROUP BY dp.department_id, dp.department_name
ORDER BY total_revenue DESC;

--  Total treatment cost by treatment name.
SELECT treatment_name, SUM(treatment_cost) AS total_cost
FROM treatments
GROUP BY treatment_name
ORDER BY total_cost DESC;

--  Total billing by city.
SELECT p.city, SUM(b.total_amount) AS total_billing
FROM patients p
JOIN bills    b ON p.patient_id = b.patient_id
WHERE b.bill_status != 'Cancelled'
GROUP BY p.city
ORDER BY total_billing DESC;

-- Doctors having more than 2 appointments.
SELECT d.doctor_name, COUNT(a.appointment_id) AS appointment_count
FROM doctors      d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name
HAVING COUNT(a.appointment_id) > 2;

--  Departments generating revenue greater than ₹20,000.
SELECT dp.department_name, SUM(b.total_amount) AS total_revenue
FROM departments  dp
JOIN doctors      d  ON dp.department_id  = d.department_id
JOIN appointments a  ON d.doctor_id       = a.doctor_id
JOIN bills        b  ON a.appointment_id  = b.appointment_id
WHERE b.bill_status != 'Cancelled'
GROUP BY dp.department_id, dp.department_name
HAVING SUM(b.total_amount) > 20000;

--  Cities having more than 2 patients.
SELECT city, COUNT(*) AS patient_count
FROM patients
GROUP BY city
HAVING COUNT(*) > 2;


-- SUBQUERIES

--  Find patients who have appointments.
SELECT * FROM patients
WHERE patient_id IN (SELECT DISTINCT patient_id FROM appointments);

--  Find patients who never booked appointments.
SELECT * FROM patients
WHERE patient_id NOT IN (SELECT DISTINCT patient_id FROM appointments);

-- Find doctors who have no appointments.
SELECT * FROM doctors
WHERE doctor_id NOT IN (SELECT DISTINCT doctor_id FROM appointments);

--  Find bills greater than average bill amount.
SELECT * FROM bills
WHERE total_amount > (SELECT AVG(total_amount) FROM bills);

-- Find patient with highest bill amount.
SELECT p.*
FROM patients p
JOIN bills    b ON p.patient_id = b.patient_id
WHERE b.total_amount = (SELECT MAX(total_amount) FROM bills);

-- Find doctors whose consultation fee is above average.
SELECT * FROM doctors
WHERE consultation_fee > (SELECT AVG(consultation_fee) FROM doctors);

-- Find patients who visited Cardiology.
SELECT DISTINCT p.*
FROM patients p
WHERE p.patient_id IN (
    SELECT a.patient_id
    FROM appointments a
    JOIN doctors      d  ON a.doctor_id     = d.doctor_id
    JOIN departments  dp ON d.department_id = dp.department_id
    WHERE dp.department_name = 'Cardiology'
);

-- Find unpaid bills.
SELECT * FROM bills
WHERE bill_id IN (
    SELECT bill_id FROM payments
    WHERE payment_status IN ('Pending', 'Cancelled')
)
OR bill_id NOT IN (SELECT bill_id FROM payments);

-- Find appointments that have treatments.
SELECT * FROM appointments
WHERE appointment_id IN (SELECT DISTINCT appointment_id FROM treatments);

-- Find patients whose total bill is above average patient billing.
SELECT p.patient_name, SUM(b.total_amount) AS total_billed
FROM patients p
JOIN bills    b ON p.patient_id = b.patient_id
WHERE b.bill_status != 'Cancelled'
GROUP BY p.patient_id, p.patient_name
HAVING SUM(b.total_amount) > (
    SELECT AVG(patient_total)
    FROM (
        SELECT p2.patient_id, SUM(b2.total_amount) AS patient_total
        FROM patients p2
        JOIN bills    b2 ON p2.patient_id = b2.patient_id
        WHERE b2.bill_status != 'Cancelled'
        GROUP BY p2.patient_id
    ) AS billing_summary
);


--  DATA QUALITY CHECKS

--Find appointments without treatment.
SELECT * FROM appointments
WHERE appointment_id NOT IN (SELECT DISTINCT appointment_id FROM treatments);

-- Find bills without payment.
SELECT * FROM bills
WHERE bill_id NOT IN (SELECT DISTINCT bill_id FROM payments);

--  Find payments with NULL or zero paid amount.
SELECT * FROM payments
WHERE paid_amount IS NULL OR paid_amount = 0;

--Find cancelled appointments that still have bills.
SELECT a.appointment_id, a.appointment_status, b.bill_id, b.total_amount
FROM appointments a
JOIN bills        b ON a.appointment_id = b.appointment_id
WHERE a.appointment_status = 'Cancelled';

-- Find paid bills where payment amount is less than bill amount.
SELECT b.bill_id, b.total_amount, py.paid_amount,
       (b.total_amount - py.paid_amount) AS pending_amount
FROM bills    b
JOIN payments py ON b.bill_id = py.bill_id
WHERE b.bill_status = 'Paid'
  AND py.paid_amount < b.total_amount;

-- Find doctors with invalid department ID (no matching department).
SELECT * FROM doctors
WHERE department_id NOT IN (SELECT department_id FROM departments);

-- Find appointments with invalid patient or doctor IDs.
SELECT * FROM appointments
WHERE patient_id NOT IN (SELECT patient_id FROM patients)
   OR doctor_id  NOT IN (SELECT doctor_id  FROM doctors);


-- Patient Billing Report

SELECT
    p.patient_name,
    p.city,
    COUNT(DISTINCT a.appointment_id)          AS total_appointments,
    COALESCE(SUM(b.total_amount), 0)          AS total_bill_amount,
    COALESCE(SUM(py.paid_amount), 0)          AS total_paid_amount,
    COALESCE(SUM(b.total_amount), 0)
        - COALESCE(SUM(py.paid_amount), 0)    AS pending_amount
FROM patients    p
LEFT JOIN appointments a  ON p.patient_id     = a.patient_id
LEFT JOIN bills        b  ON a.appointment_id = b.appointment_id
                          AND b.bill_status   != 'Cancelled'
LEFT JOIN payments     py ON b.bill_id        = py.bill_id
                          AND py.payment_status = 'Success'
GROUP BY p.patient_id, p.patient_name, p.city
ORDER BY total_bill_amount DESC;
