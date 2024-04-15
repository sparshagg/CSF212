-- 1
SELECT *
FROM SALESMAN
WHERE city IN (SELECT city FROM CUSTOMER);

-- 2
SELECT *
FROM ORDERS
WHERE purch_amt > ANY (SELECT purch_amt FROM ORDERS WHERE ord_date = '2012-09-10');

-- 3
SELECT *
FROM ORDERS
WHERE purch_amt < ALL (SELECT purch_amt FROM ORDERS WHERE customer_id IN (SELECT customer_id FROM CUSTOMER WHERE city = 'London'));

-- 4
SELECT *
FROM CUSTOMER
WHERE grade > ALL (SELECT grade FROM CUSTOMER WHERE city = 'New York');

-- 5
SELECT *
FROM CUSTOMER
WHERE grade NOT IN (SELECT grade FROM CUSTOMER WHERE city = 'London');

-- 6
SELECT O.*
FROM ORDERS O
JOIN SALESMAN S ON O.salesman_id = S.salesman_id
WHERE S.name = 'Paul Adam';

-- 7
SELECT *
FROM ORDERS
WHERE salesman_id IN (SELECT salesman_id FROM SALESMAN WHERE city = 'London');

-- 8
SELECT *
FROM ORDERS
WHERE purch_amt > (SELECT AVG(purch_amt) FROM ORDERS WHERE ord_date = '2012-10-10');

-- 9
SELECT DISTINCT S.commission
FROM SALESMAN S
JOIN CUSTOMER C ON S.salesman_id = C.salesman_id
WHERE C.city = 'Paris';

-- 10
SELECT DISTINCT C.*
FROM CUSTOMER C
JOIN ORDERS O ON C.customer_id = O.customer_id
WHERE O.ord_date = '2012-10-05';
