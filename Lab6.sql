USE 20220279db;

SELECT * FROM 20220279db.CUSTOMER;
SELECT * FROM 20220279db.SALESMAN;

-- JOIN Quesstions --
SELECT a.Cust_name AS "Customer Name", a.City, b.Name AS "Salesman", b. Commission
FROM CUSTOMER a INNER JOIN SALESMAN b
ON a.Salesman_ID = b.Salesman_ID;

SELECT a.Cust_name AS "Customer Name", a.City, b.Name AS "Salesman", b. Commission
FROM CUSTOMER a INNER JOIN SALESMAN b
ON a.Salesman_ID = b.Salesman_ID
WHERE b.Commission > 0.12;

SELECT a.Cust_name AS "Customer Name", a.City, b.Name AS "Salesman", b. Commission
FROM CUSTOMER a INNER JOIN SALESMAN b
ON a.Salesman_ID = b.Salesman_ID
WHERE b.Commission > 0.12 AND a.City <> b.City;

SELECT *
FROM ORDERS NATURAL JOIN CUSTOMER NATURAL JOIN SALESMAN;

SELECT a.Cust_name, a.City, a.Grade, b.Name AS "Salesman", b. City
FROM CUSTOMER a LEFT JOIN SALESMAN b
ON a.Salesman_Id = b.Salesman_ID
ORDER BY a.Customer_ID;

SELECT *
FROM SALESMAN b
CROSS JOIN CUSTOMER a;

---------------------------------------------------------------------------------------------
-- VIEW Quesstions --
CREATE VIEW SALESMEN_COUNT
AS SELECT Salesman_ID, Name, City
FROM SALESMAN;
SELECT * FROM SALESMEN_COUNT;

CREATE VIEW Salesmen_NY
AS SELECT Salesman_ID, Name, City, Commission
FROM SALESMAN
WHERE SALESMAN.City = "New York";
SELECT * FROM Salesmen_NY;

CREATE VIEW CustomerGrade_COUNT (Grade, Number)
AS SELECT Grade, COUNT(*)
FROM CUSTOMER
GROUP BY Grade;
SELECT * FROM CustomerGrade_COUNT;

CREATE VIEW Data_DateWise(Ord_Date, Counts, Average, Total_Sum)
AS SELECT Ord_Date, COUNT(DISTINCT Customer_ID), ROUND(AVG(Purch_Amt), 2), SUM(ROUND(Purch_Amt, 2))
FROM ORDERS
GROUP BY Ord_Date;
SELECT * FROM Data_DateWise;
DROP VIEW Data_DateWise;

---------------------------------------------------------------------------------------------------------
-- CSV Import --
CREATE TABLE Import_Course( course_id varchar(10), title varchar(20), dept_name varchar(25), credits int);
SELECT * FROM Import_Course;

CREATE TABLE Import_Prereq( course_id varchar(10), prereq_id varchar(20));
SELECT * FROM Import_Prereq;

SELECT *
FROM Import_Course LEFT OUTER JOIN Import_Prereq
-- ON Import_Course.course_id = Import_Prereq.course_id
USING (course_id);

SELECT Import_Prereq.course_id, Import_Course.title, Import_Course.dept_name, Import_Course.credits, Import_Prereq.prereq_id
FROM Import_Course RIGHT OUTER JOIN Import_Prereq
-- ON Import_Course.course_id = Import_Prereq.course_id
USING (course_id);

SELECT Import_Course.course_id, Import_Course.title, Import_Course.dept_name, Import_Course.credits, Import_Prereq.prereq_id
FROM Import_Course LEFT OUTER JOIN Import_Prereq USING (course_id)
UNION
SELECT Import_Course.course_id, Import_Course.title, Import_Course.dept_name, Import_Course.credits, Import_Prereq.prereq_id
FROM Import_Course RIGHT OUTER JOIN Import_Prereq USING (course_id);