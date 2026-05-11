-- Question 17: Prevent Negative Balance

CREATE DATABASE IF NOT EXISTS AccountDB;
USE AccountDB;

CREATE TABLE IF NOT EXISTS Account(
    Aid INT PRIMARY KEY,
    Balance DECIMAL(10,2)
);

INSERT INTO Account (Aid, Balance) VALUES
(1, 500.00),
(2, 1000.00);

DELIMITER //
CREATE TRIGGER trg_balance
BEFORE UPDATE ON Account
FOR EACH ROW
BEGIN
    IF NEW.Balance < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Negative balance not allowed';
    END IF;
END;//
DELIMITER ;

-- Verify using update statements
UPDATE Account SET Balance = 300.00 WHERE Aid = 1;
-- The following update should fail due to the trigger:
-- UPDATE Account SET Balance = -100.00 WHERE Aid = 2;

-- Display minimum balance
SELECT MIN(Balance) AS Minimum_Balance FROM Account;
