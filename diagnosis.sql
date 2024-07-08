CREATE DATABASE IF NOT EXISTS diagnosis_database;
USE diagnosis_database;

CREATE TABLE IF NOT EXISTS diagnoses (
    diagnosisID INT PRIMARY KEY AUTO_INCREMENT,
    diagnosistime DATETIME,
    description TEXT
);

INSERT INTO diagnoses (diagnosistime, description)
VALUES
    ('2024-01-22 08:45:00', 'Common cold'),
    ('2024-01-23 15:30:00', 'Fractured arm'),
    ('2024-01-25 10:20:00', 'Hypertension');

SELECT * FROM diagnoses;
