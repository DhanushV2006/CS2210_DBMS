CREATE DATABASE OnlineShoppingDB;
USE OnlineShoppingDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);

CREATE TABLE Stores (
    StoreID INT PRIMARY KEY AUTO_INCREMENT,
    StoreName VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    StoreID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Customers (Name, Email, Phone, Address) VALUES
('Alice Johnson', 'alice@example.com', '9876543210', 'New York'),
('Bob Smith', 'bob@example.com', '9876500001', 'California'),
('Charlie Brown', 'charlie@example.com', '9876500002', 'Texas'),
('Diana Prince', 'diana@example.com', '9876500003', 'Florida'),
('Ethan Hunt', 'ethan@example.com', '9876500004', 'Chicago');

INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Office Chair', 'Furniture', 150.00, 20),
('Laptop', 'Electronics', 800.00, 15),
('Dining Table', 'Furniture', 500.00, 10),
('Smartphone', 'Electronics', 600.00, 25),
('Bookshelf', 'Furniture', 200.00, 12);

INSERT INTO Stores (StoreName, Location) VALUES
('Tech Store', 'New York'),
('Home Furnishings', 'California'),
('SuperMart', 'Texas'),
('City Electronics', 'Florida'),
('Furniture World', 'Chicago');

INSERT INTO Orders (CustomerID, StoreID, OrderDate) VALUES
(1, 1, '2025-08-01'),
(2, 2, '2025-08-02'),
(3, 3, '2025-08-03'),
(4, 4, '2025-08-04'),
(5, 5, '2025-08-05');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 4, 1),
(4, 3, 1),
(5, 5, 3);

INSERT INTO Payments (OrderID, Amount, PaymentDate, PaymentMethod) VALUES
(1, 800.00, '2025-08-01', 'Credit Card'),
(2, 300.00, '2025-08-02', 'PayPal'),
(3, 600.00, '2025-08-03', 'Debit Card'),
(4, 500.00, '2025-08-04', 'Net Banking'),
(5, 600.00, '2025-08-05', 'Cash');

UPDATE Products
SET StockQuantity = StockQuantity - 3
WHERE ProductID = 5;

UPDATE Products
SET Price = Price * 1.10
WHERE Category = 'Furniture';

DELETE FROM Customers
WHERE CustomerID = 5;

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Stores;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Payments;
