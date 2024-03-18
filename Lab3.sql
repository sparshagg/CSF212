CREATE TABLE SALESMAN (
    salesman_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);

CREATE TABLE CUSTOMER (
    customer_id INT,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

CREATE TABLE ORDERS (
    ord_no INT,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO SALESMAN VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'Rome', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO CUSTOMER VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 200, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007);

INSERT INTO ORDERS VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

SELECT C.cust_name, S.name, S.city 
FROM CUSTOMER C, SALESMAN S 
WHERE C.city = S.city;

SELECT C.cust_name, S.name AS salesman_name 
FROM CUSTOMER C 
JOIN SALESMAN S ON C.salesman_id = S.salesman_id;

SELECT O.* 
FROM ORDERS O 
JOIN CUSTOMER C ON O.customer_id = C.customer_id 
JOIN SALESMAN S ON O.salesman_id = S.salesman_id 
WHERE C.city <> S.city;

SELECT O.ord_no, C.cust_name 
FROM ORDERS O 
JOIN CUSTOMER C ON O.customer_id = C.customer_id;

SELECT C.cust_name, C.grade 
FROM CUSTOMER C 
JOIN ORDERS O ON C.customer_id = O.customer_id 
JOIN SALESMAN S ON C.salesman_id = S.salesman_id 
WHERE C.grade IS NOT NULL AND S.city IS NOT NULL 
ORDER BY C.grade DESC;

SELECT C.cust_name, C.city, S.name AS salesman_name, S.commission 
FROM CUSTOMER C 
JOIN SALESMAN S ON C.salesman_id = S.salesman_id 
WHERE S.commission BETWEEN 0.12 AND 0.14;

SELECT O.ord_no, C.cust_name, S.commission, (O.purch_amt * S.commission) AS earned_commission 
FROM ORDERS O 
JOIN CUSTOMER C ON O.customer_id = C.customer_id 
JOIN SALESMAN S ON O.salesman_id = S.salesman_id 
WHERE C.grade >= 200;

SELECT * 
FROM CUSTOMER 
WHERE grade > 100;

SELECT * 
FROM CUSTOMER 
WHERE city = 'New York' AND grade > 100;

SELECT * 
FROM CUSTOMER 
WHERE city = 'New York' OR grade > 100;

SELECT * 
FROM CUSTOMER 
WHERE city <> 'New York' AND grade <= 100;

SELECT * 
FROM ORDERS 
WHERE (ord_date <> '2012-09-10' AND salesman_id <= 5005) OR purch_amt <= 1000.00;
