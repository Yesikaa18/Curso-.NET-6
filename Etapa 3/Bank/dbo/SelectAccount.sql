CREATE PROCEDURE SelectAccount
    @ClientID INT = NULL

AS 
    IF @ClientID IS NULL
    BEGIN 
        SELECT a.ID, acc.Name AS AccountName, c.Name AS ClientName, a.Balance, a.RegDate
        FROM Account a
        JOIN AccountType acc ON a.AccountType = acc.ID
        JOIN Client c ON a.ClientID = c.ID;
        
    END
    ELSE
    BEGIN
        SELECT a.ID, acc.Name AS AccountName, c.Name AS ClientName, a.Balance, a.RegDate
        FROM Account a
        JOIN AccountType acc ON a.AccountType = acc.ID
        JOIN Client c ON a.ClientID = c.ID
        WHERE a.ClientID = @ClientID;

    END

GO

