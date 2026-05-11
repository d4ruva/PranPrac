-- Question 16: Fine Calculation

CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Issue(
    Bid INT,
    Mid INT,
    IssueDate DATE,
    ReturnDate DATE,
    Fine INT
);

INSERT INTO Issue VALUES(1,101,'2025-01-01','2025-01-10',NULL);
INSERT INTO Issue VALUES(2,102,'2025-01-01','2025-01-20',NULL);
INSERT INTO Issue VALUES(3,103,'2025-01-01','2025-01-05',NULL);

DELIMITER //
CREATE FUNCTION CalculateFine(
    issue_date DATE,
    return_date DATE
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE fine_amt INT;
    SET days = DATEDIFF(return_date, issue_date);
    IF days > 7 THEN
        SET fine_amt = (days - 7) * 10;
    ELSE
        SET fine_amt = 0;
    END IF;
    RETURN fine_amt;
END //
DELIMITER ;

UPDATE Issue
SET Fine = CalculateFine(IssueDate, ReturnDate);

SELECT * FROM Issue;

SELECT * FROM Issue
WHERE Fine = (SELECT MAX(Fine) FROM Issue);
