/****** Object:  View [dbo].[vw_aaDisbursementPaymentHistory]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aaDisbursementPaymentHistory]'))
DROP VIEW [dbo].[vw_aaDisbursementPaymentHistory]
GO
/****** Object:  View [dbo].[vw_aaDisbursementPaymentHistory]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE                 VIEW [dbo].[vw_aaDisbursementPaymentHistory] AS


SELECT 'Bank' as [SubmissionFrom], 
	[arn]
      ,RunningIDForCurrentSubmission
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
      ,RunningIDForCompletedSubmission
	  ,[AccountFrom]	  
	  from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
union 
SELECT 
	'Solicitor' as [SubmissionFrom], 
	[arn]
      ,RunningIDForCurrentSubmission
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
      ,RunningIDForCompletedSubmission
	  ,[AccountFrom]	  
from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history


GO
