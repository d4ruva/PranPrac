-- Question 14: Employee Salary Classification

CREATE TABLE Employee(
Eid INT,
Ename VARCHAR(50),
Salary NUMBER
);

CREATE OR REPLACE FUNCTION Classify_Salary(
sal NUMBER
)
RETURN VARCHAR2
IS
BEGIN
IF sal>=70000 THEN
RETURN 'Class I';
ELSIF sal>=40000 THEN
RETURN 'Class II';
ELSE
RETURN 'Class III';
END IF;
END;
/
