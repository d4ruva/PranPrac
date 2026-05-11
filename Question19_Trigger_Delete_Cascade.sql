-- Question 19: Delete Cascade

CREATE DATABASE IF NOT EXISTS OrderDB;
USE OrderDB;

CREATE TABLE IF NOT EXISTS Product(
    Pid INT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Orders(
    Oid INT PRIMARY KEY,
    Pid INT,
    FOREIGN KEY (Pid) REFERENCES Product(Pid)
);

INSERT INTO Product (Pid) VALUES (1), (2);
INSERT INTO Orders (Oid, Pid) VALUES
(101, 1),
(102, 1),
(103, 2);

DELIMITER //
CREATE TRIGGER trg_delete_cascade
BEFORE DELETE ON Product
FOR EACH ROW
BEGIN
    DELETE FROM Orders WHERE Pid = OLD.Pid;
END;//
DELIMITER ;

-- Verify deletion
DELETE FROM Product WHERE Pid = 1;

-- Count remaining orders
SELECT COUNT(*) AS Remaining_Orders FROM Orders;
