/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]
GO
/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE           procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]
@arn nvarchar(100) = null ,
@billingid bigint = null 
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
		  ,[AccountFrom]		  
	  FROM [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]
	  where arn = @arn 		

end 
GO
