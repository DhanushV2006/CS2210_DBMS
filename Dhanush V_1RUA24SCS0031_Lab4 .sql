-- ======================================================================
-- Lab Experiment 04 – Implementation of Different Types of Operators in SQL
-- ======================================================================

-- Step 1: Create Database
DROP DATABASE IF EXISTS OperatorLab;
CREATE DATABASE OperatorLab;
USE OperatorLab;

-- Step 2: Create Tables
CREATE TABLE Employees (

    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Step 3: Insert Sample Data
INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'),
(1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'),
(1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'),
(1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York');

INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID) VALUES
(1, 'IT', 1001),
(2, 'HR', 1002),
(3, 'Finance', 1003);

-- ======================================================================
-- PRACTICE TASKS
-- ======================================================================

-- ========================
-- Exercise 1: Arithmetic Operators
-- ========================

-- a. Add a bonus (10% of Salary) to each employee's salary.
-- WRITE YOUR QUERY BELOW
SELECT 
    Name, 
    Salary, 
    Salary * 0.10 AS Bonus, 
    Salary + (Salary * 0.10) AS TotalWithBonus
FROM Employees;

-- Name, Salary, Bonus, TotalWithBonus
-- Ashish	60000.00	6000.0000	66000.0000
-- Binay	80000.00	8000.0000	88000.0000
-- Charlie	55000.00	5500.0000	60500.0000
-- Dhruv	75000.00	7500.0000	82500.0000


-- b. Subtract tax (15% of Salary) from each employee's salary.
-- WRITE YOUR QUERY BELOW
SELECT 
    Name, 
    Salary, 
    Salary * 0.15 AS Tax, 
    Salary - (Salary * 0.15) AS SalaryAfterTax
FROM Employees;
-- Name, Salary, Tax, SalaryAfterTax
-- Ashish	60000.00	9000.0000	51000.0000
-- Binay	80000.00	12000.0000	68000.0000
-- Charlie	55000.00	8250.0000	46750.0000
-- Dhruv	75000.00	11250.0000	63750.0000

-- c. Calculate the yearly salary from the monthly salary (Salary * 12).
-- WRITE YOUR QUERY BELOW
SELECT 
    Name, 
    Salary, 
    Salary * 12 AS YearlySalary
FROM Employees;
-- Name, Salary, YearlySalary
-- Ashish	60000.00	720000.00
-- Binay	80000.00	960000.00
-- Charlie	55000.00	660000.00
-- Dhruv	75000.00	900000.00

-- d. Find the remainder when employees' ages are divided by 5.
-- WRITE YOUR QUERY BELOW
SELECT 
    Name, 
    Age, 
    Age % 5 AS AgeRemainder
FROM Employees;
-- Name, Age, AgeRemainder
-- Ashish	28	3
-- Binay	45	0
-- Charlie	32	2
-- Dhruv	38	3

-- ========================
-- Exercise 2: Logical Operators
-- ========================

-- a. Employees older than 30 and salary greater than 50000.
-- WRITE YOUR QUERY BELOW
SELECT * 
FROM Employees 
WHERE Age > 30 AND Salary > 50000;


-- b. Employees either in 'HR' department OR salary > 70000.
-- WRITE YOUR QUERY BELOW
SELECT * 
FROM Employees 
WHERE Department = 'HR' OR Salary > 70000;


-- c. Employees who do NOT live in 'New York'.
-- WRITE YOUR QUERY BELOW
SELECT * 
FROM Employees 
WHERE Address NOT LIKE '%New York%';



-- ========================
-- Exercise 3: Comparison Operators
-- ========================

-- a. Find employees with salary = 60000.
-- WRITE YOUR QUERY BELOW
SELECT * 
FROM Employees 
WHERE Salary = 60000;


-- b. List employees not in the 'IT' department.
-- WRITE YOUR QUERY BELOW
SELECT * 
FROM Employees 
WHERE Department <> 'IT';


-- c. Retrieve employees younger than 25 with salary > 50000.
-- WRITE YOUR QUERY BELOW
SELECT * 
FROM Employees 
WHERE Age < 25 AND Salary > 50000;



-- ========================
-- Exercise 4: Special Operators
-- ========================

-- a. BETWEEN → List employees with age between 25 and 35.
-- WRITE YOUR QUERY BELOW
SELECT * 
FROM Employees 
WHERE Age BETWEEN 25 AND 35;


-- b. IN → Find employees working in 'HR', 'IT', or 'Finance'.
-- WRITE YOUR QUERY BELOW
SELECT * 
FROM Employees 
WHERE Department IN ('HR', 'IT', 'Finance');


-- c. LIKE → Find employees whose names start with 'A'.
-- WRITE YOUR QUERY BELOW
SELECT * 
FROM Employees 
WHERE Name LIKE 'A%';


-- d. IS NULL → List employees whose address is not available.
-- WRITE YOUR QUERY BELOW
SELECT * 
FROM Employees 
WHERE Address IS NULL;



-- ========================
-- Exercise 5: Set Operators
-- ========================

-- NOTE: For these, assume you have two Employee tables (Employees2022 and Employees2023).

-- a. UNION → Retrieve employees from 'HR' department in 2023 and 2022.
-- WRITE YOUR QUERY BELOW
CREATE TABLE Employees2022 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);

CREATE TABLE Employees2023 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);

INSERT INTO Employees2022 (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(2001, 'Amit', 29, 60000, 'HR', '2020-01-15', '12 First St, Boston'),
(2002, 'Bhavna', 34, 70000, 'IT', '2020-03-20', '45 Lakeview, Miami'),
(2003, 'Chetan', 41, 80000, 'Finance', '2021-06-10', '22 Sunset Blvd, LA'),
(2004, 'Disha', 30, 55000, 'HR', '2022-02-11', '99 Hill Rd, Seattle');

INSERT INTO Employees2023 (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(2002, 'Bhavna', 35, 72000, 'IT', '2020-03-20', '45 Lakeview, Miami'),  -- Same as 2022 (for INTERSECT)
(2003, 'Chetan', 42, 81000, 'Finance', '2021-06-10', '22 Sunset Blvd, LA'), -- Same
(2005, 'Esha', 27, 50000, 'HR', '2023-01-25', '5 Ocean St, SF'),
(2006, 'Farhan', 38, 88000, 'Marketing', '2023-05-14', '11 City Center, NY');



SELECT * FROM Employees2022 WHERE Department = 'HR'
UNION
SELECT * FROM Employees2023 WHERE Department = 'HR';


-- b. INTERSECT → Find common employees in 'IT' department across 2022 & 2023.
-- (MySQL doesn’t have INTERSECT directly – use INNER JOIN / EXISTS workaround)
-- WRITE YOUR QUERY BELOW
SELECT e2022.*
FROM Employees2022 e2022
INNER JOIN Employees2023 e2023 
    ON e2022.EmployeeID = e2023.EmployeeID
WHERE e2022.Department = 'IT' AND e2023.Department = 'IT';


-- c. EXCEPT → Find employees who worked in 2023 but not in 2022.
-- (MySQL doesn’t have EXCEPT directly – use LEFT JOIN / NOT EXISTS workaround)
-- WRITE YOUR QUERY BELOW
SELECT e2023.*
FROM Employees2023 e2023
LEFT JOIN Employees2022 e2022 
    ON e2023.EmployeeID = e2022.EmployeeID
WHERE e2022.EmployeeID IS NULL;


-- ======================================================================
-- END OF EXPERIMENT 04
-- ======================================================================