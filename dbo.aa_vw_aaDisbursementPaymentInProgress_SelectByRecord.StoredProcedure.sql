/****** Object:  StoredProcedure [dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByRecord]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByRecord]
GO
/****** Object:  StoredProcedure [dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByRecord]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByRecord]
@arn nvarchar(100) = null ,
@SubmissionFrom nvarchar(max) = null ,
@RunningIDForCurrentSubmission bigint = null
as
begin	
	SELECT [SubmissionFrom]
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
	FROM [dbo].[vw_aaDisbursementPaymentInProgress]
	where arn = @arn 
	and [SubmissionFrom] = 'Bank'
	and [RunningIDForCurrentSubmission] = @RunningIDForCurrentSubmission	
	

end 
GO
