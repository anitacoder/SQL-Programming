CREATE DATABASE IF NOT EXISTS insurance_database;
USE insurance_database;


CREATE TABLE IF NOT EXISTS insurance_policies (
    policyid INT PRIMARY KEY AUTO_INCREMENT,
    insurancename VARCHAR(255),
    coveragedetails TEXT
);

INSERT INTO insurance_policies (insurancename, coveragedetails)
VALUES
    ('Health Insurance A', 'Medical, Dental, Vision coverage'),
    ('Life Insurance B', 'Coverage for life events'),
    ('Auto Insurance C', 'Coverage for vehicle damage and liability');

SELECT * FROM insurance_policies;
