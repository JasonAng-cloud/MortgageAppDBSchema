/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditTrailReportDetail_Select]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AdminOperationAuditTrailReportDetail_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AdminOperationAuditTrailReportDetail_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditTrailReportDetail_Select]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_AdminOperationAuditTrailReportDetail_Select]
@TableName nvarchar(max) = null ,
@Operation nvarchar(max) = null ,
@InsertedDate nvarchar(max) = null 
as
begin
	
SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeys]
      ,[OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName]
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      ,[Operator]
      ,[InsertedDateTime]
  FROM [dbo].[AdminOperationAuditLog]
where tablename = @TableName
	and operation = @Operation	
	and inserteddatetime = @InsertedDate
end
GO
