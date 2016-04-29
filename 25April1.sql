CREATE TABLE BATTLES (
 NAME VARCHAR(20) NOT NULL ,
 DATE DATETIME NOT NULL
);
CREATE TABLE CLASSES(
 CLASS VARCHAR(50) NOT NULL ,
 TYPE VARCHAR(2) NOT NULL ,
 COUNTRY VARCHAR (20) NOT NULL ,
 NUMGUNS INT, 
 BORE REAL, 
 DISPLACEMENT INT
);

CREATE TABLE SHIPS(
 NAME VARCHAR(50) NOT NULL ,
 CLASS VARCHAR(50) NOT NULL ,
 LAUNCHED INT
);

CREATE TABLE OUTCOMES(
 SHIP VARCHAR(50) NOT NULL ,
 BATTLE VARCHAR(20) NOT NULL ,
 RESULT VARCHAR(10) NOT NULL 
);

ALTER TABLE CLASSES
ADD PRIMARY KEY(class);

ALTER TABLE SHIPS
ADD PRIMARY KEY(name);

ALTER TABLE OUTCOMES
ADD PRIMARY KEY(ship, battle);

ALTER TABLE BATTLES
ADD PRIMARY KEY(name);

--ALTER TABLE BATTLES
--DROP CONSTRAINT PK__BATTLES__88363D0D73DFB7CB;

ALTER TABLE SHIPS
ADD FOREIGN KEY(class) REFERENCES Classes(class);

ALTER TABLE OUTCOMES
ADD FOREIGN KEY(ship) REFERENCES Ships(name);

ALTER TABLE OUTCOMES
ADD FOREIGN KEY(battle) REFERENCES Battles(name);

insert into classes values ('Bismarck','bb','Germany',8,15,42000),
('Iowa','bb','USA',9,16,46000),
('Kongo','bc','Japan',8,14,32000),
('North Carolina','bb','USA',12,16,37000),
('Renown','bc','Gt.Britain',6,15,32000),
('Revenge','bb','Gt.Britain',8,15,29000),
('Tennessee','bb','USA',12,14,32000),
('Yamato','bb','Japan',9,18,65000);insert into battles values ('Guadalcanal','19421115 00:00:00.000'),
('North Atlantic','19410525 00:00:00.000'),
('North Cape','19431226 00:00:00.000'),
('Surigao Strait','19441025 00:00:00.000');insert into ships values ('California','Tennessee',1921),
('Haruna','Kongo',1916),
('Hiei','Kongo',1914),
('Iowa','Iowa',1943),
('Kirishima','Kongo',1915),
('Kongo','Kongo',1913),
('Missouri','Iowa',1944),
('Musashi','Yamato',1942),
('New Jersey','Iowa',1943),
('North Carolina','North Carolina',1941),
('Ramillies','Revenge',1917),
('Renown','Renown',1916),
('Repulse','Renown',1916),
('Resolution','Renown',1916),
('Revenge','Revenge',1916),
('Royal Oak','Revenge',1916),
('Royal Sovereign','Revenge',1916),
('Tennessee','Tennessee',1920),
('Washington','North Carolina',1941),
('Wisconsin','Iowa',1944),
('Yamato','Yamato',1941),
('South Dakota','North Carolina',1941);

insert into outcomes values ('California','Surigao Strait','ok'),
 ('Kirishima','Guadalcanal','sunk'),
 ('South Dakota','Guadalcanal','damaged'),
 ('Tennessee','Surigao Strait','ok'),
 ('Washington','Guadalcanal','ok'),
('California','Guadalcanal','damaged');--ALTER TABLE Merchant_Pending_Functions ALTER COLUMN NumberOfLocations INT NULLUPDATE SHIPSSET LAUNCHED = 1927WHERE CLASS = 'Kongo';UPDATE CLASSESSET BORE = 16, DISPLACEMENT = 34000WHERE CLASS = 'Kongo';