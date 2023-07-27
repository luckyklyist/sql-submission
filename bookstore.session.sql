-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(200) DEFAULT 'Not provided'
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    BookTitle VARCHAR(100),
    Author VARCHAR(100),
    Price DECIMAL(10,2)
);

-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

-- Create OrderItems table
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Add a unique constraint to the "Email" column in the "Customers" table
ALTER TABLE Customers
ADD CONSTRAINT UC_Customers_Email UNIQUE (Email);

-- Create an index on the "Author" column in the "Books" table
CREATE INDEX idx_Author ON Books(Author);

-- Modify the data type of the "Phone" column in the "Customers" table
ALTER TABLE Customers
MODIFY Phone VARCHAR(15);

-- @block
-- Rename the "Title" column in the "Books" table to "BookTitle"
ALTER TABLE Books
CHANGE COLUMN BookTitle Title VARCHAR(100);

-- Remove the "Description" column from the "Categories" table
ALTER TABLE Categories
DROP COLUMN Description;
