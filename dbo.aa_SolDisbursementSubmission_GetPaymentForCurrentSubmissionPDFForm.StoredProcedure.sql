/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmissionPDFForm]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmissionPDFForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmissionPDFForm]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmissionPDFForm]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE         procedure [dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmissionPDFForm]
@arn nvarchar(100) = null 
as
begin
	
	SELECT [arn]
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
	  FROM [dbo].[aaSolDisbursementSubmission_PaymentDetail_staging]
	  where arn = @arn 

end 
GO
