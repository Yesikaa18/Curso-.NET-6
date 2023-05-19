CREATE PROCEDURE InsertClient
    @Name VARCHAR(200),
    @PhoneNumber VARCHAR(40),
    @Email VARCHAR(50) = NULL
AS
BEGIN
    
    IF EXISTS (SELECT 1 FROM Client WHERE Email = @Email)
    BEGIN
        
        RETURN 'El email proporcionado ya existe. No se pudo insertar el registro.';
    END

    
    INSERT INTO Client (Name, PhoneNumber, Email)
    VALUES (@Name, @PhoneNumber, @Email);
    
    
    RETURN 'Insertado con éxito.';
END;

GO

