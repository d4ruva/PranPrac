-- Question 11: E-Commerce System

CREATE TABLE Customer(
Cid INT PRIMARY KEY,
Cname VARCHAR(50)
);

CREATE TABLE Orders(
Oid INT PRIMARY KEY,
Cid INT,
FOREIGN KEY(Cid) REFERENCES Customer(Cid)
);

CREATE TABLE OrderItem(
Oid INT,
Pid INT,
Qty INT,
FOREIGN KEY(Oid) REFERENCES Orders(Oid)
);

-- i. Display customers who placed orders
SELECT DISTINCT C.*
FROM Customer C
INNER JOIN Orders O ON C.Cid = O.Cid;

-- ii. Count order items per order
SELECT Oid, COUNT(Pid) AS Item_Count
FROM OrderItem
GROUP BY Oid;

-- iii. Display customer with order details using JOIN
SELECT C.Cname, O.Oid, OI.Qty
FROM Customer C
INNER JOIN Orders O ON C.Cid = O.Cid
INNER JOIN OrderItem OI ON O.Oid = OI.Oid;

-- iv. Display customers placing more than average number of orders using nested query
SELECT Cname
FROM Customer
WHERE Cid IN (
    SELECT Cid
    FROM Orders
    GROUP BY Cid
    HAVING COUNT(Oid) > (
        SELECT AVG(Order_Count)
        FROM (
            SELECT COUNT(Oid) AS Order_Count
            FROM Orders
            GROUP BY Cid
        )
    )
);
