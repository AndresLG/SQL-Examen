/* Poner en uso la Base de Datos VideoClub */
USE DBVideoClub
GO

/* SP para ingresar datos en la tabla Actor */
CREATE PROCEDURE sp_Actor
    @Codigo INT,
    @Nombre VARCHAR(MAX),
    @Apellido VARCHAR(MAX)
AS
    BEGIN
    INSERT INTO Actor
        (idAct, nomAct, apeAct)
    VALUES
        (@Codigo, @Nombre, @Apellido)
    END
GO
/* Ejecutar el SP */
EXEC sp_Actor @Codigo = 01, @Nombre = Chris, @Apellido = Evans
GO

/* Modificar el SP_Actor */
ALTER PROCEDURE sp_Actor
    @Codigo INT,
    @Nombre VARCHAR(MAX),
    @Apellido VARCHAR(MAX)
AS
    BEGIN
    IF(SELECT Actor.idAct FROM Actor WHERE Actor.idAct = @Codigo) IS NOT NULL
            SELECT 'No puedes ingresar el registro porque el código ya existe' AS 'Resultado'
    ELSE
    INSERT INTO Actor
        (idAct, nomAct, apeAct)
    VALUES
        (@Codigo, @Nombre, @Apellido);
    SELECT * FROM Actor
    END
GO
/* Ejecutar el SP */
EXEC sp_Actor @Codigo = 01, @Nombre = Chris, @Apellido = Evans
EXEC sp_Actor @Codigo = 02, @Nombre = Chris, @Apellido = Hemsworth
EXEC sp_Actor @Codigo = 03, @Nombre = Andrew, @Apellido = Garfield
EXEC sp_Actor @Codigo = 04, @Nombre = Andrew, @Apellido = Scott
GO

/* SP para ingresar datos en la tabla Director */
CREATE PROCEDURE sp_Director
    @Codigo INT,
    @Nombre VARCHAR(MAX),
    @Apellido VARCHAR(MAX)
AS
    BEGIN
    IF(SELECT Director.idDirect FROM Director WHERE Director.idDirect = @Codigo) IS NOT NULL
            SELECT 'No puedes ingresar el registro porque el código ya existe' AS 'Resultado'
    ELSE
    INSERT INTO Director
        (idDirect, nomDirect, apeDirect)
    VALUES
        (@Codigo, @Nombre, @Apellido);
    SELECT * FROM Director
    END
GO
/* Ejecutar el SP */
EXEC sp_Director @Codigo = 01, @Nombre = Guillermo, @Apellido = 'del Toro'
EXEC sp_Director @Codigo = 02, @Nombre = Joss, @Apellido = Whedon
EXEC sp_Director @Codigo = 03, @Nombre = Taika, @Apellido = Waititi
EXEC sp_Director @Codigo = 04, @Nombre = Marc, @Apellido = Webb
GO

/* SP para ingresar datos en la tabla Género */
CREATE PROCEDURE sp_Genero
    @Codigo INT,
    @Nombre VARCHAR(MAX)
AS
    BEGIN
    IF(SELECT Genero.idGen FROM Genero WHERE Genero.idGen = @Codigo) IS NOT NULL
            SELECT 'No puedes ingresar el registro porque el código ya existe' AS 'Resultado'
    ELSE
    INSERT INTO Genero
        (idGen, nomGen)
    VALUES
        (@Codigo, @Nombre);
    SELECT * FROM Genero
    END
GO
/* Ejecutar el SP */
EXEC sp_Genero @Codigo = 01, @Nombre = Dramatico
EXEC sp_Genero @Codigo = 02, @Nombre = Accion
EXEC sp_Genero @Codigo = 03, @Nombre = 'Ciencia Ficcion'
EXEC sp_Genero @Codigo = 04, @Nombre = Fantastico
GO
