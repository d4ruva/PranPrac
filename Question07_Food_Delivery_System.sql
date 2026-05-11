-- Question 7: Food Delivery System

CREATE TABLE Restaurant(
Rid INT PRIMARY KEY,
Rname VARCHAR(50)
);

CREATE TABLE Orders(
Oid INT PRIMARY KEY,
Rid INT,
Amount DECIMAL(10,2),
FOREIGN KEY(Rid) REFERENCES Restaurant(Rid)
);

-- i. Display restaurants having orders above 1000
SELECT DISTINCT R.Rname
FROM Restaurant R
INNER JOIN Orders O ON R.Rid = O.Rid
WHERE O.Amount > 1000;

-- ii. Display total revenue per restaurant
SELECT R.Rname, SUM(O.Amount) AS Total_Revenue
FROM Restaurant R
INNER JOIN Orders O ON R.Rid = O.Rid
GROUP BY R.Rid, R.Rname;

-- iii. Display restaurant with order amount using JOIN
SELECT R.Rname, O.Amount
FROM Restaurant R
INNER JOIN Orders O ON R.Rid = O.Rid;

-- iv. Display restaurants having revenue above average using nested query
SELECT Rname
FROM Restaurant
WHERE Rid IN (
    SELECT Rid
    FROM Orders
    GROUP BY Rid
    HAVING SUM(Amount) > (
        SELECT AVG(Sum_Amount)
        FROM (
            SELECT SUM(Amount) AS Sum_Amount
            FROM Orders
            GROUP BY Rid
        )
    )
);
