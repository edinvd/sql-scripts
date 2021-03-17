--## CREANDO LA BASE DE DATOS ##--
CREATE DATABASE Buena_Salud

DROP DATABASE Buena_Salud

--VERIFICAMOS SI ESTA CREADA CORRECTAMENTE LA BASE DE DATOS
USE Buena_Salud

-- CREANDO TABLAS--
--Creacion de la tabla "Dept"--

--## PRIMARY KEY, se utiliza para identificar de manera única cada fila de una tabla ##--

/*La restricción NOT NULL sirve para especificar que una columna no acepta el valor NULL
 es decir, que esa columna siempre tiene que tener algún valor, no puede estar vacía. */

CREATE TABLE Dept
(
Dept_No int Primary Key not null,
DNombre varchar(50)not null,
Loc varchar (50) not null
)

--## VERIFICAR SI LA TABLA ESTA CREADA ##--
--## SELECCIONAR TODOS LOS DATOS DE LA TABLA ##--
SELECT * FROM Dept

--## PARA MODIFICAR LOS CAMPOS DE UNA TABLA YA EXISTENTE ##--
ALTER TABLE Dept

--## DROP TABLE se utiliza para eliminar por completo una tabla existente.
DROP TABLE Dept

--## INSERTAR DATOS A UNA TABLA ##--
/* Insertando datos a la tabla de Dept:
	Campos:
		Dept_No
		DNombre
		Loc

		*/

/**La palabra clave VALUES se utiliza para pasar el o los valor(es) 
a insertar en la(s) columna(s) especificada(s)*/

INSERT INTO Dept
VALUES
('00101','Departamento Central Alpha','San Isidro - Lima'),
('00102','Departamento Maria Mercedes','Surco - Lima'),
('00103','Departamento Clinica La Paz','Paruro - Cusco'),
('00104','Departamento San Antonio','Sullana - Piura'),
('00105','Departamento Alto Mayo','Moyobamba - San Martin'),
('00106','Departamento Niño Bueno','La union - Arequipa')

/* ## La sentencia DELETE sirve para borrar filas de una tabla. 
La sintaxis de SQL DELETE es: DELETE FROM nombre_tabla. WHERE nombre_columna = valor.
*/
SELECT * FROM Dept

--## PARA MODIFICAR LOS CAMPOS DE UNA TABLA YA EXISTENTE ##--
ALTER TABLE Dept

--## DROP TABLE se utiliza para eliminar por completo una tabla existente.
DROP TABLE Dept

--Borra todas las filas de la tabla
DELETE FROM Dept
--Borra una fila(s) especificas
DELETE FROM Dept WHERE Dept_No = 00105


-- CREANDO TABLAS--
--Creacion de la tabla "Emp"--
CREATE TABLE Emp
(
Emp_No varchar(50) PRIMARY KEY not null ,
Apellido varchar(50)not null,
Oficio varchar (50) not null,
Dir varchar (50) not null,
Fecha_Alt Date not null,
Salario money not null,
Comision money not null,
Dept_No int not null
)

SELECT * FROM Emp


ALTER AUTHORIZATION ON DATABASE::Buena_Salud TO SA
--###################       RELACIONANDO TABLA Dept CON TABLA Emp        ####################--------- 
ALTER TABLE Emp
ADD CONSTRAINT FK_Emp_Dept
FOREIGN KEY (Dept_No) REFERENCES Dept(Dept_No)




--## INSERTAR DATOS A UNA TABLA ##--
/* Insertando datos a la tabla de Dept:
	Campos:
		Emp_No
		Apellido
		Oficio
		Dir
		Fecha_Alt
		Salario
		Comision
		Dept_No

		*/
INSERT INTO Emp
VALUES
('Maria','Lopez Salazar','Emfermera','Jr: 20 de abril','2015-04-25', 3500 , 150,'00101'),
('Pedro','Carbajal Paredes','Doctor','Jr: Puno','2018-08-25', 3500 , 150,'00105'),
('Camilo Pool','Flores Silva','Odontologo','Jr:Tacna','2016-07-25', 3500 , 150,'00103'),
('Carmen Luisa','Sanches Delgado','Otorrino','Av: Miguel Grau','2018-02-25', 3500 , 150,'00101'),
('Pablo Junior','Campos Palacios','Emfermero','Calle Central Polanio','2019-01-25', 3500 , 150,'00102'),
('Estrella','Puelles Altamirano','Doctora General','Cuadra 2 de Mayo','2017-04-25', 3500 , 150,'00106'),
('Cristian','Castillo Paredes','Nutriologo','Barrio Pachacamac','2017-09-25', 3500 , 150,'00106'),
('Sthefani Sarai','Contreras Gonzales','Supervisor','Av: Los Rosales','2016-04-25', 3500 , 150,'00103'),
('Eduardo Kain','Montaner Salazar','Mantenimiento','Av: Alta Pared','2015-12-25', 3500 , 150,'00104'),
('Monica','Palacios Tumba','Quimico','Jr: 25 de Junio','2019-11-25', 3500 , 150,'00105')

SELECT * FROM Emp

--## PARA MODIFICAR LOS CAMPOS DE UNA TABLA YA EXISTENTE ##--
ALTER TABLE Emp

--## DROP TABLE se utiliza para eliminar por completo una tabla existente.
DROP TABLE Emp

--Borra todas las filas de la tabla
DELETE FROM Emp


--## CREANDO LA TABLA DE ENFERMO ##--
CREATE TABLE Enfermo
(
Inscripcion varchar(50) Not Null,
Apellido varchar(50)Not Null,
Direccion varchar(50),
Fecha_Nac date,
S varchar(1),
NSS int,
)

SELECT * FROM Enfermo
--Insertando datos en la tabla Enfermo--
INSERT INTO Enfermo
VALUES
('Tim Koll','Oxford Wooding','Jr: Torre de Boll','2000-12-04','M',123456789),
('Tania Sue','Lopes Carbajal','Av: Londres','1992-05-24','F',987654321),
('Karina Sol','Flores Paredes','Barrio Altas Vistas','1986-11-10','F',548932574),
('Francisco','Perez Izquierdos','Jr: 20 de Abril','1996-11-16','M',589647168),
('Pedro','Mori Alcantara','Jr: 2 de Junio','2002-10-14','M',128965789),
('Camila','Campos Puelles','Barrio los Florales','2000-12-04','F',145879624),
('Ariana','Grande Torres','Av: Brazil','1999-08-20','F',183446799),
('Camilo ','Diaz Arizaga','Barrio Las palmeras','1996-02-24','M',123476739),
('Antony','Paredes Palacios','Jr: 2 de Junio','2003-11-15','M',127456989),
('Sheyla','Lopez Oscura','Jr: Union','2002-12-04','F',123856289)

SELECT * FROM Enfermo

--## PARA MODIFICAR LOS CAMPOS DE UNA TABLA YA EXISTENTE ##--
ALTER TABLE Enfermo

--## DROP TABLE se utiliza para eliminar por completo una tabla existente.
DROP TABLE Enfermo

--Borra todas las filas de la tabla
DELETE FROM Enfermo


--##  SENTENCIAS DE CONSULTAS  ##--
/*1. Obtener todos los empleados que se dieron de alta antes del año 2018 y que
pertenecen a un determinado departamento.*/

SELECT * FROM Emp WHERE NOT Dept_No=00103;

CREATE PROCEDURE FECHASDEPT
@FINICIAL DATETIME,
@FFINAL SMALLDATETIME ,
@DEPT_NO NVARCHAR(10)
AS
SELECT * FROM EMP WHERE FECHA_ALT BETWEEN @FINICIAL AND @FFINAL
AND DEPT_NO = @DEPT_NO

EXEC FECHASDEPT '01/01/2000','01/01/2018',00104
 
		
/*2. Crear un procedimiento almacenado que permita insertar un nuevo
departamento.*/




/*3. Crear un procedimiento que recupere el promedio de edad de las personas por
cada departamento.*/


/*4. Crear un procedimiento para devolver el apellido, oficio y salario, pasándole
como parámetro el número del empleado.*/


/*5. Crear un procedimiento almacenado para dar de baja a un empleado
pasándole como parámetro su apellido.*/


CREATE PROCEDURE INSERTA_DEPARTAMENTO
@DEPT_NO INT,
@DNOMBRE NVARCHAR(20),
@LOC NVARCHAR(20)
AS
INSERT INTO DEPT VALUES
(@DEPT_NO,
@DNOMBRE,
@LOC)

EXEC INSERTA_DEPARTAMENTO 50,'DESARROLLO','ZARAGOZA'



CREATE PROCEDURE APELLIDO_OFICIO @PNUMERO NVARCHAR(20) AS
SELECT APELLIDO, OFICIO, SALARIO FROM EMP WHERE EMP_NO = @PNUMERO

EXEC  APELLIDO_OFICIO 7876