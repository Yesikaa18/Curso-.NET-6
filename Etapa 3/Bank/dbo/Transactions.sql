CREATE TABLE [dbo].[Transactions] (
    [ID]              INT             IDENTITY (1, 1) NOT NULL,
    [AccountID]       INT             NOT NULL,
    [TransactionType] INT             NOT NULL,
    [Amount]          DECIMAL (10, 2) NOT NULL,
    [ExternalAccount] INT             NULL,
    [RegDate]         DATETIME        DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([AccountID]) REFERENCES [dbo].[Account] ([ID]),
    FOREIGN KEY ([TransactionType]) REFERENCES [dbo].[TransactionType] ([ID])
);


GO

