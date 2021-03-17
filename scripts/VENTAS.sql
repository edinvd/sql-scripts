--CREACION DE LA BASE DE DATOS DE VENTAS
CREATE DATABASE VENTAS

USE VENTAS

--CREACION DE MI TABLA DE: Usuarios
USE VENTAS
CREATE TABLE Usuarios
(
idUsuario varchar(6) Primary Key not null,
claveUsuario varchar(8),
nombresUsuario varchar(20),
apellidosUsuario varchar(30), 
nombredelUsuario varchar(10), 
cantraseñaUsuario varchar(5), 
rolUsuario varchar(15), 
telefonoUsuario varchar(10), 
direccionUsuario varchar(30) 
)

--BORRA DATOS  DE LA TABLA
USE VENTAS
DELETE FROM Usuarios

--BORRA LO DETERMINADO DE LA TAMBLA
USE VENTAS
DELETE FROM  Usuarios WHERE id='a1'

--SELCION DE DATOS
USE VENTAS 
SELECT * FROM Usuarios

--##################################################################################################################################################--

----CREACION DE MI TABLA DE: Ventas
USE VENTAS
CREATE TABLE Ventas
(
IdVenta varchar(6) Primary Key not null,
fechaVenta date,
horaVenta date, 
subtotal money, 
total money, 
idUsuario varchar(6) 
)

--------------COMANDOS BASICOS-------------------
--BORRA DATOS  DE LA TABLA
USE VENTAS
DELETE FROM Ventas

--BORRA LO DETERMINADO DE LA TAMBLA
USE VENTAS
DELETE FROM  Ventas WHERE id='a1'

--SELCION DE DATOS
USE VENTAS 
SELECT * FROM Ventas
--##################################################################################################################################################--

----CREACION DE MI TABLA DE: Productos
USE VENTAS
CREATE TABLE Productos
(
IdProducto varchar(6) Primary Key not null,
claveProducto varchar(6), 
descripcionProducto varchar(30), 
precioCompraProducto money, 
precioVentaProducto money, 
stockProducto int, 
IdProveedor varchar(6)
)

--------------COMANDOS BASICOS-------------------
--BORRA DATOS  DE LA TABLA
USE VENTAS
DELETE FROM Productos

--BORRA LO DETERMINADO DE LA TAMBLA
USE VENTAS
DELETE FROM  Productos WHERE id='a1'

--SELCION DE DATOS
USE VENTAS 
SELECT * FROM Productos
--##################################################################################################################################################--

----CREACION DE MI TABLA DE: DetalleVenta
USE VENTAS
CREATE TABLE DetalleVenta
(
IdDetalleVenta varchar(6) Primary Key not null, 
idventa varchar(6), 
idProducto varchar(6), 
cantidadProducto int, 
precioProducto money 
)

--------------COMANDOS BASICOS-------------------
--BORRA DATOS  DE LA TABLA
USE VENTAS
DELETE FROM DetalleVenta

--BORRA LO DETERMINADO DE LA TAMBLA
USE VENTAS
DELETE FROM  DetalleVenta WHERE id='a1'

--SELCION DE DATOS
USE VENTAS 
SELECT * FROM DetalleVenta

--##################################################################################################################################################--

----CREACION DE MI TABLA DE: Proveedores
USE VENTAS
CREATE TABLE Proveedores
(
IdProveedor varchar(6) Primary Key not null,
claveProveedor varchar(5), 
nombreProveedor varchar(30), 
direccionProveedor varchar(30), 
telefonoProveedor varchar(10), 
emailProveedor varchar(40) 
)

--------------COMANDOS BASICOS-------------------
--BORRA DATOS  DE LA TABLA
USE VENTAS
DELETE FROM Proveedores

--BORRA LO DETERMINADO DE LA TAMBLA
USE VENTAS
DELETE FROM  Proveedores WHERE id='a1'

--SELCION DE DATOS
USE VENTAS 
SELECT * FROM Proveedores

--##################################################################################################################################################--

--RELACION TABLA Usuarios _ Ventas
ALTER TABLE Ventas
ADD CONSTRAINT FK_Ventas_Usuarios
FOREIGN KEY (idUsuario)REFERENCES Usuarios(idUsuario)

--RELACION TABLA Ventas _ DetalleVenta
ALTER TABLE DetalleVenta
ADD CONSTRAINT FK_DetalleVenta_Ventas
FOREIGN KEY (IdVenta)REFERENCES Ventas(idventa)

--RELACION TABLA DetalleVenta _Productos
ALTER TABLE DetalleVenta
ADD CONSTRAINT FK_DetalleVenta_Productos
FOREIGN KEY (idProducto)REFERENCES Productos(IdProducto)

--RELACION TABLA Productos_Proveedores
ALTER TABLE Productos
ADD CONSTRAINT FK_Productos_Proveedores
FOREIGN KEY (IdProveedor)REFERENCES Proveedores(IdProveedor)


ALTER AUTHORIZATION ON DATABASE::VENTAS TO SA