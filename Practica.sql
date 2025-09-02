create database PracticaMati
go

use PracticaMati

create schema ddbba



CREATE TABLE ddbba.registro(
	id int identity(1,1) primary key,
	fechaHora datetime default getdate(),
	texto char(50),
	modulo char(10)
);

SET NOCOUNT ON

create or alter procedure insertarLog
@texto varchar(50),
@modulo varchar(10)
AS
BEGIN
-- Declara una variable local para manejar el valor del módulo
    DECLARE @moduloFinal VARCHAR(10);

    -- Verifica si el módulo está en blanco (NULL o cadena vacía)
    IF @modulo IS NULL OR @modulo = ''
    BEGIN
        SET @moduloFinal = 'N/A';
    END
    ELSE
    BEGIN
        SET @moduloFinal = @modulo;
    END;
	INSERT INTO ddbba.registro (texto, modulo)
    VALUES (@texto, @moduloFinal);
END;
GO

exec insertarLog "insert", "hospedaje"

select * from ddbba.registro

