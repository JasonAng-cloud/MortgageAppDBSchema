/****** Object:  View [dbo].[vw_aaSolDisbursementSubmissionIncludeHistory]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aaSolDisbursementSubmissionIncludeHistory]'))
DROP VIEW [dbo].[vw_aaSolDisbursementSubmissionIncludeHistory]
GO
/****** Object:  View [dbo].[vw_aaSolDisbursementSubmissionIncludeHistory]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE           VIEW [dbo].[vw_aaSolDisbursementSubmissionIncludeHistory] AS

	SELECT [arn]
      ,[BalanceAdviceLetterApplicableFlag]
      ,[UrgentFlag]
      ,[LS_RedemptionDueDateFlag]
      ,[LS_RedemptionDueDate]
      ,[LS_ExtendedCompletionDateFlag]
      ,[LS_CompletionDate]
      ,[LS_ExtendedCompletionDate]
      ,[PR_DeveloperBillingDueDateFlag]
      ,[PR_Stage2AFlag]
      ,[PR_Stage2BFlag]
      ,[PR_Stage2CFlag]
      ,[PR_Stage2DFlag]
      ,[PR_Stage2EFlag]
      ,[PR_Stage2FFlag]
      ,[PR_Stage2GFlag]
      ,[PR_Stage2HFlag]
      ,[PR_StageOthers]
      ,[PR_EarliestBillingDueDate]
      ,[PR_TotalBillingAmount]
      ,[PR_AnyBridgingFinancierFlag]
      ,[PR_BridgingFinancier]
      ,[PR_BridgingFinancierEmailAddress]
      ,[PR_BridgingFinancierRedemptionSum]
      ,[PR_RedemptionPaymentAccountNumber]
      ,[PR_BeneficiaryBank]
      ,[PR_BridgingFinancierRedemptionExpiryDate]
      ,[PR_DeveloperName]
      ,[PR_DeveloperEmailAddress]
      ,[PR_DeveloperPIC]
      ,[PR_DeveloperHDA]
      ,[PR_DeveloperHDABank]
      ,[LF_PayeeName]
      ,[LF_BilledAmount]
      ,[LF_AccountNumber]
      ,[LF_Bank]
      ,[LF_PaymentDescription]
      ,[LF_PaymentMode]
      ,[UpdateInfo_Reason]
      ,[UpdateInfo_Others]
      ,[CancelLoan_Remarks]
      ,[CancelLoan_File]
      ,[SolicitorSubmissionOption]
      ,[SolicitorSubmissionCompleted]
      ,[SolicitorCode]
      ,[SolicitorSubmissionDate]
      ,[SolicitorSubmissionPDFID]
      ,[DisbursementMakerEmailAddress]
      ,[DisbursementMakerDecision]
      ,[DisbursementMakerSubmissionCompleted]
      ,[DisbursementMakerRejectionReason]
      ,[DisbursementMakerSubmissionDate]
      ,[DisbursementMakerSubmissionPDFID]
      ,[DisbursementCheckerEmailAddress]
      ,[DisbursementCheckerDecision]
      ,[DisbursementCheckerSubmissionCompleted]
      ,[DisbursementCheckerRejectionReason]
      ,[DisbursementCheckerSubmissionDate]
      ,[DisbursementCheckerPDFID]
      ,[RCOMakerEmailAddress]
      ,[RCOMakerDecision]
      ,[RCOMakerSubmissionCompleted]
      ,[RCOMakerRejectionReason]
      ,[RCOMakerSubmissionDate]
      ,[RCOMakerPDFID]
      ,[RCOCheckerEmailAddress]
      ,[RCOCheckerDecision]
      ,[RCOCheckerSubmissionCompleted]
      ,[RCOCheckerRejectionReason]
      ,[RCOCheckerSubmissionDate]
      ,[RCOCheckerPDFID]
      ,[CreatedDate]
      ,[UpdatedDate]
		,0 as RunningIDForCompletedSubmission 
	from vw_aaSolDisbursementSubmission
	
	union 
		
	SELECT history.[arn]
      ,history.[BalanceAdviceLetterApplicableFlag]
      ,history.[UrgentFlag]
      ,history.[LS_RedemptionDueDateFlag]
      ,history.[LS_RedemptionDueDate]
      ,history.[LS_ExtendedCompletionDateFlag]
      ,history.[LS_CompletionDate]
      ,history.[LS_ExtendedCompletionDate]
      ,history.[PR_DeveloperBillingDueDateFlag]
      ,history.[PR_Stage2AFlag]
      ,history.[PR_Stage2BFlag]
      ,history.[PR_Stage2CFlag]
      ,history.[PR_Stage2DFlag]
      ,history.[PR_Stage2EFlag]
      ,history.[PR_Stage2FFlag]
      ,history.[PR_Stage2GFlag]
      ,history.[PR_Stage2HFlag]
      ,history.[PR_StageOthers]
      ,history.[PR_EarliestBillingDueDate]
      ,history.[PR_TotalBillingAmount]
      ,history.[PR_AnyBridgingFinancierFlag]
      ,history.[PR_BridgingFinancier]
      ,history.[PR_BridgingFinancierEmailAddress]
      ,history.[PR_BridgingFinancierRedemptionSum]
      ,history.[PR_RedemptionPaymentAccountNumber]
      ,history.[PR_BeneficiaryBank]
      ,history.[PR_BridgingFinancierRedemptionExpiryDate]
      ,history.[PR_DeveloperName]
      ,history.[PR_DeveloperEmailAddress]
      ,history.[PR_DeveloperPIC]
      ,history.[PR_DeveloperHDA]
      ,history.[PR_DeveloperHDABank]
      ,history.[LF_PayeeName]
      ,history.[LF_BilledAmount]
      ,history.[LF_AccountNumber]
      ,history.[LF_Bank]
      ,history.[LF_PaymentDescription]
      ,history.[LF_PaymentMode]
      ,history.[UpdateInfo_Reason]
      ,history.[UpdateInfo_Others]
      ,history.[CancelLoan_Remarks]
      ,history.[CancelLoan_File]
      ,history.[SolicitorSubmissionOption]
      ,history.[SolicitorSubmissionCompleted]
      ,history.[SolicitorCode]
      ,history.[SolicitorSubmissionDate]
      ,history.[SolicitorSubmissionPDFID]
      ,history.[DisbursementMakerEmailAddress]
      ,history.[DisbursementMakerDecision]
      ,history.[DisbursementMakerSubmissionCompleted]
      ,history.[DisbursementMakerRejectionReason]
      ,history.[DisbursementMakerSubmissionDate]
      ,history.[DisbursementMakerSubmissionPDFID]
      ,history.[DisbursementCheckerEmailAddress]
      ,history.[DisbursementCheckerDecision]
      ,history.[DisbursementCheckerSubmissionCompleted]
      ,history.[DisbursementCheckerRejectionReason]
      ,history.[DisbursementCheckerSubmissionDate]
      ,history.[DisbursementCheckerPDFID]
      ,history.[RCOMakerEmailAddress]
      ,history.[RCOMakerDecision]
      ,history.[RCOMakerSubmissionCompleted]
      ,history.[RCOMakerRejectionReason]
      ,history.[RCOMakerSubmissionDate]
      ,history.[RCOMakerPDFID]
      ,history.[RCOCheckerEmailAddress]
      ,history.[RCOCheckerDecision]
      ,history.[RCOCheckerSubmissionCompleted]
      ,history.[RCOCheckerRejectionReason]
      ,history.[RCOCheckerSubmissionDate]
      ,history.[RCOCheckerPDFID]
      ,history.[CreatedDate]
      ,history.[UpdatedDate]
      ,history.[RunningIDForCompletedSubmission]
	from aaSolDisbursementSubmission_history history 
	inner join 
	(
		select arn, max(RunningIDForCompletedSubmission) as maxRunningIDForCompletedSubmission from aaSolDisbursementSubmission_history group by arn 
	) tbl on tbl.arn = history.arn and tbl.maxRunningIDForCompletedSubmission = history.RunningIDForCompletedSubmission

GO
