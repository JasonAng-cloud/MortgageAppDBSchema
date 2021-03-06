/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditLog_SelectAll_UserMetric]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AdminOperationAuditLog_SelectAll_UserMetric]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AdminOperationAuditLog_SelectAll_UserMetric]
GO
/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditLog_SelectAll_UserMetric]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     procedure [dbo].[usp_AdminOperationAuditLog_SelectAll_UserMetric]
as
begin
	SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeys]
      ,[OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName]
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      ,REPLACE([Operator], 'k2:', '') as [Operator]
      ,[InsertedDateTime]
  FROM [dbo].AdminOperationAuditLog_UserMetric
	
end 
GO
