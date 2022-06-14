CREATE DATABASE InstitutoTich

use InstitutoTich
GO
EXEC sp_changedbowner 'sa'

CREATE TABLE Estados(
id smallint primary key NOT NULL identity,
nombre varchar(100) NULL);



CREATE TABLE EstatusAlumno(
id smallint PRIMARY KEY NOT NULL identity,
clave CHAR(10) NOT NULL,
nombre VARCHAR(100) NOT NULL);

CREATE TABLE CatCursos(
id smallint PRIMARY KEY IDENTITY NOT NULL,
clave VARCHAR(15) NOT NULL,
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(1000) null,
horas tinyint NOT NULL,
idprerequisito smallint null,   /*      FOREIGN KEY ?????*/
activo bit NOT NULL,
FOREIGN KEY (idprerequisito) REFERENCES CatCursos(id));

CREATE TABLE Cursos(
id smallint PRIMARY KEY IDENTITY NOT NULL,
idcatcurso smallint NULL, 
fechainicio DATE NULL,
fechatermino DATE NULL,
activo bit NULL
FOREIGN KEY (idcatcurso) REFERENCES CatCursos(id));

CREATE TABLE ALUMNOS (
id int PRIMARY KEY IDENTITY,
nombre VARCHAR (60) NOT NULL,
primerApellido VARCHAR (50) NOT NULL,
segundoApellido VARCHAR (50) NULL,
correo VARCHAR (80) NOT NULL,
telefono NCHAR (10) NOT NULL,
fechaNacimiento DATE NOT NULL,
curp CHAR(18) NOT NULL,
sueldo DECIMAL(9,2) NULL,
idestadoorigen smallint NOT NULL,
idEstatus smallint NOT NULL,
FOREIGN KEY (idestadoorigen) REFERENCES Estados(id),
FOREIGN KEY (idEstatus) REFERENCES EstatusAlumno(id));  

CREATE TABLE instructores(
id smallint PRIMARY KEY IDENTITY NOT NULL,
nombre VARCHAR (60) NOT NULL,
primerApellido VARCHAR (50) NOT NULL,
segundoApellido VARCHAR (50) NULL,
correo VARCHAR (80) NOT NULL,
telefono NCHAR (10) NOT NULL,
fechaNacimiento DATE NOT NULL,
RFC CHAR(13) NOT NULL,
curp CHAR(18) NOT NULL,
cuotaHora DECIMAL(9,2) NOT NULL,
activo bit NOT NULL);

CREATE TABLE CursosInstructores(
id int PRIMARY KEY IDENTITY NOT NULL,
IdCurso smallint NOT NULL,  /**/
IdIstructor smallint NOT NULL,	/**/
fechaContratacion DATE NOT NULL,
FOREIGN KEY (IdCurso) REFERENCES Cursos(id),
FOREIGN KEY (IdIstructor) REFERENCES instructores(id));



CREATE TABLE CursosAlumnos(
id int PRIMARY KEY IDENTITY NOT NULL,
IdCurso smallint NOT NULL ,   /*     		*/
idalumno int NOT NULL,   /*			*/
fechaInscripcion date NOT NULL,
fechaBaja DATE NOT NULL,
calificacion tinyint NOT NULL,
FOREIGN KEY (IdCurso) REFERENCES CURSOS(id),
FOREIGN KEY (idalumno) REFERENCES ALUMNOS(id));


 

CREATE TABLE AlumnosBaja(
id int PRIMARY KEY IDENTITY NOT NULL,
nombre VARCHAR(60) NOT NULL,
primerApellido VARCHAR(50) NOT NULL,
segundoApellido VARCHAR(50) NULL,
fechaBaja datetime NOT NULL);



/*----------------------------------------------------INSERCION DE DATOS---------------------------------------------------------------------------------*/ÇÇÇUSE InstitutoTich

SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([id], [nombre]) VALUES (1, N'Aguascalientes')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (2, N'Baja California')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (3, N'Baja California Sur')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (4, N'Campeche')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (5, N'Chihuahua')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (6, N'Chiapas')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (7, N'Coahuila')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (8, N'Colima')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (9, N'Durango')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (10, N'Guanajuato')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (11, N'Guerrero')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (12, N'Hidalgo')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (13, N'Jalisco')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (14, N'México')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (15, N'Michoacán')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (16, N'Morelos')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (17, N'Nayarit')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (18, N'Nuevo León')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (19, N'Oaxaca')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (20, N'Puebla')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (21, N'Querétaro')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (22, N'Quintana Roo')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (23, N'San Luis Potosí')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (24, N'Sinaloa')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (25, N'Sonora')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (26, N'Tabasco')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (27, N'Tamaulipas')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (28, N'Tlaxcala')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (29, N'Veracruz')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (30, N'Yucatán')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (31, N'Zacatecas')

SET IDENTITY_INSERT [dbo].[Estados] OFF
SELECT * FROM ESTADOS;



USE InstitutoTich
SET IDENTITY_INSERT [dbo].[EstatusAlumno] ON 
INSERT [dbo].[EstatusAlumno] ([id], [Clave], [Nombre]) VALUES (1, N'PTO       ', N'Prospecto')
INSERT [dbo].[EstatusAlumno] ([id], [Clave], [Nombre]) VALUES (2, N'PRO       ', N'En curso propedéutico')
INSERT [dbo].[EstatusAlumno] ([id], [Clave], [Nombre]) VALUES (3, N'CAP       ', N'En capacitación')
INSERT [dbo].[EstatusAlumno] ([id], [Clave], [Nombre]) VALUES (4, N'INC       ', N'En Incursión')
INSERT [dbo].[EstatusAlumno] ([id], [Clave], [Nombre]) VALUES (5, N'LAB       ', N'Laborando')
INSERT [dbo].[EstatusAlumno] ([id], [Clave], [Nombre]) VALUES (6, N'LIB       ', N'Liberado')
INSERT [dbo].[EstatusAlumno] ([id], [Clave], [Nombre]) VALUES (7, N'NI        ', N'No le interesó')
INSERT [dbo].[EstatusAlumno] ([id], [Clave], [Nombre]) VALUES (8, N'BA        ', N'Baja')

SET IDENTITY_INSERT [dbo].[EstatusAlumno] OFF 
SELECT * FROM EstatusAlumno;


INSERT [dbo].CatCursos] ([id], [Clave], [Nombre], [descripcion], [horas], [idprerequisito], [activo]) VALUES (1, N'JCT', 'PROGRAMACION','MUCHO',145,1,1);

INSERT INTO CatCursos VALUES ('JCT', 'PROGRAMACION','MUCHO',145,null,1);
INSERT INTO CatCursos VALUES ('IA', 'INTELIGENCIA ARTIFICIAL','...',200,null,1);
INSERT INTO CatCursos VALUES ('RD', 'REDES','...',100,null,1);
INSERT INTO CatCursos VALUES ('MVC', 'MODELO VISTA CONTROLADOR','...',150,null,1);
INSERT INTO CatCursos VALUES ('C', 'C SHARP','...',150,null,1);
INSERT INTO CatCursos VALUES ('NT', '.NET','...',150,null,1);
SELECT * FROM CatCursos;
/*DELETE from catcursos;*/

INSERT INTO Cursos VALUES (14,'01-01-2022', '02-02-2022',1);
INSERT INTO Cursos VALUES (15,'02-02-2022', '03-03-2022',1);
INSERT INTO Cursos VALUES (16,'03-03-2022', '04-04-2022',1);
INSERT INTO Cursos VALUES (17,'04-04-2022', '05-05-2022',1);
INSERT INTO Cursos VALUES (18,'05-05-2022', '06-06-2022',1);
INSERT INTO Cursos VALUES (19,'06-06-2022', '07-07-2022',1);
SELECT * FROM Cursos;
/*DELETE from cursos;*/


INSERT INTO ALUMNOS VALUES ('JESUS','CORDERO','TORRES','j@gmail.com',5540677545,'23-12-1999','COTJ231299HCMRS09',20000,14,3);
INSERT INTO ALUMNOS VALUES ('Luis','A','T','luis@gmail.com',5548789562,'01-05-1995','LJCD010595HCMRS09',20000,19,3);
INSERT INTO ALUMNOS VALUES ('Elmer','D','J','elmer@gmail.com',5545896523,'01-05-1995','ELDJ010595HCMRS09',20000,8,3);
INSERT INTO ALUMNOS VALUES ('Ricardo','H','G','rich@gmail.com',55478954,'04-12-1999','RIHG010595HCMRS09',20000,2,3);
INSERT INTO ALUMNOS VALUES ('Severo','F','F','severo@gmail.com',55412563,'09-05-1998','SEFF010595HCMRS09',20000,3,3);
INSERT INTO ALUMNOS VALUES ('Guz','S','K','guz@gmail.com',55498765,'07-07-1997','GUSKD010595HCMRS09',20000,12,3);
SELECT * FROM ALUMNOS;



INSERT INTO instructores VALUES ('Xavier','I','C','xavi@gmail.com',5548796321,'25-10-1990','XAIC251090S91','XAIC251090HCMRS01',500,1);
INSERT INTO instructores VALUES ('Valeria','G','S','val@gmail.com',5548965874,'03-05-1998','VAGS030590S98','XAIC251090HCMRS01',200,1);
INSERT INTO instructores VALUES ('Oscar','A','R','oscar@gmail.com',5541236548,'08-12-1985','OSAR081585S23','XAIC251090HCMRS01',500,1);
INSERT INTO instructores VALUES ('Jorge','F','B','jorge@gmail.com',5521458795,'06-12-1988','JOFB061288S91','XAIC251090HCMRS01',200,1);

SELECT * FROM instructores;
/*delete from instructores;*/

USE [InstitutoTich]
GO
SET IDENTITY_INSERT [dbo].[Instructores] ON 

INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (1, N'Oscar', N'López', N'Osorio', N'olopez@ti-capitalhumano.com', N'7226181450', CAST(N'1984-08-03' AS Date), N'LOOO840803S08', N'LOOO840803HMCPSS08', CAST(110.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (2, N'Jorge', N'Valdivia', N'Rosas', N'jvaldivia@ti-capitalhumano.com', N'5561040510', CAST(N'1964-01-26' AS Date), N'VARJ640126R00', N'VARJ640126HDFLSR00', CAST(100.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (3, N'Luis', N'Vázquez', N'Cuj', N'luisvazquez@ti-capitalhumano.com', N'5540612941', CAST(N'1974-10-11' AS Date), N'VACL741011JS5', N'VACL741011HTCZJS05', CAST(80.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (4, N'José', N'Morales', N'Narváez', N'jose.morales@ti-capitalhumano.com', N'5511506288', CAST(N'1984-12-31' AS Date), N'MONM941231N07', N'MONM941231HCCRRN07', CAST(70.00 AS Decimal(9, 2)), 1)
SET IDENTITY_INSERT [dbo].[Instructores] OFF
GO







INSERT INTO CursosAlumnos VALUES (27,1,'2021-12-30','2021-02-02',10);
INSERT INTO CursosAlumnos VALUES (28,2,'2022-01-01','2021-03-03',10);
INSERT INTO CursosAlumnos VALUES (29,3,'2022-01-01','2021-03-03',9);
INSERT INTO CursosAlumnos VALUES (30,4,'2022-01-01','2021-03-03',8);
INSERT INTO CursosAlumnos VALUES (27,5,'2022-01-01','2021-03-03',7);
INSERT INTO CursosAlumnos VALUES (29,6,'2022-01-01','2021-03-03',6);
select * from CursosAlumnos;

INSERT INTO CursosInstructores VALUES (27,1,'01-01-2022');
INSERT INTO CursosInstructores VALUES (27,2,'01-01-2022');
INSERT INTO CursosInstructores VALUES (31,3,'01-01-2022');
INSERT INTO CursosInstructores VALUES (31,4,'01-01-2022');
INSERT INTO CursosInstructores VALUES (32,3,'01-01-2022');
INSERT INTO CursosInstructores VALUES (32,4,'01-01-2022');
INSERT INTO CursosInstructores VALUES (33,2,'01-01-2022');
INSERT INTO CursosInstructores VALUES (33,1,'01-01-2022');
/*delete from CursosInstructores;*/
select * from CursosInstructores;

CREATE TABLE TablaISR(
id int primary key identity not null,
LimInf DECIMAL(9,2) NOT NULL,
LimSup DECIMAL(9,2) NOT NULL,
CuotaFija DECIMAL(9,2) NOT NULL,
ExedLimInf DECIMAL(9,2) NOT NULL,
Subsidio DECIMAL(9,2) NOT NULL);



SET IDENTITY_INSERT [dbo].[TablaISR] ON 

INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (1, CAST(0.01 AS Decimal(19, 2)), CAST(285.45 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)), CAST(1.92 AS Decimal(19, 2)), CAST(200.85 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (2, CAST(285.46 AS Decimal(19, 2)), CAST(872.85 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(200.85 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (3, CAST(872.86 AS Decimal(19, 2)), CAST(1309.20 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(200.70 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (4, CAST(1309.21 AS Decimal(19, 2)), CAST(1713.60 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(200.70 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (5, CAST(1713.61 AS Decimal(19, 2)), CAST(1745.70 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(193.80 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (6, CAST(1745.71 AS Decimal(19, 2)), CAST(2193.75 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(188.70 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (7, CAST(2193.76 AS Decimal(19, 2)), CAST(2327.55 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(174.75 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (8, CAST(2327.56 AS Decimal(19, 2)), CAST(2422.80 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(160.35 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (9, CAST(2422.81 AS Decimal(19, 2)), CAST(2632.65 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(160.35 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (10, CAST(2632.66 AS Decimal(19, 2)), CAST(3071.40 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(145.35 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (11, CAST(3071.41 AS Decimal(19, 2)), CAST(3510.15 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(125.10 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (12, CAST(3510.16 AS Decimal(19, 2)), CAST(3642.60 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(107.40 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (13, CAST(3642.61 AS Decimal(19, 2)), CAST(4257.90 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (14, CAST(4257.91 AS Decimal(19, 2)), CAST(4949.55 AS Decimal(19, 2)), CAST(341.85 AS Decimal(19, 2)), CAST(16.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (15, CAST(4949.56 AS Decimal(19, 2)), CAST(5925.90 AS Decimal(19, 2)), CAST(452.55 AS Decimal(19, 2)), CAST(17.92 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (16, CAST(5925.91 AS Decimal(19, 2)), CAST(11951.85 AS Decimal(19, 2)), CAST(627.60 AS Decimal(19, 2)), CAST(21.36 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (17, CAST(11951.86 AS Decimal(19, 2)), CAST(18837.75 AS Decimal(19, 2)), CAST(1914.75 AS Decimal(19, 2)), CAST(23.52 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (18, CAST(18837.76 AS Decimal(19, 2)), CAST(35964.30 AS Decimal(19, 2)), CAST(3534.30 AS Decimal(19, 2)), CAST(30.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (19, CAST(35964.31 AS Decimal(19, 2)), CAST(47952.30 AS Decimal(19, 2)), CAST(8672.25 AS Decimal(19, 2)), CAST(32.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (20, CAST(47952.31 AS Decimal(19, 2)), CAST(143856.90 AS Decimal(19, 2)), CAST(12508.35 AS Decimal(19, 2)), CAST(34.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (21, CAST(143856.91 AS Decimal(19, 2)), CAST(99999999.00 AS Decimal(19, 2)), CAST(45115.95 AS Decimal(19, 2)), CAST(35.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
SET IDENTITY_INSERT [dbo].[TablaISR] OFF
GO

select * from TablaISR;