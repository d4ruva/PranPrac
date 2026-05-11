-- Question 9: College Management System

CREATE TABLE Department(
DeptId INT PRIMARY KEY,
DeptName VARCHAR(50)
);

CREATE TABLE Student(
Sid INT PRIMARY KEY,
Sname VARCHAR(50),
DeptId INT,
FOREIGN KEY(DeptId) REFERENCES Department(DeptId)
);

CREATE TABLE Result(
Sid INT,
Marks INT,
FOREIGN KEY(Sid) REFERENCES Student(Sid)
);

SELECT * FROM Result WHERE Marks>60;

-- ii. Display department-wise average marks
SELECT D.DeptName, AVG(R.Marks) AS Average_Marks
FROM Department D
INNER JOIN Student S ON D.DeptId = S.DeptId
INNER JOIN Result R ON S.Sid = R.Sid
GROUP BY D.DeptId, D.DeptName;

-- iii. Display student with department and marks using JOIN
SELECT S.Sname, D.DeptName, R.Marks
FROM Student S
INNER JOIN Department D ON S.DeptId = D.DeptId
INNER JOIN Result R ON S.Sid = R.Sid;

-- iv. Display students scoring above department average using nested query
SELECT Sname
FROM Student S
WHERE EXISTS (
    SELECT 1
    FROM Result R
    WHERE R.Sid = S.Sid
    AND R.Marks > (
        SELECT AVG(R2.Marks)
        FROM Result R2
        INNER JOIN Student S2 ON R2.Sid = S2.Sid
        WHERE S2.DeptId = S.DeptId
    )
);

-- v. Write a cursor to display student names and marks
DECLARE
    CURSOR cur_students IS
        SELECT S.Sname, R.Marks
        FROM Student S
        INNER JOIN Result R ON S.Sid = R.Sid;
    v_name Student.Sname%TYPE;
    v_marks Result.Marks%TYPE;
BEGIN
    OPEN cur_students;
    LOOP
        FETCH cur_students INTO v_name, v_marks;
        EXIT WHEN cur_students%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Marks: ' || v_marks);
    END LOOP;
    CLOSE cur_students;
END;
/
