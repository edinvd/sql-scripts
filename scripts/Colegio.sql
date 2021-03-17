CREATE DATABASE Colegio
GO

USE Colegio

CREATE TABLE ESTUDIANTE (
ID VARCHAR (3) PRIMARY KEY NOT NULL,
NOMBRES VARCHAR(30),
APELLIDOS VARCHAR(30),
TELEFONO VARCHAR(9),
CORREO VARCHAR(50),
NACIMIENTO VARCHAR(10),
OBSERVACIONES VARCHAR(60),
NOTA VARCHAR(2)
)

INSERT INTO ESTUDIANTE VALUES
('001','Elon','Palacios Requejo','985517082','elonpalacios@gmail.com','14/03/2002','  ','19'),
('002','Monica','Sanches Paredes','951357825','monicsan@gmail.com','13/05/2002','  ','17'),
('003','Jose','Fernandez Domingues','963258741','ferdom@gmail.com','05/06/2002','  ','13'),
('004','Wiliam','Vasquez Florez','987618254','wiliamvf@gmail.com','22/03/2002','  ','18'),
('005','Grimanesa','Panduro Poclin','985632145','grimapan@gmail.com','15/03/2002','  ','15'),
('006','Sheyla','Soto Sanchez','987654258','sheyshey@gmail.com','23/05/2002','  ','20'),
('007','Piero','Fernandez Carbajal','65814753','pierofercar@gmail.com','30/09/2002','  ','14'),
('008','Airton','Vargas Chota','951357852','vargaschota@gmail.com','02/01/2002','  ','12'),
('009','Lisbeth','Campos Jimenes','968357214','lisbethcj@gmail.com','14/02/2002','  ','18')

DROP TABLE ESTUDIANTE

SELECT * FROM ESTUDIANTE

