/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]
GO
/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE           procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]
@arn nvarchar(max) = null ,
@billingid bigint = null ,
@FacilityAccountNumber nvarchar(max) = null ,
@PaymentMode nvarchar(max) = null ,
@PayeeID nvarchar(max) = null ,
@PayeeName nvarchar(max) = null ,
@BeneficiaryBank nvarchar(max) = null ,
@BeneficiaryBankAccountNumber nvarchar(max) = null ,
@AmountDisburse nvarchar(max) = null ,
@PaymentReference nvarchar(max) = null ,
@PaymentDescription nvarchar(max) = null ,
@AccountFrom nvarchar(max) = null ,
@MakerEmail nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	
	set @Error = ''

	if(@BeneficiaryBankAccountNumber is not null or ltrim(rtrim(@BeneficiaryBankAccountNumber)) <> '' )
	begin
		if (isnumeric(@BeneficiaryBankAccountNumber) = 0)
		begin
			set @Error = 'Beneficiary Bank Account Number field must be a number'	
		end
	end 

	if (@Error = '')
	begin
		if 
		(
			@PaymentMode is null or ltrim(rtrim(@PaymentMode)) = '' or
			--@PayeeID is null or ltrim(rtrim(@PayeeID)) = '' or
			@PayeeName is null or ltrim(rtrim(@PayeeName)) = '' or
			@BeneficiaryBank is null or ltrim(rtrim(@BeneficiaryBank)) = '' or
			@BeneficiaryBankAccountNumber is null or ltrim(rtrim(@BeneficiaryBankAccountNumber)) = '' or
			@AmountDisburse is null or ltrim(rtrim(@AmountDisburse)) = '' or
			@PaymentReference is null or ltrim(rtrim(@PaymentReference)) = '' or
			@PaymentDescription is null or ltrim(rtrim(@PaymentDescription)) = ''		or
			@AccountFrom is null or ltrim(rtrim(@AccountFrom)) = ''		
		)
		begin
			set @Error = 'Please fill up all mandatory fields'
		end 

		if (@Error = '')
		begin
			if exists 
			(
				select 1
				from aaIntDisbursementSubmission
				where DisbursementMakerSubmissionCompleted = 1
					and arn = @arn 					
			)
			begin
				set @Error = 'The record is submitted. You are not allowed to add further payment until bank approve/reject the current submission'
			end 
		end 


		if (@Error = '')
		begin
			declare @RunningIDForCurrentSubmission int 
			if not exists 
			(
				select 1
				from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 					
			)
			begin
				set @RunningIDForCurrentSubmission = 1
			end 
			else
			begin
				declare @LastMaxRunningIDForCurrentSubmission int 
				select @LastMaxRunningIDForCurrentSubmission = max(RunningIDForCurrentSubmission)
				from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 					

				set @RunningIDForCurrentSubmission = @LastMaxRunningIDForCurrentSubmission + 1
			end 
		
			INSERT INTO [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]
           ([arn]
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
		   ,accountfrom
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
		   )
			values (@arn , @RunningIDForCurrentSubmission,@FacilityAccountNumber ,@PaymentMode  ,@PayeeID  ,@PayeeName,@BeneficiaryBank  ,@BeneficiaryBankAccountNumber  ,@AmountDisburse  ,@PaymentReference  ,@PaymentDescription, @accountfrom, getdate() , getdate(), null, null, null, null,null, null,null, null)
		end
	end 
	


end 
GO
