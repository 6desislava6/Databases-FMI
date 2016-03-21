--1.
SELECT AVG(SPEED) AS AvgSpeed
FROM pc;

--2.
SELECT maker, AVG(screen) as AvgScreen FROM laptop
JOIN product ON laptop.model = product.model
GROUP BY maker;

--3.
SELECT AVG(SPEED) AS AvgSpeed
FROM laptop
WHERE price > 1000;

--4.
SELECT AVG(price) AS AvgPrice 
FROM pc 
JOIN product ON product.model = pc.model
WHERE maker = 'A';

--5.
SELECT A.maker, A.AvgPrice
FROM
(SELECT maker, AVG(price) AS AvgPrice
FROM 
((SELECT model, price FROM laptop)
UNION
(SELECT model, price FROM pc)) AS U
JOIN product ON U.model = product.model
GROUP BY maker) AS A
WHERE maker = 'B';

--6.
SELECT speed, AVG(price) AS AvgPrice
FROM pc
GROUP BY speed;

--7.
SELECT maker, count(model) AS CNT
FROM product
GROUP BY maker
HAVING count(model) >= 3;

SELECT * FROM product;

--8.
SELECT A.maker, A.price
FROM
	(SELECT maker, max(price) as price
	FROM product
	JOIN pc on pc.model = product.model
	GROUP BY maker) AS A
WHERE A.price >= ALL (SELECT max(price) as price
	FROM product
	JOIN pc on pc.model = product.model
	GROUP BY maker);

--9.
SELECT speed, AVG(price) AS AvgPrice
FROM pc
GROUP BY speed
HAVING speed > 800;

--10.
SELECT AVG(hd) AS AvgHDD 
FROM pc 
JOIN product ON product.model = pc.model
WHERE maker IN
	(SELECT maker type 
	FROM product
	WHERE type = 'printer')

SELECT * FROM laptop;