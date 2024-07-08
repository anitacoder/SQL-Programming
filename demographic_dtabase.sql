CREATE DATABASE IF NOT EXISTS demographic_database;
USE demographic_database;

CREATE TABLE IF NOT EXISTS demographics (
    demoID INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    zipcode VARCHAR(10),
    country VARCHAR(255),
    longitude DECIMAL(10, 6),
    latitude DECIMAL(10, 6)
);

INSERT INTO demographics (address, city, state, zipcode, country, longitude, latitude)
VALUES
    ('123 Main St', 'Cityville', 'CA', '12345', 'USA', -120.123456, 34.567890),
    ('456 Oak St', 'Townsville', 'NY', '54321', 'USA', -74.123456, 40.987654),
    ('789 Pine St', 'Villagetown', 'TX', '67890', 'USA', -95.123456, 29.345678);

SELECT * FROM demographics;
