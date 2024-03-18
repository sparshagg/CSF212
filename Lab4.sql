SELECT DISTINCT S.* 
FROM SALESMAN S 
JOIN CUSTOMER C ON S.city = C.city;

SELECT * 
FROM ORDERS 
WHERE purch_amt > (SELECT MIN(purch_amt) FROM ORDERS WHERE ord_date = '2012-09-10');

SELECT O.* 
FROM ORDERS O 
WHERE O.purch_amt < (SELECT MIN(C.grade) FROM CUSTOMER C WHERE C.city = 'London');

SELECT * 
FROM CUSTOMER 
WHERE grade > (SELECT MAX(grade) FROM CUSTOMER WHERE city = 'New York');

SELECT * 
FROM CUSTOMER 
WHERE grade NOT IN (SELECT grade FROM CUSTOMER WHERE city = 'London');

SELECT O.* 
FROM ORDERS O 
JOIN SALESMAN S ON O.salesman_id = S.salesman_id 
WHERE S.name = 'Paul Adam';

SELECT O.* 
FROM ORDERS O 
JOIN SALESMAN S ON O.salesman_id = S.salesman_id 
WHERE S.city = 'London';

SELECT * 
FROM ORDERS 
WHERE purch_amt > (SELECT AVG(purch_amt) FROM ORDERS WHERE ord_date = '2012-10-10');

SELECT DISTINCT S.commission 
FROM SALESMAN S 
JOIN CUSTOMER C ON S.salesman_id = C.salesman_id 
WHERE C.city = 'Paris';

SELECT DISTINCT C.* 
FROM CUSTOMER C 
JOIN ORDERS O ON C.customer_id = O.customer_id 
WHERE O.ord_date = '2012-10-05';
