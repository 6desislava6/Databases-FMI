CREATE TABLE Users(
	id INT IDENTITY(10,10),
	email varchar(60),
	password varchar(20),
	registerDate datetime DEFAULT getdate()
);
CREATE TABLE FRIENDS(
	fisrtFriend INT,
	secondFriend INT
);

CREATE TABLE Walls(
	userId int,
	userIdWriter int,
	dateWritten datetime
	);
CREATE TABLE Groups(
	id int IDENTITY(1,1),
	name varchar(60),
	description varchar(360) DEFAULT ''
	);


CREATE TABLE GroupMembers(
	groupNum int,
	userNum int
);

