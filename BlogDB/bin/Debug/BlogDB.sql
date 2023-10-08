﻿/*
Deployment script for BlogDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "BlogDB"
:setvar DefaultFilePrefix "BlogDB"
:setvar DefaultDataPath "C:\Users\admin\AppData\Local\Microsoft\VisualStudio\SSDT\BlogProject"
:setvar DefaultLogPath "C:\Users\admin\AppData\Local\Microsoft\VisualStudio\SSDT\BlogProject"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
if not exists ( select 1 from dbo.[User])
begin
insert into dbo.[User](FirstName, MiddleName, LastName, Email, Password)
values ('Michael John','Torio', 'Pediglorio','michaelpediglorio@gmail.com', 'password')
end
GO

GO
PRINT N'Update complete.';


GO
