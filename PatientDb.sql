CREATE DATABASE PATIENTDB;
USE PATIENTDB;

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    patient_Fname VARCHAR(255),
    patient_Lname VARCHAR(255),
    Blood_type VARCHAR(10),
    Email VARCHAR(255),
    Gender VARCHAR(10),
    Conditions VARCHAR(255),
    Admission_Date DATE,
    Discharge_Date DATE,
    Phone VARCHAR(15)
);

CREATE TABLE Room (
    Room_ID INT PRIMARY KEY,
    Room_Type VARCHAR(50),
    Patient_ID INT,
    Room_Cost DECIMAL(10, 2),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (patient_id)
);

CREATE TABLE Insurance (
    Policy_Number VARCHAR(20) PRIMARY KEY,
    Patient_ID INT,
    Ins_Code VARCHAR(20),
    End_Date DATE,
    Provider VARCHAR(255),
    Plan VARCHAR(50),
    Co_Pay DECIMAL(10, 2),
    Coverage VARCHAR(255),
    Maternity BOOLEAN,
    Dental BOOLEAN,
    Optical BOOLEAN,
    FOREIGN KEY (Patient_ID) REFERENCES Patient (patient_id)
);

CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY,
    Qualifications VARCHAR(255),
    Emp_ID INT,
    Specialization VARCHAR(50),
    Dept_ID INT,
    FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID),
    FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID)
);

CREATE TABLE Lab_Screening (
    Lab_ID INT PRIMARY KEY,
    Patient_ID INT,
    Technician_ID INT,
    Doctor_ID INT,
    Test_Cost DECIMAL(10, 2),
    Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient (patient_id),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID)
);

CREATE TABLE Medical_History (
    Record_ID INT PRIMARY KEY,
    Patient_ID INT,
    Allergies TEXT,
    Pre_Conditions TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient (patient_id)
);

CREATE TABLE Medicine (
    Medicine_ID INT PRIMARY KEY,
    M_Name VARCHAR(255),
    M_Quantity INT,
    M_Cost DECIMAL(10, 2)
);

CREATE TABLE Prescription (
    Prescription_ID INT PRIMARY KEY,
    Patient_ID INT,
    Date DATE,
    Dosage VARCHAR(50),
    Doctor_ID INT,
    Medicine_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient (patient_id),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID),
    FOREIGN KEY (Medicine_ID) REFERENCES Medicine (Medicine_ID)
);

CREATE TABLE Emergency_Contact (
    Contact_ID INT PRIMARY KEY,
    Contact_Name VARCHAR(255),
    Phone VARCHAR(15),
    Relation VARCHAR(50),
    Patient_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient (patient_id)
);

CREATE TABLE Appointment (
    Appt_ID INT PRIMARY KEY,
    Scheduled_On DATETIME,
    Date DATE,
    Time TIME,
    Doctor_ID INT,
    Patient_ID INT,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (patient_id)
);

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Head VARCHAR(255),
    Dept_Name VARCHAR(255),
    Emp_Count INT
);

CREATE TABLE Nurse (
    Nurse_ID INT PRIMARY KEY,
    Patient_ID INT,
    Emp_ID INT,
    Dept_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient (patient_id),
    FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID),
    FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID)
);

CREATE TABLE Staff (
    Emp_ID INT PRIMARY KEY,
    Emp_Fname VARCHAR(255),
    Emp_Lname VARCHAR(255),
    Date_Joining DATE,
    Emp_Type VARCHAR(50),
    Email VARCHAR(255),
    Address VARCHAR(255),
    Dept_ID INT,
    SSN VARCHAR(20),
    DOB DATE,
    Date_Separation DATE,
    FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID)
);

CREATE TABLE Payroll (
    Account_no VARCHAR(30) PRIMARY KEY,
    Salary DECIMAL(10, 2),
    Bonus DECIMAL(10, 2),
    Emp_ID INT,
    IBAN VARCHAR(30),
    FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID)
);

CREATE TABLE Bill (
    Payment_ID INT PRIMARY KEY,
    Date DATE,
    Room_Cost DECIMAL(10, 2),
    Test_Cost DECIMAL(10, 2),
    Other_Charges DECIMAL(10, 2),
    M_Cost DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    Patient_ID INT,
    Remaining_Balance DECIMAL(10, 2),
    Policy_Number VARCHAR(20),
    FOREIGN KEY (Room_Cost) REFERENCES Room (Room_Cost),
    FOREIGN KEY (Test_Cost) REFERENCES Lab_Screening (Test_Cost),
    FOREIGN KEY (M_Cost) REFERENCES Medicine (M_Cost),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (patient_id),
    FOREIGN KEY (Policy_Number) REFERENCES Insurance (Policy_Number)
);




INSERT INTO Patient (patient_id, patient_Fname, patient_Lname, Blood_type, Email, Gender, Conditions, Admission_Date, Discharge_Date, Phone)
VALUES
    (1, 'John', 'Doe', 'O+', 'john.doe@example.com', 'Male', 'None', '2024-01-27', '2024-02-05', '1234567890'),
    (2, 'Jane', 'Smith', 'A-', 'jane.smith@example.com', 'Female', 'Hypertension', '2024-02-01', '2024-02-15', '9876543210'),
    (3, 'Robert', 'Johnson', 'B+', 'robert.johnson@example.com', 'Male', 'Diabetes', '2024-03-10', NULL, '5555555555');

INSERT INTO Room (Room_ID, Room_Type, Patient_ID, Room_Cost)
VALUES
    (101, 'Standard', 1, 150.00),
    (102, 'Deluxe', 2, 200.00),
    (103, 'Single', 3, 180.00);
    
INSERT INTO Insurance (Policy_Number, Patient_ID, Ins_Code, End_Date, Provider, Plan, Co_Pay, Coverage, Maternity, Dental, Optical)
VALUES
    ('ABC123', 1, 'XYZ', '2025-01-01', 'Insurance Co.', 'Standard', 20.00, 'Medical', true, false, true),
    ('DEF456', 2, 'PQR', '2024-12-31', 'Insure Corp', 'Premium', 30.00, 'Health', false, true, false),
    ('GHI789', 3, 'LMN', '2024-12-31', 'Health Ins.', 'Basic', 25.00, 'Health', true, true, true);

INSERT INTO Doctor (Doctor_ID, Qualifications, Emp_ID, Specialization, Dept_ID)
VALUES
    (101, 'MD, PhD', 1, 'Cardiology', 1),
    (102, 'MBBS', 2, 'Pediatrics', 2),
    (103, 'MD', 3, 'Orthopedics', 3);

INSERT INTO Lab_Screening (Lab_ID, Patient_ID, Technician_ID, Doctor_ID, Test_Cost, Date)
VALUES
    (1, 1, 1, 101, 50.00, '2024-02-01'),
    (2, 2, 2, 102, 40.00, '2024-02-10'),
    (3, 3, 3, 103, 60.00, '2024-03-01');
    
INSERT INTO Medical_History (Record_ID, Patient_ID, Allergies, Pre_Conditions)
VALUES
    (1, 1, 'Penicillin', 'None'),
    (2, 2, 'None', 'Asthma'),
    (3, 3, 'Sulfa Drugs', 'Diabetes');
    
INSERT INTO Medicine (Medicine_ID, M_Name, M_Quantity, M_Cost)
VALUES
    (1, 'Aspirin', 50, 10.00),
    (2, 'Amoxicillin', 30, 15.00),
    (3, 'Insulin', 10, 25.00);
    
INSERT INTO Prescription (Prescription_ID, Patient_ID, Date, Dosage, Doctor_ID, Medicine_ID)
VALUES
    (1, 1, '2024-02-05', '1 pill daily', 101, 1),
    (2, 2, '2024-02-15', '2 pills twice daily', 102, 2),
    (3, 3, '2024-03-10', 'Inject as needed', 103, 3);
    
INSERT INTO Emergency_Contact (Contact_ID, Contact_Name, Phone, Relation, Patient_ID)
VALUES
    (1, 'Mary Doe', '1112223333', 'Spouse', 1),
    (2, 'Bob Smith', '4445556666', 'Sibling', 2),
    (3, 'Alice Johnson', '7778889999', 'Friend', 3);
    
INSERT INTO Appointment (Appt_ID, Scheduled_On, Date, Time, Doctor_ID, Patient_ID)
VALUES
    (1, '2024-02-01 08:00:00', '2024-02-05', '10:00', 101, 1),
    (2, '2024-02-10 09:30:00', '2024-02-15', '14:30', 102, 2),
    (3, '2024-03-01 11:00:00', '2024-03-10', '11:30', 103, 3);
    
INSERT INTO Department (Dept_ID, Dept_Head, Dept_Name, Emp_Count)
VALUES
    (1, 'Dr. Smith', 'Cardiology', 3),
    (2, 'Dr. Johnson', 'Pediatrics', 3),
    (3, 'Dr. Brown', 'Orthopedics', 3);
    
INSERT INTO Nurse (Nurse_ID, Patient_ID, Emp_ID, Dept_ID)
VALUES
    (1, 1, 4, 1),
    (2, 2, 5, 2),
    (3, 3, 6, 3);
    
INSERT INTO Staff (Emp_ID, Emp_Fname, Emp_Lname, Date_Joining, Emp_Type, Email, Address, Dept_ID, SSN, DOB, Date_Separation)
VALUES
    (1, 'John', 'Smith', '2023-01-01', 'Doctor', 'john.smith@example.com', '123 Main St', 1, '123-45-6789', '1980-05-15', NULL),
    (2, 'Jane', 'Brown', '2023-02-01', 'Doctor', 'jane.brown@example.com', '456 Oak St', 2, '987-65-4321', '1985-08-20', NULL),
    (3, 'Robert', 'Johnson', '2023-03-01', 'Doctor', 'robert.johnson@example.com', '789 Elm St', 3, '234-56-7890', '1990-02-10', NULL),
    (4, 'Emily', 'Davis', '2023-04-01', 'Nurse', 'emily.davis@example.com', '101 Pine St', 1, '345-67-8901', '1995-04-25', NULL),
    (5, 'Daniel', 'White', '2023-05-01', 'Nurse', 'daniel.white@example.com', '202 Cedar St', 2, '456-78-9012', '1988-11-30', NULL),
    (6, 'Sarah', 'Miller', '2023-06-01', 'Nurse', 'sarah.miller@example.com', '303 Birch St', 3, '567-89-0123', '1992-07-05', NULL);

INSERT INTO Payroll (Account_no, Salary, Bonus, Emp_ID, IBAN)
VALUES
    ('A123456789', 100000.00, 5000.00, 1, 'IBAN123'),
    ('B987654321', 90000.00, 4000.00, 2, 'IBAN456'),
    ('C567890123', 80000.00, 3000.00, 3, 'IBAN789'),
    ('D234567890', 70000.00, 2000.00, 4, 'IBAN012'),
    ('E345678901', 60000.00, 1000.00, 5, 'IBAN345'),
    ('F456789012', 50000.00, 500.00, 6, 'IBAN678');
    
INSERT INTO Bill (Payment_ID, Date, Room_Cost, Test_Cost, Other_Charges, M_Cost, Total, Patient_ID, Remaining_Balance, Policy_Number)
VALUES
    (1, '2024-02-10', 150.00, 50.00, 20.00, 15.00, 235.00, 1, 100.00, 'ABC123'),
    (2, '2024-02-15', 200.00, 40.00, 15.00, 20.00, 275.00, 2, 80.00, 'DEF456'),
    (3, '2024-03-05', 180.00, 60.00, 25.00, 30.00, 295.00, 3, 120.00, 'GHI789');

SELECT * FROM Patient;
SELECT * FROM Room;
SELECT * FROM Insurance;
SELECT * FROM Doctor;
SELECT * FROM Lab_Screening;
SELECT * FROM Medical_History;
SELECT * FROM Medicine;
SELECT * FROM Prescription;
SELECT * FROM Emergency_Contact;
SELECT * FROM Appointment;
SELECT * FROM Department;
SELECT * FROM Nurse;
SELECT * FROM Staff;
SELECT * FROM Payroll;
SELECT * FROM Bill;











