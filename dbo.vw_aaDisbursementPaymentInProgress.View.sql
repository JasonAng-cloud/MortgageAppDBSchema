/****** Object:  View [dbo].[vw_aaDisbursementPaymentInProgress]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aaDisbursementPaymentInProgress]'))
DROP VIEW [dbo].[vw_aaDisbursementPaymentInProgress]
GO
/****** Object:  View [dbo].[vw_aaDisbursementPaymentInProgress]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--select * from [vw_aaDisbursementPaymentInProgress]

CREATE       view  [dbo].[vw_aaDisbursementPaymentInProgress]
as
	SELECT 
		'Bank' as [SubmissionFrom]
		,[arn]
      ,[RunningIDForCurrentSubmission]
      ,[FacilityAccountNumber]
      ,[PaymentMode]
      ,[PayeeID]
      ,[PayeeName]
      ,[BeneficiaryBank]
      ,[BeneficiaryBankAccountNumber]
      ,[AmountDisburse]
      ,[PaymentReference]
      ,[PaymentDescription]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[DisMakerEmail]
      ,[DisMakerSubmissionDate]
      ,[DisCheckerEmail]
      ,[DisCheckerApprovedDate]
      ,[RCOMakerEmail]
      ,[RCOMakerApprovedDate]
      ,[RCOCheckerEmail]
      ,[RCOCheckerApprovedDate]
      ,[AccountFrom]
      --,[billingid]
  FROM [aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]    

  union 
 SELECT 
	'Solicitor' as [SubmissionFrom]
	, [arn]
      ,[RunningIDForCurrentSubmission]
      ,[FacilityAccountNumber]
      ,[PaymentMode]
      ,[PayeeID]
      ,[PayeeName]
      ,[BeneficiaryBank]
      ,[BeneficiaryBankAccountNumber]
      ,[AmountDisburse]
      ,[PaymentReference]
      ,[PaymentDescription]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[DisMakerEmail]
      ,[DisMakerSubmissionDate]
      ,[DisCheckerEmail]
      ,[DisCheckerApprovedDate]
      ,[RCOMakerEmail]
      ,[RCOMakerApprovedDate]
      ,[RCOCheckerEmail]
      ,[RCOCheckerApprovedDate]
      ,[AccountFrom]
	  --,null as billingid
  FROM [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
	


GO
