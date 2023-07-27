-- @block
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100),
  Age SMALLINT,
  Address VARCHAR(200)
);

-- @block
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  OrderDate DATE,
  TotalAmount DECIMAL(10,2),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- @block
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(100),
  CategoryID INT,
  Price DECIMAL(10,2),
  INDEX (ProductName)
);

-- @block
CREATE TABLE Categories (
  CategoryID INT PRIMARY KEY,
  CategoryName VARCHAR(50)
);

-- @block
ALTER TABLE Customers
MODIFY COLUMN Age SMALLINT;

-- @block
ALTER TABLE Customers
CHANGE COLUMN LastName Surname VARCHAR(50);

-- @block
ALTER TABLE Customers
DROP COLUMN Address;
