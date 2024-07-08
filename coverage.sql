CREATE DATABASE IF NOT EXISTS coverage_database;
USE coverage_database;

CREATE TABLE IF NOT EXISTS coverage (
    coverageID INT PRIMARY KEY AUTO_INCREMENT,
    expiration_date DATE
);

INSERT INTO coverage (expiration_date)
VALUES
    ('2024-12-31'),
    ('2023-06-15'),
    ('2025-02-28');

SELECT * FROM coverage;