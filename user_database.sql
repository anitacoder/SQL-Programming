CREATE DATABASE IF NOT EXISTS user_database;
USE user_database;

CREATE TABLE IF NOT EXISTS users (
    userid INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE,
    patientid INT,
    FOREIGN KEY (patientid) REFERENCES hospital.patients(patientid)
);

INSERT INTO users (username, patientid)
VALUES
    ('john_doe', 1),
    ('jane_smith', 2),
    ('bob_jones', 3);

SELECT * FROM users;
