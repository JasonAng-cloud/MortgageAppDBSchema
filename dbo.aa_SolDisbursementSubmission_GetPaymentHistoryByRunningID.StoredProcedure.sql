/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentHistoryByRunningID]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetPaymentHistoryByRunningID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetPaymentHistoryByRunningID]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentHistoryByRunningID]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE       procedure [dbo].[aa_SolDisbursementSubmission_GetPaymentHistoryByRunningID]
@arn nvarchar(100) = null ,
@runningid nvarchar(100) = null
as
begin
	
	SELECT 
		[SubmissionFrom], 
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
		  ,[AccountFrom]
		  ,[CreatedDate]
		  ,[UpdatedDate]
		  ,RunningIDForCompletedSubmission		  
	  FROM [dbo].vw_aaDisbursementPaymentHistory
	  where arn = @arn 
		and RunningIDForCompletedSubmission= @runningid

end 
GO
