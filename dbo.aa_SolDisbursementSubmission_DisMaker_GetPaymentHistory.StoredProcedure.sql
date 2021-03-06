/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentHistory]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentHistory]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentHistory]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create       procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentHistory]
@arn nvarchar(100) = null 
as
begin
	
	SELECT [SubmissionFrom], 
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
		  ,RunningIDForCompletedSubmission	  
		  ,AccountFrom
	  FROM [dbo].vw_aaDisbursementPaymentHistory	  
	  where 
		--PaymentReference <> 'Legal Fee' 
		--and PaymentReference <> 'Valuation Fee'
		--and 
		arn = @arn 

end 
GO
