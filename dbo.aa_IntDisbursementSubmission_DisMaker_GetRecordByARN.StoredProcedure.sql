/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetRecordByARN]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_GetRecordByARN]
GO
/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetRecordByARN]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE         procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetRecordByARN]
@arn nvarchar(100) = null ,
@billingid bigint = null 
as
begin
	SELECT 
		sqlloads.[arn], 
		--isnull(intsub.[SolicitorSubmissionOption],'Submitted') as 'SolicitorSubmissionOption',
		null as 'SolicitorSubmissionOption',
		--case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',	
		'Billing'  as 'Disbursement Stage',
		case when intsub.[UrgentFlag] is null then case when DATEDIFF(day, doc.DeveloperBillingDueDate, getdate()) > 10 then CAST(1 as bit) else CAST(0 as bit) end else intsub.[UrgentFlag] end as [UrgentFlag], 		
		--case when history.arn IS NOT NULL and sqlloads.disbursementmanner = 'LS' then cast(0 as bit) else intsub.[BalanceAdviceLetterApplicableFlag] end as 'BalanceAdviceLetterApplicableFlag',      
		null as 'BalanceAdviceLetterApplicableFlag',      
		intsub.[LS_RedemptionDueDateFlag]
		,intsub.[LS_RedemptionDueDate]
		,intsub.[LS_ExtendedCompletionDateFlag]
		,case when intsub.[LS_CompletionDate] is not null then intsub.[LS_CompletionDate] else doc.SNPCompletionDate end as 'LS_CompletionDate'
		,case when intsub.[LS_ExtendedCompletionDate] is not null then intsub.[LS_ExtendedCompletionDate] else doc.SNPExtendedCompletionDate end as 'LS_ExtendedCompletionDate'		
		,isnull(intsub.[PR_DeveloperBillingDueDateFlag],cast(1 as bit)) as 'PR_DeveloperBillingDueDateFlag'
		,intsub.[PR_Stage2AFlag]
		,intsub.[PR_Stage2BFlag]
		,intsub.[PR_Stage2CFlag]
		,intsub.[PR_Stage2DFlag]
		,intsub.[PR_Stage2EFlag]
		,intsub.[PR_Stage2FFlag]
		,intsub.[PR_Stage2GFlag]
		,intsub.[PR_Stage2HFlag]
		,intsub.[PR_StageOthers]
		--,intsub.[PR_EarliestBillingDueDate]
		,case when intsub.PR_EarliestBillingDueDate is null then doc.DeveloperBillingDueDate else intsub.PR_EarliestBillingDueDate end as 'PR_EarliestBillingDueDate'		
		,intsub.[PR_TotalBillingAmount]
		/*
		,case when history.[PR_AnyBridgingFinancierFlag] is not null then history.[PR_AnyBridgingFinancierFlag] else isnull(intsub.[PR_AnyBridgingFinancierFlag],cast(1 as bit)) end as 'PR_AnyBridgingFinancierFlag'
		,case when history.[PR_BridgingFinancier] is not null then history.[PR_BridgingFinancier] else intsub.[PR_BridgingFinancier] end as 'PR_BridgingFinancier'
		,case when history.[PR_BridgingFinancierEmailAddress] is not null then history.[PR_BridgingFinancierEmailAddress] else intsub.[PR_BridgingFinancierEmailAddress] end as 'PR_BridgingFinancierEmailAddress'
		,case when history.[PR_BridgingFinancierRedemptionSum] is not null then history.[PR_BridgingFinancierRedemptionSum] else intsub.[PR_BridgingFinancierRedemptionSum] end as 'PR_BridgingFinancierRedemptionSum'
		,case when history.[PR_RedemptionPaymentAccountNumber] is not null then history.[PR_RedemptionPaymentAccountNumber] else intsub.[PR_RedemptionPaymentAccountNumber] end as 'PR_RedemptionPaymentAccountNumber'
		,case when history.[PR_BeneficiaryBank] is not null then history.[PR_BeneficiaryBank] else intsub.[PR_BeneficiaryBank] end as 'PR_BeneficiaryBank'
		,case when history.[PR_BridgingFinancierRedemptionExpiryDate] is not null then history.[PR_BridgingFinancierRedemptionExpiryDate] else intsub.[PR_BridgingFinancierRedemptionExpiryDate] end as 'PR_BridgingFinancierRedemptionExpiryDate'
		,case when history.[PR_DeveloperName] is not null then history.[PR_DeveloperName] else intsub.[PR_DeveloperName] end as 'PR_DeveloperName'
		,case when history.[PR_DeveloperEmailAddress] is not null then history.[PR_DeveloperEmailAddress] else intsub.[PR_DeveloperEmailAddress] end as 'PR_DeveloperEmailAddress'
		,case when history.[PR_DeveloperPIC] is not null then history.[PR_DeveloperPIC] else intsub.[PR_DeveloperPIC] end as 'PR_DeveloperPIC'
		,case when history.[PR_DeveloperHDA] is not null then history.[PR_DeveloperHDA] else intsub.[PR_DeveloperPIC] end as 'PR_DeveloperHDA'
		,case when history.[PR_DeveloperHDABank] is not null then history.[PR_DeveloperHDABank] else intsub.[PR_DeveloperHDABank] end as 'PR_DeveloperHDABank'		
		*/
		, isnull(intsub.[PR_AnyBridgingFinancierFlag],cast(1 as bit)) as 'PR_AnyBridgingFinancierFlag'
		,intsub.[PR_BridgingFinancier] as 'PR_BridgingFinancier'
		,intsub.[PR_BridgingFinancierEmailAddress] as 'PR_BridgingFinancierEmailAddress'
		,intsub.[PR_BridgingFinancierRedemptionSum] as 'PR_BridgingFinancierRedemptionSum'
		, intsub.[PR_RedemptionPaymentAccountNumber]  as 'PR_RedemptionPaymentAccountNumber'
		, intsub.[PR_BeneficiaryBank]  as 'PR_BeneficiaryBank'
		, intsub.[PR_BridgingFinancierRedemptionExpiryDate]  as 'PR_BridgingFinancierRedemptionExpiryDate'
		, intsub.[PR_DeveloperName]  as 'PR_DeveloperName'
		, intsub.[PR_DeveloperEmailAddress]  as 'PR_DeveloperEmailAddress'
		, intsub.[PR_DeveloperPIC]  as 'PR_DeveloperPIC'
		, intsub.[PR_DeveloperPIC]  as 'PR_DeveloperHDA'
		, intsub.[PR_DeveloperHDABank]  as 'PR_DeveloperHDABank'

		,case when intsub.[LF_PayeeName] is not null then intsub.[LF_PayeeName] else sqlloads.SolicitorName end as 'LF_PayeeName'
		--,intsub.[LF_BilledAmount]
		,case when intsub.LF_BilledAmount is not null then intsub.LF_BilledAmount else sqlloads.LegalFeesFinancedAmount end as 'LF_BilledAmount'		
		,intsub.[LF_AccountNumber]
		,intsub.[LF_Bank]
		,intsub.[LF_PaymentDescription]
		,isnull(intsub.[LF_PaymentMode],'IBG') as 'LF_PaymentMode'
		,isnull(intsub.[UpdateInfo_Reason],'Others') as 'UpdateInfo_Reason'
		,intsub.[UpdateInfo_Others]
		,intsub.[CancelLoan_Remarks]
		,intsub.[CancelLoan_File]     
		,intsub.[SolicitorSubmissionCompleted]
		,intsub.[SolicitorCode]
		,intsub.[SolicitorSubmissionDate]   
		 ,intsub.[DisbursementMakerEmailAddress]
      ,intsub.[DisbursementMakerDecision]
      ,intsub.[DisbursementMakerSubmissionCompleted]
      ,intsub.[DisbursementMakerRejectionReason]
      ,intsub.[DisbursementMakerSubmissionDate]      
      ,intsub.[DisbursementCheckerEmailAddress]
      ,intsub.[DisbursementCheckerDecision]
      ,intsub.[DisbursementCheckerSubmissionCompleted]
      ,intsub.[DisbursementCheckerRejectionReason]
      ,intsub.[DisbursementCheckerSubmissionDate]
      ,intsub.[CreatedDate]
      ,intsub.[UpdatedDate]	  	  
	FROM sqlloads 
		inner join [dbo].[aaIntDisbursementSubmission] intsub on intsub.arn = sqlloads.arn 		
		left join SQLSolicitorDPSubmission doc on doc.arn = intsub.arn 		
	where 
		intsub.arn =@arn 		
end 
GO
