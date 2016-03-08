--1.
SELECT maker
FROM product
WHERE model IN
(SELECT model FROM PC
WHERE speed > 500);

--2.
SELECT code, model, price
FROM printer
WHERE price >= ALL (SELECT price
					FROM printer);

--3.
SELECT code, model, speed, ram, hd, price, screen
FROM laptop
WHERE speed <= ALL (SELECT speed FROM laptop);


--4.
SELECT R.model, R.price 
FROM
(((SELECT model, price FROM laptop)
UNION
(SELECT model, price FROM pc))
UNION
(SELECT model, price FROM printer)) as R
WHERE R.price >= ALL (((SELECT price FROM laptop)
UNION
(SELECT price FROM pc))
UNION
(SELECT price FROM printer));

--5.
SELECT maker
FROM product
WHERE model IN
(SELECT model FROM
printer
WHERE color = 'y' AND
price <= ALL (SELECT price FROM printer WHERE color = 'y')) 

--6.
SELECT maker
FROM product, (SELECT ram, speed 
				FROM 
				((SELECT ram, speed FROM pc
				WHERE ram <= ALL (SELECT ram FROM pc)) as B
				WHERE speed >= ALL 
				(SELECT speed FROM pc
				WHERE ram <= ALL (SELECT ram FROM pc)))) 
