--############################  CREACION DE LA BASE DE DATOS  OMEGA_PLAZA ##########################################---

CREATE DATABASE OMEGA_PLAZA

USE OMEGA_PLAZA

--CREANDO TABLAS DE CLIENTES
CREATE TABLE CLIENTES
(
idCliente varchar(6) Primary Key not null,
nombreCliente varchar(30),
apaternoCliente varchar(30),
direccionCliente varchar(40),
telefonoCliente varchar(10)
)

SELECT *FROM CLIENTES

USE OMEGA_PLAZA
DELETE FROM CLIENTES

----CREANDO TABLAS DE FACTURAS
CREATE TABLE FACTURAS
(
idFactura varchar(6) Primary Key not null,
idCliente varchar(6),
fechaFactura date,
numeroFactura varchar(6),
igv decimal
)

SELECT * FROM FACTURAS

---CREANDO TABLA DETALLES
CREATE TABLE DETALLES
(
idDetalle varchar(6) Primary Key not null,
Cantidad int,
descripcionProducto varchar (40),
precioProducto money,
idFactura varchar(6)
)

SELECT * FROM DETALLES

ALTER AUTHORIZATION ON DATABASE::OMEGA_PLAZA TO SA

--###################       RELACIONANDO TABLA CLIENTES CON TABLA FACTURAS        ####################--------- 

ALTER TABLE FACTURAS
ADD CONSTRAINT FK_FACTURAS_CLIENTES
FOREIGN KEY (idCliente) REFERENCES CLIENTES(idCliente)

ALTER TABLE DETALLES
ADD CONSTRAINT FK_DETALLES_FACTURAS
FOREIGN KEY (idFactura) REFERENCES FACTURAS(idFactura)

--INSERTAR REGISTRO A LA TABLA  CLIENTES
INSERT INTO CLIENTES
VALUES
('C-0001','Jose Luis','Vasquez','Jr.Callao 260','923-534678'),
('C-0002','Bletia','Ligia','Jr.Edmundo del Aguila 423','956-345324'),
('C-0003','Jeninfer','Lopez','Jr.Pedro Canga 123','934-343423'),
('C-0004','Emilio','Carranza','Jr.20 de Abril 214','987-346688'),
('C-0005','Camila','Suares','Jr.2 de junio 56','923-677889')

SELECT * FROM CLIENTES

DELETE FROM CLIENTES

--INSERTAR REGISTRO A LA TABLA FACTURAS
INSERT INTO FACTURAS
VALUES
('F-0001','C-0001','01-10-2019','M19-01',18),
('F-0002','C-0002','02-10-2019','M19-02',18),
('F-0003','C-0003','03-10-2019','M19-03',18),
('F-0004','C-0004','04-10-2019','M19-04',18),
('F-0005','C-0005','05-10-2019','M19-05',18)

SELECT * FROM FACTURAS

USE OMEGA_PLAZA
DELETE  FROM FACTURAS

--INSERTAR REGISTRO A LA TABLA DETALLES
INSERT INTO DETALLES
VALUES
('D-0001',2,'Teclado Enhanced - lenovo',60.00,'F-0001'),
('D-0002',1,'Mouse - Tech',25.00,'F-0001'),
('D-0003',2,'Disco Solido - Samsung',60.00,'F-0002'),
('D-0004',1,'Computador - Mac',14000.00,'F-0002'),
('D-0005',4,'Dico Duro - Toshiba',400.00,'F-0003'),
('D-0006',3,'Celular - Huawei P20',1000.00,'F-0003'),
('D-0007',5,'Auriculares - lenovo',60.00,'F-0004'),
('D-0008',2,'Tablet - lenovo',500.00,'F-0004'),
('D-0009',2,'Celular - Iphone 11Pro',5000.00,'F-0005'),
('D-0010',2,'Silla Gamer - Mozilla',550.00,'F-0005')

SELECT * FROM DETALLES

USE OMEGA_PLAZA
DELETE FROM DETALLES

------------------------------------CONSULTAS----------------------------------------
--********************

--RELACION DE RIGISTRO DE LA TABLA CLIENTES
SELECT * FROM CLIENTES

--RELACION DE RIGISTRO DE LA TABLA FACTURAS
SELECT * FROM FACTURAS

--RELACION DE RIGISTRO DE LA TABLA DETALLES
SELECT * FROM DETALLES

--############  SELECIONAR SOLO EL NOMBRE, APELLIDO PATERNO Y EL TELEFONO DE LOS CLIENTES

SELECT nombreCliente,apaternoCliente,telefonoCliente
from CLIENTES
ORDER BY apaternoCliente ASC;

--############  SELECIONAR SOLO EL CODIGO, CANTIDAD, DESCRIPCION DEL PRODUCTO

SELECT idDetalle,Cantidad,descripcionProducto
from DETALLES
ORDER BY descripcionProducto DESC;

--############# SELEICONAR TODOS LOS CLIENTES DE TELEFENO QUE COMIENZE CON LOS NUMEROS 923
SELECT * 
FROM CLIENTES
WHERE telefonoCliente like '923%'
ORDER BY idCliente ASC;


--############# SELEICONAR TODOS LOS PRODUCTOS CUYA DESCRIPCION COMIENZE CON "T"
SELECT * 
FROM DETALLES
WHERE descripcionProducto like 'C%'
ORDER BY idDetalle DESC;

--SELECCIONAR DE LA TABLA FACTURA: CODIGO, NOMBRE Y APELLIDO

SELECT fac.idFactura, fac.fechaFactura,det.descripcionProducto,det.precioProducto
FROM FACTURAS fac INNER JOIN DETALLES det
ON fac.idFactura=det.idFactura;


--SELECCIONAR DE LA TABLA FACTURA: CODIGO, NOMBRE Y APELLIDO
--DE LA TABLA FACTURA: CODIGO, FECHA DE FACTURACION
--Y DE LA TABLA DETALLES: DESCRI´PCION Y PRECIO DEL PRUDUCTO

SELECT cli.idCliente,cli.nombreCliente,cli.apaternoCliente,fac.idFactura,fac.fechaFactura,det.descripcionProducto,det.precioProducto
FROM CLIENTES cli INNER JOIN FACTURAS fac
ON cli.idCliente=fac.idCliente
INNER JOIN DETALLES det
ON fac.idFactura=det.idFactura;

--*************************************
--      FUNCIONES
--*************************************

--Implementar una funcion que devuelva el promedio
--de dos notas ingresadas por el usuario

--1.- VERIFICAR SI LA FUNCION YA EXISTE
IF OBJECT_ID('calcularpromedio') is not null
	BEGIN
		DROP FUNCTION dbo.calcularpromedio
	END

--2.- CREAR FUNCION CALCULAR PROMEDIO
CREATE FUNCTION calcularpromedio
	(@nota1 AS DECIMAL(10,2), @nota2 AS DECIMAL (10,2))
	RETURNS DECIMAL(10,2)

	BEGIN
		DECLARE @promedio DECIMAL (10,2)
		SET @promedio=(@nota1+@nota2)/2
		RETURN @promedio
	END

--3.- EJECUTAR FUNCION CALCULAR PROMEDIO
SELECT dbo.calcularpromedio(13.4,18.3) AS [PROMEDIO]


--Implementar una funcion (NOTAS) que devuelva el promedio
--de dos notas ingresadas por el usuario:
-- Examen_Teorico (PEso-0.5)
-- Examen_Practico (PEso-0.5)
--Examen_Final(Peso-2)


--1.- VERIFICAR SI LA FUNCION YA EXISTE
IF OBJECT_ID('notas') is not null
	BEGIN
		DROP FUNCTION dbo.notas
	END

--2.- CREAR FUNCION CALCULAR PROMEDIO
CREATE FUNCTION notas
	(@Examen_Teorico AS DECIMAL(10,2), @Examen_Practico AS DECIMAL (10,2), @Examen_Final AS DECIMAL (10,2))
	RETURNS DECIMAL(10,2)

	BEGIN
		DECLARE @promedio DECIMAL (10,2)
		SET @promedio=((@Examen_Teorico*0.5) +(@Examen_Practico*0.5) + (@Examen_Final*2.0))/4
		RETURN @promedio
	END

--3.- EJECUTAR FUNCION CALCULAR PROMEDIO
SELECT dbo.notas(12.0,16.0,14.0) AS [PROMEDIO DE NOTAS]


--Implementar una funcion (formatofechas) que devuelva
--la fecha en formato con letras:

--1.- VERIFICAR SI LA FUNCION YA EXISTE
IF OBJECT_ID('formatofechas') is not null
	BEGIN
		DROP FUNCTION dbo.formatofechas
	END

--2.- CREAR FUNCION CALCULAR PROMEDIO
CREATE FUNCTION formatofechas
	(@fecha as date)
	RETURNS varchar (50)

	BEGIN
		DECLARE @resultado varchar (50)
		SET @resultado=concat(day(@fecha),'  ',' de','  ',datename(month,@fecha),'  ', 'del','  ', year(@fecha))
		RETURN @resultado
	END

--3.- EJECUTAR FUNCION CALCULAR PROMEDIO
SELECT dbo.formatofechas('2019-12-04') AS [FECHA EN LETRAS]