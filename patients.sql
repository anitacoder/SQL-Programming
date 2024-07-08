CREATE DATABASE IF NOT EXISTS physicians_database;
USE physicians_database;

CREATE TABLE IF NOT EXISTS physicians (
    physicianid INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    speciality VARCHAR(255)
);

INSERT INTO physicians (firstname, lastname, speciality)
VALUES
    ('John', 'Doe', 'Cardiology'),
    ('Jane', 'Smith', 'Pediatrics'),
    ('Bob', 'Johnson', 'Orthopedics');

SELECT * FROM physicians;
