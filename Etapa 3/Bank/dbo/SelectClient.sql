CREATE PROCEDURE SelectClient
    @ClientID INT = NULL
AS
BEGIN
    IF @ClientID IS NULL
    BEGIN
        -- Si el parámetro es nulo, selecciona toda la información de todos los registros de Client
        SELECT *
        FROM Client;
    END
    ELSE
    BEGIN
        -- Si el parámetro no es nulo, selecciona toda la información del registro de Client con el ID proporcionado
        SELECT *
        FROM Client
        WHERE ID = @ClientID;
    END
END;

GO

