
--1.- CREACIÓN DEL PROCEDIMIENTO ALMACENADO SelectClient

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

EXEC SelectClient;


-- 2.- Modificación del Procedimiento INSERTCLIENT

ALTER PROCEDURE InsertClient
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


EXEC InsertClient @Name = 'Maria', @PhoneNumber = '8182744563', @Email = 'yesika@gmail.com';
SELECT *FROM Client;


--3.- Procedimiento almacenado de Transactions
CREATE PROCEDURE InsertBankTransactions
    @AccountID INT,
    @TransactionType INT,
    @Amount DECIMAL(10,2),
    @ExternalAccount INT = NULL
AS
BEGIN
    DECLARE @NewBalance DECIMAL(10,2);

    
    IF @TransactionType = 1
    BEGIN
        SET @NewBalance = (SELECT Balance FROM Account WHERE ID = @AccountID) + @Amount;
    END
    ELSE IF @TransactionType = 2
    BEGIN
        SET @NewBalance = (SELECT Balance FROM Account WHERE ID = @AccountID) - @Amount;
    END

    
    IF @NewBalance < 0
    BEGIN
        
        RETURN 'No se puede realizar la transacción. El saldo es menor a 0.';
    END

    
    INSERT INTO Transactions (AccountID, TransactionType, Amount, ExternalAccount, RegDate)
    VALUES (@AccountID, @TransactionType, @Amount, @ExternalAccount, GETDATE());
    
    
    UPDATE Account
    SET Balance = @NewBalance
    WHERE ID = @AccountID;
    
    
    RETURN 'Transacción realizada exitosamente.';
END;

SELECT *FROM Transactions;

--EJEMPLO
EXEC InsertBankTransactions @AccountID = 1, @TransactionType = 1, @Amount = -50, @ExternalAccount = NULL;

BACKUP DATABASE Bank
TO DISK = 'C:\Backup\Backup.bak'
WITH FORMAT, NAME = 'Bank Full Backup';


