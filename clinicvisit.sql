CREATE DATABASE IF NOT EXISTS clinicalvisitsdatabase;
USE clinicalvisitsdatabase;

CREATE TABLE IF NOT EXISTS clinical_visits (
    visitid INT PRIMARY KEY AUTO_INCREMENT,
    visittime DATETIME,
    visittype VARCHAR(255)
);

INSERT INTO clinical_visits (visittime, visittype)
VALUES
    ('2024-01-22 10:30:00', 'Routine Checkup'),
    ('2024-01-23 14:45:00', 'Emergency'),
    ('2024-01-25 11:15:00', 'Follow-up');

SELECT * FROM clinical_visits;
