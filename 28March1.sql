--1.
SELECT name, address, title, length
FROM STUDIO JOIN MOVIE
ON name = STUDIONAME
WHERE name LIKE 'M%'AND year > 1980;

--2.
SELECT name, address, movietitle
FROM MOVIESTAR JOIN STARSIN
ON name = STARNAME
JOIN MOVIE
ON MOVIETITLE = TITLE
WHERE name LIKE 'J%' AND YEAR > 1990;

--3.
SELECT MOVIE.title, MOVIE.year, MOVIE.length 
FROM MOVIE 
WHERE LENGTH > 120 OR LENGTH IS NULL
AND YEAR < 2000;

--4.
SELECT name, gender 
FROM MOVIESTAR
WHERE name LIKE 'J%' AND BIRTHDATE > 1948
ORDER BY name DESC;

--5.
SELECT STUDIONAME, COUNT(name)
FROM MOVIE
JOIN STUDIO ON name = STUDIONAME
JOIN STARSIN ON MOVIETITLE = TITLE
GROUP BY STUDIONAME;

--6.
SELECT STARNAME, COUNT(MOVIETITLE)
FROM STARSIN
GROUP BY STARNAME;

--7.
SELECT M.name, M.year, MOVIE.title
FROM
	(SELECT name, MAX(year) AS year
	FROM STUDIO JOIN MOVIE ON STUDIONAME = NAME
	GROUP BY name) AS M
JOIN MOVIE ON M.name = MOVIE.STUDIONAME
AND M.year = MOVIE.year;


--8.
SELECT name FROM MOVIESTAR
WHERE BIRTHDATE = 
			(SELECT MAX(BIRTHDATE)
			 FROM MOVIESTAR
			 WHERE GENDER = 'm');

--9.
SELECT studioname, starname, COUNT(title)
FROM STARSIN JOIN MOVIE ON MOVIETITLE = TITLE
GROUP BY STUDIONAME, STARNAME
HAVING COUNT(title) >= ALL (SELECT COUNT(title) AS COUNT
					FROM STARSIN JOIN MOVIE ON MOVIETITLE = TITLE
					GROUP BY STUDIONAME, STARNAME)

--10.
SELECT starname, MOVIEEXEC.name
FROM MOVIE JOIN MOVIEEXEC ON CERT# = PRODUCERC#
JOIN STARSIN ON MOVIETITLE = TITLE
GROUP BY NETWORTH, MOVIEEXEC.name, STARNAME
HAVING NETWORTH >= (SELECT MAX(NETWORTH) FROM MOVIEEXEC)


--11.
SELECT movietitle, YEAR, COUNT(MOVIETITLE)
FROM MOVIE JOIN STARSIN ON TITLE = MOVIETITLE
GROUP BY MOVIETITLE, YEAR
HAVING COUNT(MOVIETITLE) > 2;