--CREANDO UNA BASE DE DATOS--
CREATE DATABASE UNIVERSE_STORE

--ACTIVAR MI BASE DE DATOS UNIVERSE-STORE
USE UNIVERSE_STORE

--CREANDO TABLA DE UNIVERSE_STORE
USE UNIVERSE_STORE
CREATE TABLE TBClientes
(
IDclientes Nvarchar(6) Primary Key not null,
NOMBRESclientes Nvarchar(30),
APELLIDOSclientes Nvarchar(50),
EDADclientes int,
CELULARclientes Nvarchar(15),
SEXOclientes Nvarchar(2),
PAISclientes Nvarchar(30)
)

--INSERTAMOS REGISTRO A LA TABLA CLIENTES
USE UNIVERSE_STORE
INSERT INTO TBClientes(IDclientes,NOMBRESclientes,APELLIDOSclientes,EDADclientes,CELULARclientes,SEXOclientes,PAISclientes)
VALUES

('A-0001','Camilo Luis','Ordoñez Palacio',25,'945-486932','M','PERU'),
('A-0002','Sheyla shell','Orgulo Sental',22,'567-34577','F','ARGENTINA'),
('A-0003','Ellie Vero','Miking Sonchet',26,'243-456782','F','CANADA'),
('A-0004','Jeninfer click','Oxford Unite',21,'421-344567','M','UNITE STATES'),
('A-0005','Tim Blue','Berglin',27,'786-435435','M','NEW ZELAND'),
('A-0006','Armin Van Buuren','Best in thw World',33,'34-23546','M','AUSTRALIA'),
('A-0007','The Chainsmokers','Cracks universe',26,'22-343567','M','GERMANY'),
('A-0008','Tiana risol','Wooding',19,'001-4256','F','IRLANDA'),
('A-0009','Nicole Pink','Whashington Unite',24,'345-34645','F','BRAZIL'),
('A-0010','Lost Frecuencies','Ordoñez Palacio',28,'023-546577','M','NORUEGA')




--SELECCIONAR TODOS LOS REGISTROS DE LA TABLA UNIVERSE_STORE
USE UNIVERSE_STORE
SELECT * FROM TBClientes

--BORRAR REGISTRO DE LA TABLA UNIVERSE_STORE
USE UNIVERSE_STORE
DELETE FROM TBClientes

USE UNIVERSE_STORE
DELETE FROM TBClientes

