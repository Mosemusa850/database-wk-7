-- i will Use the salesdb database
USE salesdb;

-- Question 1: Transform ProductDetail table into 1NF
-- Create a new table ProductDetail_1NF to eliminate repeating groups in Products column
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50),
    PRIMARY KEY (OrderID, Product)
);

-- Insert data into ProductDetail_1NF, splitting Products into individual rows
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- Question 2: Transform OrderDetails table into 2NF
-- Step 1: Create Orders table to store OrderID and CustomerName (remove partial dependency)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Create OrderDetails_2NF table for OrderID, Product, and Quantity
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Orders table (unique OrderID and CustomerName)
INSERT INTO Orders (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Insert data into OrderDetails_2NF table (OrderID, Product, Quantity)
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);
