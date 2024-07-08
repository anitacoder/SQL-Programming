USE JUMIADB;

CREATE TABLE IF NOT EXISTS StudentTb (
    StudentID INT NOT NULL PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Age INT
);

CREATE TABLE IF NOT EXISTS DeptTb (
    DEPID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL,
    StudentID INT,
    FOREIGN KEY (StudentID) REFERENCES StudentTb(StudentID)
);

INSERT INTO StudentTb (StudentID, Fname, Lname, Age) VALUES 
(1, 'John', 'Doe', 59),
(2, 'Peter', 'David', 68);


INSERT INTO DeptTb(StudentID, DeptName) VALUES
(1, 'Science'),
(10, 'Math');

SELECT * FROM StudentTb;
SELECT * FROM DeptTb;
