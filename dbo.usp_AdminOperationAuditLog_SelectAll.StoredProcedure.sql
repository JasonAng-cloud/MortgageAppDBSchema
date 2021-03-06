/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditLog_SelectAll]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AdminOperationAuditLog_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AdminOperationAuditLog_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditLog_SelectAll]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_AdminOperationAuditLog_SelectAll]
as
begin	
	/*
	SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeysview]  as [OperationPrimaryKeys]
      ,[OperationPrimaryKeysValueview] as [OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName] 
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      ,REPLACE([Operator], 'k2:', '') as [Operator]
      ,[InsertedDateTime]
  FROM [dbo].[AdminOperationAuditLog]
	where TableName not in ('[aaSolDisbursementSubmission_BankInfo]','aaSolDisbursementSubmission_BankInfo','aaSolDisbursementSubmission_PaymentReference','SQLDUMakerDP_AttorneyCentre','SQLDUMakerDP_AttorneyName','SQLSolicitor','sqlvaluer')
		and [Operation] = 'EDIT'
		and TableName in ('UserRoleMetric')
		union 
	*/
	SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeys]
      ,[OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName]
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      ,REPLACE([Operator], 'k2:', '') as [Operator]
      ,[InsertedDateTime]
  FROM [dbo].[AdminOperationAuditLog]
	where TableName not in ('[aaSolDisbursementSubmission_BankInfo]','aaSolDisbursementSubmission_BankInfo','aaSolDisbursementSubmission_PaymentReference','SQLDUMakerDP_AttorneyCentre','SQLDUMakerDP_AttorneyName','SQLSolicitor','sqlvaluer')
		and [Operation] <> 'UPDATE'
		and TableName not in ('UserRoleMetric','InternalUserRole','IntUsr_Adm_SecuritySetting','IntUsr_Adm_ApplicationSetting' )
	union 
	SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeysView] as [OperationPrimaryKeys]
      ,[OperationPrimaryKeysValueView] as [OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName]
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      ,REPLACE([Operator], 'k2:', '') as [Operator]
      ,[InsertedDateTime]
  FROM [dbo].[AdminOperationAuditLog]
	where TableName not in ('[aaSolDisbursementSubmission_BankInfo]','aaSolDisbursementSubmission_BankInfo','aaSolDisbursementSubmission_PaymentReference','SQLDUMakerDP_AttorneyCentre','SQLDUMakerDP_AttorneyName','SQLSolicitor','sqlvaluer')
		and [Operation] <> 'UPDATE'
		and TableName in ('InternalUserRole')
	union 
	SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeys] as [OperationPrimaryKeys]
      ,[OperationPrimaryKeysValue] as [OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName]
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      ,REPLACE([Operator], 'k2:', '') as [Operator]
      ,[InsertedDateTime]
  FROM [dbo].[AdminOperationAuditLog2]
	where TableName not in ('[aaSolDisbursementSubmission_BankInfo]','aaSolDisbursementSubmission_BankInfo','aaSolDisbursementSubmission_PaymentReference','SQLDUMakerDP_AttorneyCentre','SQLDUMakerDP_AttorneyName','SQLSolicitor','sqlvaluer')
		
end 
GO
