-- Create the database
CREATE DATABASE Customers_Orders_Products;

-- Create the Customers table
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

-- Insert data into the Customers table
INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com'),
  (11, 'Alex Brown', 'alexbrown@example.com'),
  (12, 'Sophie Turner', 'sophieturner@example.com'),
  (13, 'Charlie Miller', 'charliemiller@example.com'),
  (14, 'Ava Wilson', 'avawilson@example.com'),
  (15, 'Daniel Harris', 'danielharris@example.com'),
  (16, 'Emma Davis', 'emmadavis@example.com'),
  (17, 'James White', 'jameswhite@example.com'),
  (18, 'Lily Martin', 'lilymartin@example.com'),
  (19, 'Benjamin Johnson', 'benjaminjohnson@example.com'),
  (20, 'Zoe Anderson', 'zoeanderson@example.com'),
  (21, 'Jackson Moore', 'jacksonmoore@example.com'),
  (22, 'Victoria Lewis', 'victorialewis@example.com'),
  (23, 'Ethan Garcia', 'ethangarcia@example.com'),
  (24, 'Grace Taylor', 'gracetaylor@example.com'),
  (25, 'Christopher Hall', 'christopherhall@example.com');

-- Create the Orders table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

-- Insert data into the Orders table
INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1),
  (11, 11, 'Product D', '2023-07-11', 2),
  (12, 12, 'Product E', '2023-07-12', 3),
  (13, 13, 'Product F', '2023-07-13', 4),
  (14, 14, 'Product G', '2023-07-14', 1),
  (15, 15, 'Product H', '2023-07-15', 5),
  (16, 16, 'Product I', '2023-07-16', 2),
  (17, 17, 'Product J', '2023-07-17', 3),
  (18, 18, 'Product A', '2023-07-18', 4),
  (19, 19, 'Product B', '2023-07-19', 2),
  (20, 20, 'Product C', '2023-07-20', 1),
  (21, 21, 'Product D', '2023-07-21', 3),
  (22, 22, 'Product E', '2023-07-22', 5),
  (23, 23, 'Product F', '2023-07-23', 2),
  (24, 24, 'Product G', '2023-07-24', 1),
  (25, 25, 'Product H', '2023-07-25', 4);

-- Create the Products table
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

-- Insert data into the Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99),
  (11, 'Product K', 15.99),
  (12, 'Product L', 9.99),
  (13, 'Product M', 6.49),
  (14, 'Product N', 11.49),
  (15, 'Product O', 8.99),
  (16, 'Product P', 7.49),
  (17, 'Product Q', 10.99),
  (18, 'Product R', 13.99),
  (19, 'Product S', 16.49),
  (20, 'Product T', 5.49),
  (21, 'Product U', 14.99),
  (22, 'Product V', 8.49),
  (23, 'Product W', 9.99),
  (24, 'Product X', 12.49),
  (25, 'Product Y', 4.99);

--========================================================================================================================--

-- TASK 1 :

-- 1- Retrieve all records from the Customers table.
SELECT * FROM Customers;

-- 2- Retrieve the names and email addresses of customers whose names start with 'J'.
SELECT Name, Email FROM Customers WHERE Name LIKE 'J%';

-- 3- Retrieve the order details (OrderID, ProductName, Quantity) for all orders.
SELECT OrderID, ProductName, Quantity FROM Orders;

-- 4- Calculate the total quantity of products ordered.
SELECT SUM(Quantity) AS TotalQuantity FROM Orders;

-- 5- Retrieve the names of customers who have placed an order.
SELECT DISTINCT c.Name 
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 6- Retrieve the products with a price greater than $10.00.
SELECT * FROM Products WHERE Price > 10.00;

-- 7- Retrieve the customer name and order date for all orders placed on or after '2023-07-05'.
SELECT c.Name, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '2023-07-05';

-- 8- Calculate the average price of all products.
SELECT AVG(Price) AS AveragePrice FROM Products;

-- 9- Retrieve the customer names along with the total quantity of products they have ordered.
SELECT c.Name, SUM(o.Quantity) AS TotalQuantityOrdered
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name;

-- 10- Retrieve the products that have not been ordered.
SELECT p.ProductName
FROM Products p
LEFT JOIN Orders o ON p.ProductName = o.ProductName
WHERE o.OrderID IS NULL;

--========================================================================================================================--

-- TASK 2 :

-- 1- Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.
SELECT TOP 5 c.CustomerID, c.Name, SUM(o.Quantity) AS TotalQuantity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalQuantity DESC;

-- 2- Write a query to calculate the average price of products for each product category.
-- Assuming there is a column 'Category' in Products table which is not provided in the original data
SELECT Category, AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;

-- 3- Write a query to retrieve the customers who have not placed any orders.
SELECT c.CustomerID, c.Name
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;

-- 4- Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.
SELECT o.OrderID, o.ProductName, o.Quantity
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Name LIKE 'M%';

-- 5- Write a query to calculate the total revenue generated from all orders.
SELECT SUM(o.Quantity * p.Price) AS TotalRevenue
FROM Orders o
JOIN Products p ON o.ProductName = p.ProductName;

-- 6- Write a query to retrieve the customer names along with the total revenue generated from their orders.
SELECT c.CustomerID, c.Name, SUM(o.Quantity * p.Price) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductName = p.ProductName
GROUP BY c.CustomerID, c.Name;

-- 7- Write a query to retrieve the customers who have placed at least one order for each product category.
-- Assuming there is a column 'Category' in Products table which is not provided in the original data
SELECT c.CustomerID, c.Name
FROM Customers c
WHERE NOT EXISTS (
    SELECT Category
    FROM Products p
    WHERE NOT EXISTS (
        SELECT 1
        FROM Orders o
        JOIN Products p2 ON o.ProductName = p2.ProductName
        WHERE o.CustomerID = c.CustomerID
        AND p.Category = p2.Category
    )
);

-- 8- Write a query to retrieve the customers who have placed orders on consecutive days.
SELECT DISTINCT c.CustomerID, c.Name
FROM Customers c
JOIN Orders o1 ON c.CustomerID = o1.CustomerID
JOIN Orders o2 ON c.CustomerID = o2.CustomerID
WHERE DATEDIFF(DAY, o1.OrderDate, o2.OrderDate) = 1;

-- 9- Write a query to retrieve the top 3 products with the highest average quantity ordered.
SELECT TOP 3 ProductName, AVG(Quantity) AS AvgQuantity
FROM Orders
GROUP BY ProductName
ORDER BY AvgQuantity DESC;

-- 10- Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.
SELECT 
    (SUM(CASE WHEN o.Quantity > (SELECT AVG(Quantity) FROM Orders) THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Percentage
FROM Orders o;

--========================================================================================================================--

-- TASK 3 :

-- 1- Write a query to retrieve the customers who have placed orders for all products.
SELECT c.CustomerID, c.Name
FROM Customers c
WHERE NOT EXISTS (
    SELECT p.ProductID
    FROM Products p
    WHERE NOT EXISTS (
        SELECT 1
        FROM Orders o
        WHERE o.CustomerID = c.CustomerID
        AND o.ProductName = p.ProductName
    )
);

-- 2- Write a query to retrieve the products that have been ordered by all customers.
SELECT p.ProductName
FROM Products p
WHERE NOT EXISTS (
    SELECT c.CustomerID
    FROM Customers c
    WHERE NOT EXISTS (
        SELECT 1
        FROM Orders o
        WHERE o.CustomerID = c.CustomerID
        AND o.ProductName = p.ProductName
    )
);

-- 3- Write a query to calculate the total revenue generated from orders placed in each month.
SELECT MONTH(OrderDate) AS Month, YEAR(OrderDate) AS Year, SUM(Quantity * Price) AS Revenue
FROM Orders o
JOIN Products p ON o.ProductName = p.ProductName
GROUP BY YEAR(OrderDate), MONTH(OrderDate);

-- 4- Write a query to retrieve the products that have been ordered by more than 50% of the customers.
SELECT p.ProductName
FROM Products p
JOIN Orders o ON p.ProductName = o.ProductName
GROUP BY p.ProductName
HAVING COUNT(DISTINCT o.CustomerID) > (SELECT COUNT(*) * 0.5 FROM Customers);

-- 5- Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.
SELECT TOP 5 c.Name, SUM(o.Quantity * p.Price) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductName = p.ProductName
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC;

-- 6- Write a query to calculate the running total of order quantities for each customer.
SELECT CustomerID, OrderID, Quantity, 
       SUM(Quantity) OVER (PARTITION BY CustomerID ORDER BY OrderID) AS RunningTotal
FROM Orders;

-- 7- Write a query to retrieve the top 3 most recent orders for each customer.
SELECT CustomerID, OrderID, OrderDate
FROM (
    SELECT CustomerID, OrderID, OrderDate,
           ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS RowNum
    FROM Orders
) AS RankedOrders
WHERE RowNum <= 3;

-- 8- Write a query to calculate the total revenue generated by each customer in the last 30 days.
SELECT c.CustomerID, c.Name, SUM(o.Quantity * p.Price) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductName = p.ProductName
WHERE o.OrderDate >= DATEADD(DAY, -30, GETDATE())
GROUP BY c.CustomerID, c.Name;

-- 9- Write a query to retrieve the customers who have placed orders for at least two different product categories.
SELECT c.CustomerID, c.Name
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductName = p.ProductName
GROUP BY c.CustomerID, c.Name
HAVING COUNT(DISTINCT p.ProductID) >= 2;

-- 10- Write a query to calculate the average revenue per order for each customer.
SELECT c.CustomerID, c.Name, AVG(o.Quantity * p.Price) AS AvgRevenuePerOrder
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductName = p.ProductName
GROUP BY c.CustomerID, c.Name;

-- 11- Write a query to retrieve the customers who have placed orders for every month of a specific year.
SELECT c.CustomerID, c.Name
FROM Customers c
WHERE NOT EXISTS (
    SELECT DISTINCT MONTH(o1.OrderDate) AS OrderMonth
    FROM Orders o1
    WHERE YEAR(o1.OrderDate) = 2023
    AND NOT EXISTS (
        SELECT 1
        FROM Orders o2
        WHERE o2.CustomerID = c.CustomerID
        AND YEAR(o2.OrderDate) = 2023
        AND MONTH(o2.OrderDate) = MONTH(o1.OrderDate)
    )
);

-- 12- Write a query to retrieve the customers who have placed orders for a specific product in consecutive months.
SELECT c.CustomerID, c.Name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
    AND o.ProductName = 'Product A'
    GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
    HAVING COUNT(DISTINCT MONTH(o.OrderDate)) > 1
);

-- 13- Write a query to retrieve the products that have been ordered by a specific customer at least twice.
SELECT p.ProductName
FROM Products p
JOIN Orders o ON p.ProductName = o.ProductName
WHERE o.CustomerID = 1
GROUP BY p.ProductName
HAVING COUNT(*) >= 2;
