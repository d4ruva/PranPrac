-- Question 23: Online Shopping System Views

CREATE DATABASE ShoppingDB;
USE ShoppingDB;

CREATE TABLE Customer(
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders(
    Oid INT PRIMARY KEY,
    Cid INT,
    Amount INT,
    FOREIGN KEY (Cid) REFERENCES Customer(Cid)
);

INSERT INTO Customer VALUES(1,'Pranav','Pune');
INSERT INTO Customer VALUES(2,'Rahul','Mumbai');
INSERT INTO Customer VALUES(3,'Sneha','Nashik');

INSERT INTO Orders VALUES(101,1,5000);
INSERT INTO Orders VALUES(102,1,3000);
INSERT INTO Orders VALUES(103,2,7000);
INSERT INTO Orders VALUES(104,3,4000);

-- i. Create simple view
CREATE VIEW CustomerView AS
SELECT * FROM Customer;

-- ii. Display data using view
SELECT * FROM CustomerView;

-- iii. Create join view
CREATE VIEW CustomerOrderView AS
SELECT Customer.Cname, Orders.Amount
FROM Customer
JOIN Orders
ON Customer.Cid = Orders.Cid;

-- iv. Display combined data
SELECT * FROM CustomerOrderView;

-- v. Create aggregate view
CREATE VIEW TotalPurchaseView AS
SELECT Cid, SUM(Amount) AS TotalPurchase
FROM Orders
GROUP BY Cid;

-- vi. Find customer with highest purchase
SELECT *
FROM TotalPurchaseView
WHERE TotalPurchase = 
(SELECT MAX(TotalPurchase) FROM TotalPurchaseView);