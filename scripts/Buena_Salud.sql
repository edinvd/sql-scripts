--Creación de la base de datos Hospital
CREATE DATABASE Buena_Salud
GO

USE Buena_Salud


--Crear tabla Dept
CREATE TABLE Dept
(
	Dept_No			INT				NOT NULL,
	DNombre			VARCHAR(50)		NULL,
	Loc				VARCHAR(50)		NULL,
	CONSTRAINT PK_Dept PRIMARY KEY(Dept_No)
)
GO
USE Buena_Salud

--Insertar datos en la tabla Departamento "Dept"
INSERT INTO Dept
VALUES
(10,'HOSPITAL CENTRAL','Lima'),
(20,'HOSPITAL MERCEDES','Miraflores'),
(30,'LABORATORIO','San Isidro'),
(40,'FARMACIA','Surco')

SELECT *FROM Dept

DELETE FROM Dept

DROP TABLE Dept

--Crear tabla "Emp"
CREATE TABLE Emp
(
	Emp_No			INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Oficio			VARCHAR(50)		NULL,
	Dir				INT				NULL,
	Fecha_Alt		SMALLDATETIME	NULL,
	Salario			NUMERIC(9,2)	NULL,
	Comision		NUMERIC(9,2)	NULL,
	Dept_No			INT				NULL
	CONSTRAINT PK_Emp PRIMARY KEY(Emp_No),
	CONSTRAINT FK_Emp_Dept FOREIGN KEY (Dept_No) REFERENCES Dept(Dept_No)
)

GO

USE Buena_Salud

--Insertar datos en la tabla Empleados "Emp"
INSERT INTO Emp
VALUES
(7369,'SANCHEZ','DOCTOR',7902,'2002/12/17',4000,0,20),
(7499,'ARROYO','ENFERMERO',7698,'2008/02/22',8000,200,30),
(7521,'SALA','ODONTOLOGO',689,'2009/02/22',2500,600,30),
(7566,'JIMENEZ','OTORRINOLARINGOLOGÍA',7839,'2015/04/02',6750,0,20),
(7654,'MARTIN','DOCTOR',7698,'2011/09/28',2000,100,30),
(7698,'NEGRO','PEDIATRÍA',7839,'2019/05/01',5500,80,30),
(7782,'CEREZO','CARDIOLOGÍA',7839,'2018/06/09',8500,100,10),
(7788,'NINO','NEUMOLOGÍA',7566,'2017/03/30',9000,100,20),
(7839,'REY','GINECOLOGÍA',0,'2016/11/17',10000,500,10),
(7844,'TOVAR','OBSTETRICIA',7698,'2015/09/08',5000,150,30),
(7876,'ALONSO','UROLOGÍA',7788,'2013/05/03',3000,90,20),
(7900,'JIMENO','ENDOCRINOLOGÍA',7698,'2018/12/03',3500,1200,30),
(7902,'FERNANDEZ','GINECOLOGÍA',7566,'2020/12/03',90000,200,20),
(7934,'MUÑOZ','DOCTOR',7782,'2015/06/23',9000,250,10),
(7119,'SERRA','PEDIATRÍA',7839,'2014/11/19',5000,300,20),
(7322,'GARCIA','DOCTOR',7119,'2019/10/12',9000,200,20)
GO

SELECT *FROM Emp

DELETE FROM Emp

DROP TABLE Emp

--Crear tabla Enfermo
CREATE TABLE Enfermo
(
	Inscripcion		INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Direccion		VARCHAR(50)		NULL,
	Fecha_Nac		VARCHAR(50)		NULL,
	S				VARCHAR(2)		NULL,
	NSS				INT				NULL
)
GO	

--Insertar datos en la tabla Enfermo
INSERT INTO Enfermo
VALUES
(10995,'Laguía M.','Goya 20','16-may-56','M',280862422),
(14024,'Fernández M.','Recoletos 50','21-may-60','F',284991452),
(18004,'Serrano V.','Alcalá 12','23-jun-67','F',321790059),
(36658,'Domin S.','Mayor 71','01-ene-42','M',160654471),
(38702,'Neal R.','Orense 11','18-jun-40','F',380010217),
(39217,'Cervantes M.','Perón 38','29-feb-52','M',440294390),
(59076,'Miller B.','López de Hoyos 2','16-sep-45','F',311969044),
(63827,'Ruiz P.','Ezquerdo 103','26-dic-80','M',100973253),
(64823,'Fraiser A.','Soto 3','10-jul-80','F',285201776),
(74835,'Benítez E.','Av: Brazil','05-oct-57','M',154811767)

SELECT *FROM Enfermo

DELETE FROM Enfermo

DROP TABLE Enfermo

USE Buena_Salud

--##  PROCEDIMIENTOS ALMACENADOS ##--
/*1. Obtener todos los empleados que se dieron de alta antes del año 2018 y que
pertenecen a un determinado departamento.*/
CREATE PROCEDURE FECHASDEPT
@FINICIAL DATETIME,
@FFINAL SMALLDATETIME ,
@DEPT_NO NVARCHAR(10)
AS
SELECT * FROM EMP WHERE FECHA_ALT BETWEEN @FINICIAL AND @FFINAL
AND DEPT_NO = @DEPT_NO

EXEC FECHASDEPT '01/01/2000','01/01/2018',10

/*2. Crear un procedimiento almacenado que permita insertar un nuevo
departamento.*/
USE Buena_Salud

CREATE PROCEDURE INSERTA_DEPARTAMENTO
@DEPT_NO INT,
@DNOMBRE NVARCHAR(20),
@LOC NVARCHAR(20)
AS
INSERT INTO DEPT VALUES
(@DEPT_NO,
@DNOMBRE,
@LOC)

EXEC INSERTA_DEPARTAMENTO 50,'BIOANÁLISIS','Magdalena del Mar'


/*3. Crear un procedimiento que recupere el promedio de edad de las personas por
cada departamento.*/
CREATE PROCEDURE NUMEMP_DEPT @NDEP SMALLINT
AS SELECT COUNT(*) AS [NUM EMPLEADOS], DEPT_NO
FROM EMP
WHERE DEPT_NO = @NDEP
GROUP BY DEPT_NO

EXEC NUMEMP_DEPT 10

/*4. Crear un procedimiento para devolver el apellido, oficio y salario, pasándole
como parámetro el número del empleado.*/
CREATE PROCEDURE APELLIDO_OFICIO @PNUMERO NVARCHAR(20) AS
SELECT APELLIDO, OFICIO, SALARIO FROM EMP WHERE EMP_NO = @PNUMERO

EXEC  APELLIDO_OFICIO 7876

/*5. Crear un procedimiento almacenado para dar de baja a un empleado
pasándole como parámetro su apellido.*/
CREATE PROCEDURE DAR_BAJA 
@Apellido VARCHAR(20)
AS
BEGIN 
	DELETE FROM Emp WHERE APELLIDO = @Apellido
END

EXEC DAR_BAJA GARCIA

SELECT * FROM EMP
