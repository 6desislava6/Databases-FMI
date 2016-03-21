--1.
SELECT MAKER, MODEL, TYPE FROM product
EXCEPT
((SELECT product.MAKER, product.MODEL, product.TYPE FROM 
product JOIN laptop ON product.model = laptop.model)
UNION
(SELECT product.MAKER, product.MODEL, product.TYPE FROM 
product JOIN pc ON product.model = pc.model)
UNION
(SELECT product.MAKER, product.MODEL, product.TYPE FROM 
product JOIN printer ON product.model = printer.model))


--2.
SELECT result.maker
FROM 
((SELECT maker FROM product
JOIN laptop ON laptop.model = product.model)
INTERSECT
(SELECT maker FROM product
JOIN printer ON printer.model = product.model)) AS result

--3.
SELECT result.hd FROM
(SELECT l1.hd, count(l1.hd) as count FROM laptop as l1
JOIN laptop as l2
ON l1.HD = l2.HD
GROUP BY l1.hd) AS result
WHERE count >= 2;

--4.
SELECT * FROM product
WHERE type = 'PC'
AND maker is NULL;


