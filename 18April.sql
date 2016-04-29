CREATE DATABASE things;
--CREATE TABLE Product(
--	maker char(1),
--	model char(4),
--	type varchar(7)
--);

CREATE TABLE Printer(
	code int,
	model char(1) DEFAULT 'n',
	color varchar(7),
	price decimal(36, 2)
);

CREATE TABLE Classes(
	class varchar(50),
	type char(2)
);

ALTER TABLE Classes
ADD bore decimal;

INSERT INTO Classes(class, type, bore) VALUES('of', 'eh', 123);
SELECT * FROM Classes;

ALTER TABLE Printer
DROP COLUMN price;
SELECT * FROM Printer;

