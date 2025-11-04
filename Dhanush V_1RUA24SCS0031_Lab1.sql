CREATE DATABASE UniversityDB;
USE UniversityDB;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(100) NOT NULL
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(100) NOT NULL,
    Age INT,
    Gender VARCHAR(10),
    DOA DATE,
    City VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE Professors (
    ProfID INT PRIMARY KEY AUTO_INCREMENT,
    ProfName VARCHAR(100),
    DeptID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE Enrollments (
    EnrollID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Departments (DeptName) VALUES
('Computer Science'),
('Information Technology'),
('Electronics'),
('Mechanical'),
('Civil');

INSERT INTO Students (StudentName, Age, Gender, DOA, City, DeptID) VALUES
('Dhanush', 20, 'M', '2023-09-01', 'Bangalore', 1),
('Manoj', 21, 'M', '2023-09-01', 'Mysuru', 1),
('Ananya', 19, 'F', '2023-09-01', 'Hubli', 2),
('Ravi', 22, 'M', '2023-09-01', 'Mangalore', 3),
('Sneha', 20, 'F', '2023-09-01', 'Davangere', 2);

INSERT INTO Courses (CourseName, DeptID) VALUES
('Database Systems', 1),
('Computer Networks', 1),
('Digital Logic', 3),
('Thermodynamics', 4),
('Structural Engineering', 5);

INSERT INTO Professors (ProfName, DeptID, Salary) VALUES
('Dr. Rajesh', 1, 85000),
('Dr. Priya', 2, 78000),
('Dr. Manoj', 3, 72000),
('Dr. Meena', 4, 90000),
('Dr. Kiran', 5, 81000);

INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 4),
(5, 5);

ALTER TABLE Students
ADD PhoneNumber VARCHAR(15);

ALTER TABLE Courses
MODIFY CourseName VARCHAR(150);

ALTER TABLE Professors
DROP COLUMN Salary;

DROP TABLE Enrollments;
DROP DATABASE UniversityDB;
