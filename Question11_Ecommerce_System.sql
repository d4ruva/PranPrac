-- Create Database
CREATE DATABASE EcommerceDB;

-- Use Database
USE EcommerceDB;

-- Create Customer Table
CREATE TABLE Customer(
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);

-- Create Orders Table
CREATE TABLE Orders(
    Oid INT PRIMARY KEY,
    Cid INT,
    FOREIGN KEY(Cid) REFERENCES Customer(Cid)
);

-- Create OrderItem Table
CREATE TABLE OrderItem(
    Oid INT,
    Pid INT,
    Qty INT,
    PRIMARY KEY(Oid, Pid),
    FOREIGN KEY(Oid) REFERENCES Orders(Oid)
);

-- Insert Data
INSERT INTO Customer VALUES
(1,'Amit'),
(2,'Neha'),
(3,'Ravi');

INSERT INTO Orders VALUES
(101,1),
(102,1),
(103,2);

INSERT INTO OrderItem VALUES
(101,1001,2),
(101,1002,1),
(102,1003,5),
(103,1004,3);

-- i. Display customers who placed orders
SELECT DISTINCT Customer.Cname
FROM Customer
JOIN Orders ON Customer.Cid = Orders.Cid;

-- ii. Count order items per order
SELECT Oid, COUNT(Pid) AS Total_Items
FROM OrderItem
GROUP BY Oid;

-- iii. Display customer with order details using JOIN
SELECT Customer.Cname, Orders.Oid, OrderItem.Pid, OrderItem.Qty
FROM Customer
JOIN Orders ON Customer.Cid = Orders.Cid
JOIN OrderItem ON Orders.Oid = OrderItem.Oid;

-- iv. Display customers placing more than average number of orders using Nested Query
SELECT Cname
FROM Customer
WHERE Cid IN
(
    SELECT Cid
    FROM Orders
    GROUP BY Cid
    HAVING COUNT(Oid) >
    (
        SELECT AVG(OrderCount)
        FROM
        (
            SELECT COUNT(Oid) AS OrderCount
            FROM Orders
            GROUP BY Cid
        ) AS Temp
    )
);