DROP TABLE IF EXISTS BUSES;
DROP TABLE IF EXISTS conductores;
DROP TABLE IF EXISTS lineas;
DROP TABLE IF EXISTS paradas;
DROP TABLE IF EXISTS paradas_linea;
DROP table if exists Bonos;


create table BUSES (
	id_bus		integer primary key,
	modelo		varchar(10),
	matricula	text
);



create table conductores (
	ID_conductor 	integer primary key,
	Nombre		varchar(10) not null,
	DNI			varchar(10)
);



create table lineas (
	id_linea	integer primary key,
	id_bus		Dom_Id not null references BUSES(id_bus),
	id_conductor	Dom_Id not null references CONDUCTORES(id_conductor),
	numparadas	smallint  default 0
);




create table paradas (
	ID_parada	integer primary key,
	nombre		varchar(10)
);




create table paradas_linea (
	ID_parada	integer not null references paradas,
	ID_linea	integer not null references lineas,
	primary key (id_parada,id_linea)
);




INSERT INTO Conductores (id_conductor,Nombre,DNI) VALUES(101,'Pepe',	'1111111');
INSERT INTO Conductores (id_conductor,Nombre,DNI) VALUES(102,'Marta','1093992');
INSERT INTO Conductores (id_conductor,Nombre,DNI) VALUES(103,'Luis','22222222');
INSERT INTO Conductores (id_conductor,Nombre,DNI) VALUES(104,'Ana','1092994');
INSERT INTO Conductores (id_conductor,Nombre,DNI) VALUES(105,'Paloma','1034995');

INSERT INTO Buses (ID_bus,modelo, matricula) VALUES(1,'Liebre', '1234ABC');
INSERT INTO Buses (ID_bus,modelo, matricula) VALUES(2,'Tortuga', '2460BCD');
INSERT INTO Buses (ID_bus,modelo, matricula) VALUES(3,'Gacela', '5678CDE');
INSERT INTO Buses (ID_bus,modelo, matricula) VALUES(4,'Caracol', '4321ABC');
INSERT INTO Buses (ID_bus,modelo, matricula) VALUES(5,'Liebre', '8765ABC');

INSERT INTO lineas (id_linea, id_conductor, ID_bus, numparadas) VALUES(11, 101,1,1);
INSERT INTO lineas (id_linea, id_conductor, ID_bus, numparadas) VALUES(21,101,2,2);
INSERT INTO lineas (id_linea, id_conductor, ID_bus) VALUES(31,101,4);
INSERT INTO lineas (id_linea, id_conductor, ID_bus) VALUES(41,102,1);
INSERT INTO lineas (id_linea, id_conductor, ID_bus, numparadas) VALUES(51,105,3,2);
INSERT INTO lineas (id_linea, id_conductor, ID_bus, numparadas) VALUES(61,103,1,2);

INSERT INTO Paradas (ID_parada, nombre) VALUES(111,'La Vall');
INSERT INTO Paradas (ID_parada, nombre) VALUES(222,'Nules');
INSERT INTO Paradas (ID_parada, nombre) VALUES(333,'Moncofar');
INSERT INTO Paradas (ID_parada, nombre) VALUES(444,'Burriana');
INSERT INTO Paradas (ID_parada, nombre) VALUES(555,'Almenara');
INSERT INTO Paradas (ID_parada, nombre) VALUES(666,'Chilches');
INSERT INTO Paradas (ID_parada, nombre) VALUES(777,'Mascarell');


INSERT INTO Paradas_Linea (ID_parada, id_linea) VALUES(111, 11);
INSERT INTO Paradas_Linea (ID_parada, id_linea) VALUES(222, 21);
INSERT INTO Paradas_Linea (ID_parada, id_linea) VALUES(333, 21);
INSERT INTO Paradas_Linea (ID_parada, id_linea) VALUES(444, 61);
INSERT INTO Paradas_Linea (ID_parada, id_linea) VALUES(555, 61);
INSERT INTO Paradas_Linea (ID_parada, id_linea) VALUES(666, 51);
INSERT INTO Paradas_Linea (ID_parada, id_linea) VALUES(777, 51);

