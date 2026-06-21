-- CREATE DATABASE IF NOT EXISTS smart_home_energy;
-- USE smart_home_energy;

CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_name VARCHAR(50) NOT NULL,
    floor_number INT NOT NULL
);

CREATE TABLE devices (
    device_id INT AUTO_INCREMENT PRIMARY KEY,
    device_name VARCHAR(100) NOT NULL,
    device_type VARCHAR(50) NOT NULL,
    room_id INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Active',
    installed_on DATE,
    power_rating_watts DECIMAL(8,2),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE energy_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    device_id INT NOT NULL,
    room_id INT NOT NULL,
    log_timestamp DATETIME NOT NULL,
    power_watts DECIMAL(8,2),
    energy_kwh DECIMAL(10,4),
    FOREIGN KEY (device_id) REFERENCES devices(device_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

INSERT INTO rooms (room_name, floor_number) VALUES
('Living Room', 1),
('Kitchen', 1),
('Master Bedroom', 2),
('Bedroom 2', 2),
('Study', 1);

INSERT INTO devices (device_name, device_type, room_id, status, installed_on, power_rating_watts) VALUES
('Smart TV', 'Entertainment', 1, 'Active', '2025-03-10', 150.00),
('Air Conditioner', 'Cooling', 1, 'Active', '2025-03-10', 1500.00),
('Refrigerator', 'Appliance', 2, 'Active', '2024-11-05', 200.00),
('Microwave Oven', 'Appliance', 2, 'Active', '2024-11-05', 1100.00),
('Ceiling Fan', 'Cooling', 3, 'Active', '2025-01-20', 75.00),
('Air Conditioner', 'Cooling', 3, 'Active', '2025-01-20', 1400.00),
('Table Lamp', 'Lighting', 4, 'Active', '2024-08-15', 40.00),
('Air Purifier', 'Appliance', 4, 'Standby', '2025-05-01', 50.00),
('Desktop Computer', 'Electronics', 5, 'Active', '2024-12-01', 250.00),
('Printer', 'Electronics', 5, 'Inactive', '2024-12-01', 30.00);

INSERT INTO energy_logs (device_id, room_id, log_timestamp, power_watts, energy_kwh) VALUES
(1, 1, '2026-06-18 08:00:00', 145.50, 0.29),
(1, 1, '2026-06-18 20:00:00', 148.20, 0.30),
(2, 1, '2026-06-18 09:00:00', 1480.00, 1.48),
(2, 1, '2026-06-18 21:00:00', 1495.50, 1.50),
(3, 2, '2026-06-18 06:00:00', 195.00, 0.39),
(3, 2, '2026-06-18 18:00:00', 198.40, 0.40),
(4, 2, '2026-06-18 12:30:00', 1080.00, 0.36),
(4, 2, '2026-06-18 19:30:00', 1095.00, 0.37),
(5, 3, '2026-06-18 07:00:00', 72.00, 0.14),
(5, 3, '2026-06-18 22:00:00', 74.50, 0.15),
(6, 3, '2026-06-18 23:00:00', 1390.00, 1.39),
(6, 3, '2026-06-18 05:30:00', 1378.00, 1.38),
(7, 4, '2026-06-18 19:00:00', 38.50, 0.08),
(7, 4, '2026-06-18 22:30:00', 39.00, 0.08),
(8, 4, '2026-06-18 10:00:00', 48.00, 0.10),
(8, 4, '2026-06-18 15:00:00', 47.50, 0.10),
(9, 5, '2026-06-18 09:30:00', 240.00, 0.48),
(9, 5, '2026-06-18 17:00:00', 245.50, 0.49),
(10, 5, '2026-06-18 11:00:00', 28.00, 0.03),
(10, 5, '2026-06-18 14:00:00', 27.50, 0.03),
(1, 1, '2026-06-19 08:15:00', 146.00, 0.29),
(1, 1, '2026-06-19 21:00:00', 149.00, 0.30),
(2, 1, '2026-06-19 09:15:00', 1502.00, 1.50),
(2, 1, '2026-06-19 22:00:00', 1488.00, 1.49),
(3, 2, '2026-06-19 06:15:00', 197.00, 0.39),
(3, 2, '2026-06-19 18:15:00', 199.00, 0.40),
(4, 2, '2026-06-19 13:00:00', 1090.00, 0.36),
(4, 2, '2026-06-19 19:45:00', 1102.00, 0.37),
(5, 3, '2026-06-19 07:15:00', 73.00, 0.15),
(5, 3, '2026-06-19 22:15:00', 75.00, 0.15),
(6, 3, '2026-06-19 23:15:00', 1402.00, 1.40),
(6, 3, '2026-06-19 05:45:00', 1385.00, 1.39),
(7, 4, '2026-06-19 19:15:00', 39.50, 0.08),
(7, 4, '2026-06-19 22:45:00', 40.00, 0.08),
(8, 4, '2026-06-19 10:15:00', 49.00, 0.10),
(8, 4, '2026-06-19 15:15:00', 48.50, 0.10),
(9, 5, '2026-06-19 09:45:00', 248.00, 0.50),
(9, 5, '2026-06-19 17:15:00', 246.00, 0.49),
(10, 5, '2026-06-19 11:15:00', 29.00, 0.03),
(10, 5, '2026-06-19 14:15:00', 28.50, 0.03);

INSERT INTO devices (device_name, device_type, room_id, status, installed_on, power_rating_watts)
VALUES ('Water Heater', 'Appliance', 2, 'Active', '2026-06-20', 2000.00);

UPDATE devices
SET status = 'Inactive'
WHERE device_id = 8;

UPDATE energy_logs
SET energy_kwh = 1.52, power_watts = 1520.00
WHERE log_id = 4;

SELECT device_id, device_name, device_type, status, power_rating_watts
FROM devices
WHERE room_id = 1;

SELECT el.log_id, d.device_name, el.log_timestamp, el.power_watts, el.energy_kwh
FROM energy_logs el
JOIN devices d ON el.device_id = d.device_id
WHERE el.device_id = 2
ORDER BY el.log_timestamp;

DELETE FROM energy_logs
WHERE log_id = 20;

DELIMITER $$

CREATE PROCEDURE GetRoomEnergyPerDay(
    IN p_room_id INT,
    IN p_log_date DATE
)
BEGIN
    SELECT
        r.room_name,
        p_log_date AS log_date,
        SUM(el.energy_kwh) AS total_energy_kwh
    FROM energy_logs el
    JOIN rooms r ON el.room_id = r.room_id
    WHERE el.room_id = p_room_id
      AND DATE(el.log_timestamp) = p_log_date
    GROUP BY r.room_name;
END$$

DELIMITER ;

CALL GetRoomEnergyPerDay(1, '2026-06-18');
CALL GetRoomEnergyPerDay(3, '2026-06-19');
