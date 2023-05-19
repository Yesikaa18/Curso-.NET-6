CREATE TABLE [dbo].[Account] (
    [ID]          INT             IDENTITY (1, 1) NOT NULL,
    [AccountType] INT             NOT NULL,
    [ClientID]    INT             NOT NULL,
    [Balance]     DECIMAL (10, 2) NOT NULL,
    [RegDate]     DATETIME        DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([AccountType]) REFERENCES [dbo].[AccountType] ([ID]),
    FOREIGN KEY ([ClientID]) REFERENCES [dbo].[Client] ([ID])
);


GO

