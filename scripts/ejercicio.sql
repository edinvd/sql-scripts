CREATE DATABASE ejemplo

USE ejemplo

CREATE TABLE [dbo].[Usuarios]
(
	[Id-usuario] INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	[Nombre] VARCHAR(50) NULL,
	[Usuario] VARCHAR(50) NULL,
	[Password] VARCHAR(50) NULL,
	[Tipo-usuario] VARCHAR(50) NULL
)

SELECT * FROM Usuarios

INSERT INTO Usuarios VALUES ('Elon Musk' , 'elonmusk' , '12345', 'Admin'),
							('Camila Oxford' , 'camioxford' , '54321', 'Usuario');