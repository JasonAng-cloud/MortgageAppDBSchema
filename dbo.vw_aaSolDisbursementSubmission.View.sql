/****** Object:  View [dbo].[vw_aaSolDisbursementSubmission]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aaSolDisbursementSubmission]'))
DROP VIEW [dbo].[vw_aaSolDisbursementSubmission]
GO
/****** Object:  View [dbo].[vw_aaSolDisbursementSubmission]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE           VIEW [dbo].[vw_aaSolDisbursementSubmission] AS

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
		--,0 as RunningIDForCompletedSubmission 
	from aaSolDisbursementSubmission
	
	union 
		
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
	from aaSolDisbursementSubmission_staging 
GO
