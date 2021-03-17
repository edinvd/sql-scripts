--CREAR BASE DE DATOS
CREATE DATABASE DBreserva
USE DBreserva

--CREAR TABLA TBpasajero
CREATE TABLE TBpasajero
(
IDpasajero VARCHAR(5) PRIMARY KEY NOT NULL,
NOMpasajero VARCHAR(30),
APEPATERpasajero VARCHAR(50),
APEMATERpasajero VARCHAR(50),
TIPOdocumento VARCHAR(10),
NUMdocumento VARCHAR(8),
FECHAnacimiento DATE,
IDpais VARCHAR (5),
TELEFONOpasajero VARCHAR (10),
EMAILpasajero VARCHAR (50),
CLAVEpasajero VARCHAR(4),
)

--VERIFICAR CREACION TABLA TBpasajero
SELECT * FROM TBpasajero

--CREAR TABLA TBpais
CREATE TABLE TBpais
(
IDpais VARCHAR(5) PRIMARY KEY NOT NULL,
NOMBREpais VARCHAR(30),
)

--VERIFICAR CREACION TABLA TBpasis
SELECT * FROM TBpais

--DIAGRAMA DE RELACIONES ENTRE TABLAS
ALTER AUTHORIZATION ON DATABASE::DBreserva TO SA

--CREAR RELACIONDE TABLA TBpais CON TBpasajero
ALTER TABLE TBpasajero
ADD CONSTRAINT FK_TBpasajero_TBpais
FOREIGN KEY (IDpais) REFERENCES TBpais(IDpais)

--INSERTANDO DATOS A LA TABLA TBpais
INSERT INTO TBpais
VALUES
('P-001','Perú'),
('P-002','Mexico'),
('P-003','Argentina'),
('P-004','Chile'),
('P-005','Ecuador'),
('P-006','Venezuela'),
('P-007','Bolivia'),
('P-008','Republica Dominicana'),
('P-009','El salvador')

--BORRANDO DATOS DE LA PRUEBA TBPASAJERO
DELETE FROM TBpais

--VERIFICANDO INGRESO DE DATOS A LA TABLA TBpais
SELECT * FROM TBpais


--INSERTANDO DATOS A LA TABLA TBpasajero
INSERT INTO TBpasajero
VALUES
('PA-01','Walther Martin','Aliaga','Vilca','DNI','16517322','2019-11-08','P-001','942-454157','waliaga@hotmail.com','2019'),
('PA-02','Elvin Yordick','Calle','Espinoza','DNI','16441257','2018-10-11','P-001','921-458912','ecalle@hotmail.com','2020'),
('PA-03','Miguel Angel','Diaz','Shupingahua','DNI','00548712','2019-09-12','P-005','938-659812','mdiaz@hotmail.com','2021'),
('PA-04','Ehuler','Espinoza','Olivos','DNI','16415972','2019-08-13','P-008','942-875421','eespinoza@hotmail.com','2022'),
('PA-05','Luis Fernando','Fernandez','Dominguez','DNI','17215470','2019-07-14','P-005','941-325487','lfernandez@hotmail.com','2023'),
('PA-06','Luis Felipe','Gomez','de la Cruz','DNI','00517322','2019-06-15','P-009','921-001245','lgomez@hotmail.com','2024'),
('PA-07','Alessyo Jhardell','Linares','Vargas','DNI','00326598','2019-05-16','P-009','938-253614','alinares@hotmail.com','2025'),
('PA-08','Walther Jhunior','Lopez','Huamanchari','DNI','17517325','2019-04-17','P-001','938-987512','wlopez@hotmail.com','2026'),
('PA-09','Jhonatan Smith','Olortegui','Cabrera','DNI','18517326','2019-03-18','P-002','941-658421','jolortegui@hotmail.com','2026'),
('PA-10','Camila','Sanches','Prada','DNI','00518337','2019-02-20','P-006','928-216417','camis@hotmail.com','2027'),
('PA-11','Arturo','Panduro','Diaz','DNI','19517327','2019-03-21','P-001','938-215487','apanduro@hotmail.com','2028'),
('PA-12','Percy Jhon','Paredes','Salmos','DNI','00517357','2019-02-22','P-001','922-259187','percyando@hotmail.com','2029'),
('PA-13','Luisa Lee','Suares','Miraflores','DNI','07412527','2019-04-23','P-008','999-221407','luisalee@hotmail.com','2030'),
('PA-14','Angellina','Mora','Guevara','DNI','07817127','2019-07-24','P-007','923-214587','angellinayo@hotmail.com','2031'),
('PA-15','Pedro Pablo','Pantora','Carrion','DNI','00817327','2019-08-25','P-001','958-215587','carrionpablo@hotmail.com','2032')

--BORRANDO DATOS DE LA PRUEBA TBPASAJERO
DELETE FROM TBpasajero

--VERIFICANDO INGRESO DE DATOS EN LA TABLA TBPASAJERO
SELECT * FROM TBpasajero

--IMPLEMENTAR UN SCRIP QUE PERMITA MOSTRAR EL MENSAJE DE
--NO HAY PASAJEROS EN ESTE PAIS, SOLO CUANDO EL TOTAL DE 
--PASAJEROS ASIGNADOS AUN DETERMINADO PAIS NO TENGA 
--REGISTROS EN LA TABLA PASJERO. CASO CONTRARIOP DETERMINAR
--CUANTOS PASJEROS TIENE DICHO PAIS.

DECLARE @nombre VARCHAR(40)='Bolivia'
if (select COUNT(*) from TBpasajero pas
	left join TBpais pai on pas.IDpais=pai.IDpais
	group by pai.NOMBREpais
	having pai.NOMBREpais=@nombre) is null
begin
	print 'No hay pasajeros en este País'
end
else
begin
	declare @total int
	select @total=COUNT(*) from TBpasajero pas
	left join TBpais pai on pas.IDpais=pai.IDpais
	group by pai.NOMBREpais
	having pai.NOMBREpais=@nombre

	print 'El País'+'  '+@nombre+' '+'Tiene:'+'  '+cast(@total as varchar(2))+'  '+'Pasajeros'
end


--Implementar un Script que permita mostrar el número total de pasajeros por país
--y el mensaje NO CUENTA solo a los países cuyo número de pasajeros sea cero.
 
SELECT pai.NOMBREpais, count (pas.IDpasajero)as [Total Pasajero],
case
	when count(pas.IDpasajero)=0 then ' NO CUENTA'
	ELSE ''
	END AS [Mensaje]
from TBpais pai left join TBpasajero pas
on pai.IDpais=pas.IDpais
group by pai.NOMBREpais
go