--1.
SELECT PRODUCT.MAKER, LAPTOP.SPEED
FROM LAPTOP
JOIN product ON	 product.model = laptop.model
WHERE HD >= 9;

--2.
SELECT product.model, price
FROM PRODUCT 
JOIN
	((SELECT model, price FROM laptop)
	UNION (SELECT printer.model, printer.price FROM printer)
	UNION (SELECT pc.model, pc.price FROM pc)) AS R
ON product.model = R.model
WHERE maker = 'B';

--3.
SELECT HD FROM (SELECT DISTINCT CODE FROM PC) as A JOIN PC as B ON A.code = B.code
GROUP BY HD
HAVING COUNT(HD) >= 2;

--4.
SELECT A.model, B.model FROM PC as A, PC as B
WHERE A.RAM = B.RAM AND A.SPEED = B.speed AND A.model < B.model;

--5.
SELECT MAKER FROM PRODUCT
JOIN PC ON PC.model = PRODUCT.model
WHERE SPEED > 400
GROUP BY MAKER
HAVING COUNT(MAKER) >= 2;