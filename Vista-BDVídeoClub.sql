/* Poner en uso la Base de Datos VideoClub */
USE DBVideoClub
GO

/* Vista para listar los apellidos de los actores de las películas */
CREATE VIEW vwActor
AS
SELECT apeAct FROM Actor
GO
/* Ejecutar Vista */
SELECT * FROM vwActor