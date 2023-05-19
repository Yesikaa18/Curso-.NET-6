CREATE TABLE [dbo].[Client] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (200) NOT NULL,
    [PhoneNumber] VARCHAR (40)  NOT NULL,
    [Email]       VARCHAR (50)  NULL,
    [RegDate]     DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

CREATE TRIGGER ClientAfterInsert
ON Client
AFTER INSERT
AS

    DECLARE @NewClientID INT;

    SET @NewClientID = (SELECT ID FROM inserted);

    INSERT INTO Account (AccountType, ClientID, Balance)
    VALUES(1,@NewClientID, 0);

GO

CREATE TRIGGER ClientInsteadOfDelete
ON Client
INSTEAD OF DELETE
AS

    DECLARE @DeletedID INT;

    SET @DeletedID = (SELECT ID FROM deleted);

    UPDATE Account SET ClientID = NULL
    WHERE ClientID = @DeletedID;

    DELETE FROM Client WHERE ID = @DeletedID;

GO

