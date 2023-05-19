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

GO

