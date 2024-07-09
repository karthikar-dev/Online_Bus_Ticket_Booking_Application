-- Create obmsdb database
CREATE SCHEMA obmsdb;

-- Use obmsdb
SET SCHEMA obmsdb;

-- Schema creation for 'booking' table
CREATE TABLE booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT NOT NULL,
    passenger_name VARCHAR(100) NOT NULL,
    bus_id INT NOT NULL,
    bus_name VARCHAR(100) NOT NULL,
    seat_qty INT NOT NULL,
    booked_price INT NOT NULL,
    amount INT NOT NULL,
    booked_time DATETIME NOT NULL
);

-- Schema creation for 'bus' table
CREATE TABLE bus (
    bus_id INT PRIMARY KEY AUTO_INCREMENT,
    bus_name VARCHAR(100) NOT NULL,
    from_loc VARCHAR(100) NOT NULL,
    to_loc VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    route VARCHAR(255) NOT NULL,
    total_seats INT NOT NULL,
    available_seats INT NOT NULL,
    price INT NOT NULL
);

-- Schema creation for 'passenger' table
CREATE TABLE passenger (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mobile_no VARCHAR(10) NOT NULL,
    login_password VARCHAR(100) NOT NULL
);

-- Data insertion for 'bus' table
INSERT INTO bus (bus_name, from_loc, to_loc, start_date, end_date, start_time, end_time, route, total_seats, available_seats, price) VALUES
('Fast Wheels', 'Thanjavur', 'Madurai', '2024-10-21', '2024-10-21', '12:28:00', '15:22:00', 'Thanjavur-Madurai', 49, 8, 691),
('Speedster Travels', 'Ranipet', 'Thanjavur', '2024-07-15', '2024-07-16', '18:09:00', '15:27:00', 'Ranipet-Thanjavur', 43, 36, 545),
('Speedster Travels', 'Dindigul', 'Virudhunagar', '2024-12-04', '2024-12-05', '11:07:00', '18:17:00', 'Dindigul-Virudhunagar', 45, 3, 1139),
('Express Bus', 'Kanchipuram', 'Erode', '2024-07-13', '2024-07-13', '04:55:00', '09:38:00', 'Kanchipuram-Erode', 36, 11, 1196),
('Fast Wheels', 'Ranipet', 'Tiruppur', '2024-12-14', '2024-12-14', '03:45:00', '21:53:00', 'Ranipet-Tiruppur', 45, 34, 666),
('Fast Wheels', 'Sivaganga', 'Ranipet', '2024-09-09', '2024-09-09', '23:44:00', '02:13:00', 'Sivaganga-Ranipet', 38, 1, 1492),
('Express Bus', 'Vellore', 'Kanchipuram', '2024-06-26', '2024-06-26', '16:22:00', '09:50:00', 'Vellore-Kanchipuram', 43, 8, 776),
('ABC Travels', 'Madurai', 'Erode', '2024-09-18', '2024-09-19', '11:44:00', '21:53:00', 'Madurai-Erode', 50, 33, 530),
('TN Travels', 'Dharmapuri', 'Tiruppur', '2024-11-17', '2024-11-17', '21:15:00', '18:22:00', 'Dharmapuri-Tiruppur', 46, 30, 918),
('Express Bus', 'Ranipet', 'Nilgiris', '2024-07-12', '2024-07-12', '16:54:00', '21:34:00', 'Ranipet-Nilgiris', 39, 9, 1415),
('Fast Wheels', 'Thoothukudi', 'Chennai', '2024-11-23', '2024-11-23', '01:57:00', '16:18:00', 'Thoothukudi-Chennai', 31, 5, 1090),
('Speedster Travels', 'Tirunelveli', 'Madurai', '2024-10-16', '2024-10-16', '05:34:00', '11:22:00', 'Tirunelveli-Madurai', 32, 27, 1045),
('TN Travels', 'Dharmapuri', 'Madurai', '2024-12-18', '2024-12-18', '11:21:00', '01:17:00', 'Dharmapuri-Madurai', 44, 30, 973),
('Fast Wheels', 'Namakkal', 'Kanchipuram', '2024-12-27', '2024-12-27', '02:18:00', '11:16:00', 'Namakkal-Kanchipuram', 50, 18, 1404),
('Speedster Travels', 'Vellore', 'Virudhunagar', '2024-08-12', '2024-08-12', '16:20:00', '12:08:00', 'Vellore-Virudhunagar', 43, 19, 1296),
('ABC Travels', 'Tirunelveli', 'Kanchipuram', '2024-12-16', '2024-12-16', '12:16:00', '15:30:00', 'Tirunelveli-Kanchipuram', 31, 16, 797),
('Fast Wheels', 'Vellore', 'Thoothukudi', '2024-12-24', '2024-12-24', '16:36:00', '22:09:00', 'Vellore-Thoothukudi', 47, 1, 1026),
('Express Bus', 'Namakkal', 'Thoothukudi', '2024-10-20', '2024-10-20', '20:41:00', '20:41:00', 'Namakkal-Thoothukudi', 32, 7, 949),
('Speedster Travels', 'Thoothukudi', 'Sivaganga', '2024-08-28', '2024-08-28', '09:48:00', '18:24:00', 'Thoothukudi-Sivaganga', 47, 5, 710),
('Speedster Travels', 'Tirunelveli', 'Dharmapuri', '2024-09-17', '2024-09-17', '09:27:00', '11:22:00', 'Tirunelveli-Dharmapuri', 37, 0, 1404);

-- Data insertion for 'passenger' table
INSERT INTO passenger (passenger_name, email, mobile_no, login_password) VALUES
('Karthika Rajaram', 'karthika.rajaram@gmail.com', '9123456789', 'password123'),
('Priya Singh', 'priya.singh@gmail.com', '9234567890', 'password123'),
('Amit Kumar', 'amit.kumar@gmail.com', '9345678901', 'password123'),
('Sneha Reddy', 'sneha.reddy@gmail.com', '9456789012', 'password123'),
('Vikas Gupta', 'vikas.gupta@gmail.com', '9567890123', 'password123');

-- Data insertion for 'booking' table
INSERT INTO booking (passenger_id, passenger_name, bus_id, bus_name, seat_qty, booked_price, amount, booked_time) VALUES
(1, 'Karthika Rajaram', 1, 'Fast Wheels', 2, 691, 1382, '2024-07-01 10:30:00'),
(2, 'Priya Singh', 2, 'Speedster Travels', 1, 545, 545, '2024-07-02 14:00:00'),
(3, 'Amit Kumar', 3, 'Speedster Travels', 3, 1139, 3417, '2024-07-03 08:45:00'),
(4, 'Sneha Reddy', 4, 'Express Bus', 4, 1196, 4784, '2024-07-04 12:20:00'),
(5, 'Vikas Gupta', 5, 'Fast Wheels', 1, 666, 666, '2024-07-05 09:10:00'),
(1, 'Karthika Rajaram', 6, 'Express Bus', 2, 776, 1552, '2024-07-06 11:00:00'),
(2, 'Priya Singh', 7, 'ABC Travels', 1, 530, 530, '2024-07-07 15:30:00'),
(3, 'Amit Kumar', 8, 'TN Travels', 3, 918, 2754, '2024-07-08 07:00:00'),
(4, 'Sneha Reddy', 9, 'Express Bus', 4, 1415, 5660, '2024-07-09 10:45:00'),
(5, 'Vikas Gupta', 10, 'Fast Wheels', 1, 1090, 1090, '2024-07-10 13:20:00'),
(1, 'Karthika Rajaram', 11, 'Speedster Travels', 2, 1045, 2090, '2024-07-11 16:55:00'),
(2, 'Priya Singh', 12, 'TN Travels', 1, 973, 973, '2024-07-12 19:30:00'),
(3, 'Amit Kumar', 13, 'Fast Wheels', 3, 1404, 4212, '2024-07-13 22:00:00'),
(4, 'Sneha Reddy', 14, 'Speedster Travels', 4, 1296, 5184, '2024-07-14 10:15:00'),
(5, 'Vikas Gupta', 15, 'ABC Travels', 1, 797, 797, '2024-07-15 13:45:00'),
(1, 'Karthika Rajaram', 16, 'Fast Wheels', 2, 1026, 2052, '2024-07-16 17:20:00'),
(2, 'Priya Singh', 17, 'Express Bus', 1, 949, 949, '2024-07-17 08:30:00'),
(3, 'Amit Kumar', 18, 'Speedster Travels', 3, 710, 2130, '2024-07-18 11:45:00'),
(4, 'Sneha Reddy', 19, 'Speedster Travels', 4, 1404, 5616, '2024-07-19 14:10:00'),
(5, 'Vikas Gupta', 20, 'Fast Wheels', 1, 666, 666, '2024-07-20 16:35:00');
