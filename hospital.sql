CREATE DATABASE IF NOT EXISTS medical_facilities_database;
USE medical_facilities_database;

CREATE TABLE IF NOT EXISTS medical_facilities (
    facilityid INT PRIMARY KEY AUTO_INCREMENT,
    specialities TEXT,
    phone_number VARCHAR(15)
);

INSERT INTO medical_facilities (specialities, phone_number)
VALUES
    ('Cardiology, Orthopedics', '+1234567890'),
    ('Pediatrics, Dermatology', '+9876543210'),
    ('Internal Medicine, Radiology', '+1122334455');

SELECT * FROM medical_facilities;
