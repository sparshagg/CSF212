use 20220279db;

SELECT S.name AS salesman_name, C.cust_name
FROM SALESMAN S
JOIN CUSTOMER C ON C.salesman_id = S.salesman_id;

SELECT C.cust_name 
FROM SALESMAN S
JOIN CUSTOMER C ON C.salesman_id = S.salesman_id
WHERE S.commission > 0.12;

SELECT C.cust_name 
FROM SALESMAN S
JOIN CUSTOMER C ON C.salesman_id = S.salesman_id
WHERE S.commission > 0.12 AND S.city != C.city;

