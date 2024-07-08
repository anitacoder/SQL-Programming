CREATE DATABASE BOOKSTORE;
USE BOOKSTORE;

CREATE TABLE Book_Categories (
    book_category_code INT PRIMARY KEY,
    book_category_description VARCHAR(255)
);

CREATE TABLE Authors (
    author_ID INT PRIMARY KEY,
    author_Firstname VARCHAR(255),
    author_initials VARCHAR(255),
    author_Lastname VARCHAR(255),
    author_date_of_birth DATE,
    author_Gender VARCHAR(255),
    author_contact_details VARCHAR(50), 
    author_other_details VARCHAR(255)
);

CREATE TABLE Customers (
    customer_ID INT PRIMARY KEY,
    customer_code INT,
    customer_Name VARCHAR(255),
    customer_Address VARCHAR(255),
    customer_Phone BIGINT,
    customer_Email VARCHAR(255)
);

CREATE TABLE Orders (
    order_ID INT PRIMARY KEY,
    customer_ID INT,
    order_date DATE, 
    order_value DECIMAL(10, 2),
    FOREIGN KEY (customer_ID) REFERENCES Customers(customer_ID)
);

CREATE TABLE Books (
    book_ID INT PRIMARY KEY,
    author_ID INT,
    book_category_code INT,
    ISBN INT,
    date_of_publication DATE,
    date_Acquired DATE,
    book_Title VARCHAR(255),
    book_Recommended_Price DECIMAL(10, 2), 
    book_Comments VARCHAR(255),
    FOREIGN KEY (book_category_code) REFERENCES Book_Categories(book_category_code),
    FOREIGN KEY (author_ID) REFERENCES Authors(author_ID)
);

CREATE TABLE Order_items (
    item_Number INT PRIMARY KEY,
    order_ID INT,
    book_ID INT,
    item_Agreed_Price DECIMAL(10, 2),
    item_Comment VARCHAR(255),
    FOREIGN KEY (order_ID) REFERENCES Orders(order_ID),
    FOREIGN KEY (book_ID) REFERENCES Books(book_ID)
);

CREATE TABLE Ref_Contact_Types (
    contact_Type_code INT PRIMARY KEY,
    contact_type_description VARCHAR(255)
);

CREATE TABLE Contacts (
    contact_ID INT PRIMARY KEY,
    contact_Type_Code INT,
    contact_Firstname VARCHAR(255),
    contact_Lastname VARCHAR(255),
    contact_WorkPhonenumber BIGINT,
    contact_CellPhonenumber BIGINT,
    contact_OtherDetails VARCHAR(255),
    FOREIGN KEY (contact_Type_Code) REFERENCES Ref_Contact_Types(contact_Type_code)
);



INSERT INTO Book_Categories (book_category_code, book_category_description) VALUES
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Science Fiction');

INSERT INTO Authors (author_ID, author_Firstname, author_initials, author_Lastname, author_date_of_birth, author_Gender, author_contact_details, author_other_details) VALUES
(1, 'John', 'D.', 'Doe', '1980-01-01', 'Male', '1234567890', 'Award-winning author'),
(2, 'Jane', 'A.', 'Smith', '1975-02-15', 'Female', '9876543210', 'Bestselling novelist'),
(3, 'Robert', 'L.', 'Johnson', '1990-10-20', 'Male', '5555555555', 'Sci-Fi enthusiast');

INSERT INTO Customers (customer_ID, customer_code, customer_Name, customer_Address, customer_Phone, customer_Email) VALUES
(1, 1001, 'Alice Johnson', '123 Main St, Cityville', 5551234567, 'alice@email.com'),
(2, 1002, 'Bob Smith', '456 Oak St, Townsville', 5559876543, 'bob@email.com'),
(3, 1003, 'Charlie Davis', '789 Pine St, Villagetown', 5551112233, 'charlie@email.com');

INSERT INTO Orders (order_ID, customer_ID, order_date, order_value) VALUES
(101, 1, '2024-01-01', 50.00),
(102, 2, '2024-01-02', 75.50),
(103, 3, '2024-01-03', 30.25);

INSERT INTO Books (book_ID, author_ID, book_category_code, ISBN, date_of_publication, date_Acquired, book_Title, book_Recommended_Price, book_Comments) VALUES
(1, 1, 1, 1234567890123, '2010-01-01', '2022-01-01', 'The Secret Garden', 19.99, 'Classic novel'),
(2, 2, 2, 9876543210987, '2015-02-15', '2022-01-15', 'Sapiens: A Brief History of Humankind', 29.99, 'Bestseller'),
(3, 3, 3, 5555555555555, '2020-10-20', '2022-10-20', 'Dystopia Rising', 24.99, 'Sci-Fi adventure');

INSERT INTO Order_items (item_Number, order_ID, book_ID, item_Agreed_Price, item_Comment) VALUES
(201, 101, 1, 19.99, 'Great choice!'),
(202, 102, 2, 29.99, 'Excellent read'),
(203, 103, 3, 24.99, 'Exciting journey');

INSERT INTO Ref_Contact_Types (contact_Type_code, contact_type_description) VALUES
(1, 'Type1'),
(2, 'Type2'),
(3, 'Type3');

INSERT INTO Contacts (contact_ID, contact_Type_Code, contact_Firstname, contact_Lastname, contact_WorkPhonenumber, contact_CellPhonenumber, contact_OtherDetails) VALUES
(1, 1, 'John', 'Doe', 1234567890, 5551112233, 'Details1'),
(2, 2, 'Jane', 'Smith', 9876543210, 5554445566, 'Details2'),
(3, 3, 'Robert', 'Johnson', 5555555555, 5556667777, 'Details3');

SELECT * FROM Book_Categories;
SELECT * FROM Authors;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Books;
SELECT * FROM Order_items;
SELECT * FROM Ref_Contact_Types;
SELECT * FROM Contacts;



