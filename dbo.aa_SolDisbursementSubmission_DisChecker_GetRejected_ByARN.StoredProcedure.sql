/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejected_ByARN]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejected_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejected_ByARN]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejected_ByARN]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE       procedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejected_ByARN]
@arn nvarchar(100) = null 
as
begin

	
	SELECT solsub.[arn]
		,solsub.[BalanceAdviceLetterApplicableFlag]
		,solsub.[UrgentFlag]
		,solsub.[LS_RedemptionDueDateFlag]
		,solsub.[LS_RedemptionDueDate]
		,solsub.[LS_ExtendedCompletionDateFlag]
		,solsub.[LS_CompletionDate]
		,solsub.[LS_ExtendedCompletionDate]
		,solsub.[PR_DeveloperBillingDueDateFlag]
		,solsub.[PR_Stage2AFlag]
		,solsub.[PR_Stage2BFlag]
		,solsub.[PR_Stage2CFlag]
		,solsub.[PR_Stage2DFlag]
		,solsub.[PR_Stage2EFlag]
		,solsub.[PR_Stage2FFlag]
		,solsub.[PR_Stage2GFlag]
		,solsub.[PR_Stage2HFlag]
		,solsub.[PR_StageOthers]
		,solsub.[PR_EarliestBillingDueDate]
		,solsub.[PR_TotalBillingAmount]
		,solsub.[PR_AnyBridgingFinancierFlag]
		,solsub.[PR_BridgingFinancier]
		,solsub.[PR_BridgingFinancierEmailAddress]
		,solsub.[PR_BridgingFinancierRedemptionSum]
		,solsub.[PR_RedemptionPaymentAccountNumber]
		,solsub.[PR_BeneficiaryBank]
		,solsub.[PR_BridgingFinancierRedemptionExpiryDate]
		,solsub.[PR_DeveloperName]
		,solsub.[PR_DeveloperEmailAddress]
		,solsub.[PR_DeveloperPIC]
		,solsub.[PR_DeveloperHDA]
		,solsub.[PR_DeveloperHDABank]
		,solsub.[LF_PayeeName]
		,solsub.[LF_BilledAmount]
		,solsub.[LF_AccountNumber]
		,solsub.[LF_Bank]
		,solsub.[LF_PaymentDescription]
		,solsub.[LF_PaymentMode]
		,solsub.[UpdateInfo_Reason]
		,solsub.[UpdateInfo_Others]
		,solsub.[CancelLoan_Remarks]
		,solsub.[CancelLoan_File]
		,solsub.[SolicitorSubmissionOption]
		,solsub.[SolicitorSubmissionCompleted]
		,solsub.[SolicitorCode]
		,solsub.[SolicitorSubmissionDate]
		,solsub.[SolicitorSubmissionPDFID]
		,solsub.[DisbursementMakerEmailAddress]
		,solsub.[DisbursementMakerDecision]
		,solsub.[DisbursementMakerSubmissionCompleted]
		,solsub.[DisbursementMakerRejectionReason]
		,solsub.[DisbursementMakerSubmissionDate]
		,solsub.[DisbursementMakerSubmissionPDFID]
		,solsub.[DisbursementCheckerEmailAddress]
		,solsub.[DisbursementCheckerDecision]
		,solsub.[DisbursementCheckerSubmissionCompleted]
		,solsub.[DisbursementCheckerRejectionReason]
		,solsub.[DisbursementCheckerSubmissionDate]
		,solsub.[DisbursementCheckerPDFID]
		,solsub.[RCOMakerEmailAddress]
      ,solsub.[RCOMakerDecision]
      ,solsub.[RCOMakerSubmissionCompleted]
      ,solsub.[RCOMakerRejectionReason]
      ,solsub.[RCOMakerSubmissionDate]
      ,solsub.[RCOMakerPDFID]
      ,solsub.[RCOCheckerEmailAddress]
      ,solsub.[RCOCheckerDecision]
      ,solsub.[RCOCheckerSubmissionCompleted]
      ,solsub.[RCOCheckerRejectionReason]
      ,solsub.[RCOCheckerSubmissionDate]
      ,solsub.[RCOCheckerPDFID]
		,solsub.[CreatedDate]
		,solsub.[UpdatedDate]
		,case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage'		
	FROM [dbo].[aaSolDisbursementSubmission_DisCheckerRejected] solsub
		left join aaSolDisbursementSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1
	where solsub.arn = @arn 
end 
GO
