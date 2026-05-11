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

-- To execute and display classifications
DECLARE
    v_class VARCHAR2(10);
BEGIN
    FOR rec IN (SELECT Ename, Salary FROM Employee) LOOP
        v_class := Classify_Salary(rec.Salary);
        DBMS_OUTPUT.PUT_LINE(rec.Ename || ' - Class: ' || v_class);
    END LOOP;
END;
/
