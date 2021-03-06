---SELECT name FROM MOVIE JOIN MOVIEEXEC ON PRODUCERC# = CERT# WHERE TITLE = 'Star Wars';
---SELECT studioname, title, year FROM Movie
---JOIN STARSIN ON (Movie.TITLE = STARSIN.MOVIETITLE AND MOVIE.YEAR = STARSIN.MOVIEYEAR)
---JOIN MOVIESTAR ON (MOVIESTAR.NAME = STARSIN.STARNAME);


--1.
SELECT MOVIESTAR.name 
FROM MOVIESTAR	
JOIN STARSIN ON STARSIN.STARNAME = MOVIESTAR.name
JOIN MOVIE ON STARSIN.MOVIETITLE = MOVIE.TITLE
WHERE MOVIE.TITLE = 'Terms of Endearment' AND GENDER = 'M';

--2.
SELECT MOVIESTAR.name 
FROM MOVIESTAR	
JOIN STARSIN ON STARSIN.STARNAME = MOVIESTAR.name
JOIN MOVIE ON STARSIN.MOVIETITLE = MOVIE.TITLE
JOIN STUDIO ON STUDIO.NAME = MOVIE.STUDIONAME
WHERE STUDIO.NAME = 'MGM' AND MOVIE.YEAR = 1995;

--3.
SELECT DISTINCT MOVIEEXEC.NAME
FROM MOVIEEXEC
JOIN MOVIE ON MOVIE.PRODUCERC# = MOVIEEXEC.CERT#
JOIN STUDIO ON STUDIONAME = STUDIO.NAME
WHERE STUDIO.NAME = 'MGM';

--4.
SELECT TITLE
FROM MOVIE
WHERE LENGTH > (SELECT LENGTH FROM MOVIE WHERE TITLE = 'Star Wars');

--4a.
SELECT TITLE
FROM MOVIE as b
JOIN (SELECT LENGTH FROM MOVIE WHERE TITLE = 'Star Wars') as A ON b.LENGTH > a.LENGTH;
--5.
SELECT NAME
FROM MOVIEEXEC
WHERE NETWORTH > (SELECT NETWORTH FROM MOVIEEXEC WHERE NAME = 'Merv Griffin');

--6.
SELECT MOVIE.TITLE
FROM MOVIE
JOIN MOVIEEXEC ON MOVIE.PRODUCERC# = MOVIEEXEC.CERT#
WHERE NETWORTH > (SELECT NETWORTH FROM MOVIEEXEC WHERE NAME = 'Merv Griffin');


