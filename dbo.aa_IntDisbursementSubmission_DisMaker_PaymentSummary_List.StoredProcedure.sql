/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_PaymentSummary_List]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_PaymentSummary_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_PaymentSummary_List]
GO
/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_PaymentSummary_List]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE             procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_PaymentSummary_List]
@arn nvarchar(100) = null ,
@billingid nvarchar(100) = null 
as
begin
	
	SELECT 
		accountfrom
		,'Current' as paymentstatus
		,[arn]
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
		,0 as RunningIDForCompletedSubmission		
	FROM [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]
	where 
		--(accountfrom is not null or ltrim(rtrim(accountfrom)) <>'') and  
			arn = @arn 				
	union 
	SELECT 
		[AccountFrom]
		,'Completed' as paymentstatus
		,[arn]
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
	FROM [dbo].vw_aaDisbursementPaymentHistory
	where arn = @arn 		
end 
GO
