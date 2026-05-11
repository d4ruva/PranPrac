-- Create Database
CREATE DATABASE FoodDeliveryDB;

-- Use Database
USE FoodDeliveryDB;

-- Create Restaurant Table
CREATE TABLE Restaurant(
    Rid INT PRIMARY KEY,
    Rname VARCHAR(50) NOT NULL
);

-- Create Orders Table
CREATE TABLE Orders(
    Oid INT PRIMARY KEY,
    Rid INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY(Rid) REFERENCES Restaurant(Rid)
);

-- Insert Data
INSERT INTO Restaurant VALUES
(101,'FoodHub'),
(102,'SpicyKitchen');

INSERT INTO Orders VALUES
(1,101,1500),
(2,101,1200),
(3,102,800);

-- i. Display restaurants having orders above 1000
SELECT Restaurant.Rname, Orders.Amount
FROM Restaurant
JOIN Orders ON Restaurant.Rid = Orders.Rid
WHERE Orders.Amount > 1000;

-- ii. Display total revenue per restaurant
SELECT Rid, SUM(Amount) AS Total_Revenue
FROM Orders
GROUP BY Rid;

-- iii. Display restaurant with order amount using JOIN
SELECT Restaurant.Rname, Orders.Amount
FROM Restaurant
JOIN Orders ON Restaurant.Rid = Orders.Rid;

-- iv. Display restaurants having revenue above average using Nested Query
SELECT Rname
FROM Restaurant
WHERE Rid IN
(
    SELECT Rid
    FROM Orders
    GROUP BY Rid
    HAVING SUM(Amount) >
    (
        SELECT AVG(Amount)
        FROM Orders
    )
);