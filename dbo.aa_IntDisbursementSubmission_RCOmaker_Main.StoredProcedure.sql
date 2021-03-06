/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOmaker_Main]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOmaker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOmaker_Main]
GO
/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOmaker_Main]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE                procedure [dbo].[aa_IntDisbursementSubmission_RCOmaker_Main]
@arn nvarchar(max) = null ,
@billingid bigint = null, 
@RCOMakerEmailAddress  nvarchar(max) = null ,
@RCOMakerDecision nvarchar(max) = null ,
@RCOMakerSubmissionCompleted nvarchar(max) = null ,
@RCOMakerRejectionReason nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin	
	set @Error = ''

	if (@RCOMakerEmailAddress like 'K2:%')
	begin		
		set @RCOMakerEmailAddress = Stuff(@RCOMakerEmailAddress, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	if (@RCOMakerDecision = 'Reject' and @RCOMakerSubmissionCompleted = 1)
	begin
		if (ltrim(rtrim(@RCOMakerRejectionReason)) = '' or @RCOMakerRejectionReason is null)
		begin
			set @Error = 'Please fill in Remarks'
		end 
		
	end 

	

	if (@Error = '')
	begin						

		delete from [aaIntDisbursementSubmission_RCOMakerRejected]
		where arn = @arn

		if (@RCOMakerDecision = 'Reject' and @RCOMakerSubmissionCompleted = 1)
		begin
			INSERT INTO [dbo].[aaIntDisbursementSubmission_RCOMakerRejected]
			   ([arn]
			   ,[BalanceAdviceLetterApplicableFlag]
			   ,[UrgentFlag]
			   ,[LS_RedemptionDueDateFlag]
			   ,[LS_RedemptionDueDate]
			   ,[LS_ExtendedCompletionDateFlag]
			   ,[LS_CompletionDate]
			   ,[LS_ExtendedCompletionDate]
			   ,[PR_DeveloperBillingDueDateFlag]
			   ,[PR_Stage2AFlag]
			   ,[PR_Stage2BFlag]
			   ,[PR_Stage2CFlag]
			   ,[PR_Stage2DFlag]
			   ,[PR_Stage2EFlag]
			   ,[PR_Stage2FFlag]
			   ,[PR_Stage2GFlag]
			   ,[PR_Stage2HFlag]
			   ,[PR_StageOthers]
			   ,[PR_EarliestBillingDueDate]
			   ,[PR_TotalBillingAmount]
			   ,[PR_AnyBridgingFinancierFlag]
			   ,[PR_BridgingFinancier]
			   ,[PR_BridgingFinancierEmailAddress]
			   ,[PR_BridgingFinancierRedemptionSum]
			   ,[PR_RedemptionPaymentAccountNumber]
			   ,[PR_BeneficiaryBank]
			   ,[PR_BridgingFinancierRedemptionExpiryDate]
			   ,[PR_DeveloperName]
			   ,[PR_DeveloperEmailAddress]
			   ,[PR_DeveloperPIC]
			   ,[PR_DeveloperHDA]
			   ,[PR_DeveloperHDABank]
			   ,[LF_PayeeName]
			   ,[LF_BilledAmount]
			   ,[LF_AccountNumber]
			   ,[LF_Bank]
			   ,[LF_PaymentDescription]
			   ,[LF_PaymentMode]
			   ,[UpdateInfo_Reason]
			   ,[UpdateInfo_Others]
			   ,[CancelLoan_Remarks]
			   ,[CancelLoan_File]
			   ,[SolicitorSubmissionOption]
			   ,[SolicitorSubmissionCompleted]
			   ,[SolicitorCode]
			   ,[SolicitorSubmissionDate]
			   ,[SolicitorSubmissionPDFID]
			   ,[DisbursementMakerEmailAddress]
			   ,[DisbursementMakerDecision]
			   ,[DisbursementMakerSubmissionCompleted]
			   ,[DisbursementMakerRejectionReason]
			   ,[DisbursementMakerSubmissionDate]
			   ,[DisbursementMakerSubmissionPDFID]
			   ,[DisbursementCheckerEmailAddress]
			   ,[DisbursementCheckerDecision]
			   ,[DisbursementCheckerSubmissionCompleted]
			   ,[DisbursementCheckerRejectionReason]
			   ,[DisbursementCheckerSubmissionDate]
			   ,[DisbursementCheckerPDFID]			
			    ,[RCOMakerEmailAddress]
				,[RCOMakerDecision]
			   ,[RCOMakerSubmissionCompleted]
			   ,[RCOMakerRejectionReason]
			   ,[RCOMakerSubmissionDate]
			   ,[RCOMakerPDFID]
			   ,[RCOCheckerEmailAddress]
			   ,[RCOCheckerDecision]
			   ,[RCOCheckerSubmissionCompleted]
			   ,[RCOCheckerRejectionReason]
			   ,[RCOCheckerSubmissionDate]
			   ,[RCOCheckerPDFID]
			      ,[CreatedDate]
			   ,[UpdatedDate]			   
			   )
			   SELECT [arn]
				  ,[BalanceAdviceLetterApplicableFlag]
				  ,[UrgentFlag]
				  ,[LS_RedemptionDueDateFlag]
				  ,[LS_RedemptionDueDate]
				  ,[LS_ExtendedCompletionDateFlag]
				  ,[LS_CompletionDate]
				  ,[LS_ExtendedCompletionDate]
				  ,[PR_DeveloperBillingDueDateFlag]
				  ,[PR_Stage2AFlag]
				  ,[PR_Stage2BFlag]
				  ,[PR_Stage2CFlag]
				  ,[PR_Stage2DFlag]
				  ,[PR_Stage2EFlag]
				  ,[PR_Stage2FFlag]
				  ,[PR_Stage2GFlag]
				  ,[PR_Stage2HFlag]
				  ,[PR_StageOthers]
				  ,[PR_EarliestBillingDueDate]
				  ,[PR_TotalBillingAmount]
				  ,[PR_AnyBridgingFinancierFlag]
				  ,[PR_BridgingFinancier]
				  ,[PR_BridgingFinancierEmailAddress]
				  ,[PR_BridgingFinancierRedemptionSum]
				  ,[PR_RedemptionPaymentAccountNumber]
				  ,[PR_BeneficiaryBank]
				  ,[PR_BridgingFinancierRedemptionExpiryDate]
				  ,[PR_DeveloperName]
				  ,[PR_DeveloperEmailAddress]
				  ,[PR_DeveloperPIC]
				  ,[PR_DeveloperHDA]
				  ,[PR_DeveloperHDABank]
				  ,[LF_PayeeName]
				  ,[LF_BilledAmount]
				  ,[LF_AccountNumber]
				  ,[LF_Bank]
				  ,[LF_PaymentDescription]
				  ,[LF_PaymentMode]
				  ,[UpdateInfo_Reason]
				  ,[UpdateInfo_Others]
				  ,[CancelLoan_Remarks]
				  ,[CancelLoan_File]
				  ,[SolicitorSubmissionOption]
				  ,[SolicitorSubmissionCompleted]
				  ,[SolicitorCode]
				  ,[SolicitorSubmissionDate]
				  ,[SolicitorSubmissionPDFID]
				  ,[DisbursementMakerEmailAddress]
				  ,[DisbursementMakerDecision]
				  ,[DisbursementMakerSubmissionCompleted]
				  ,[DisbursementMakerRejectionReason]
				  ,[DisbursementMakerSubmissionDate]
				  ,[DisbursementMakerSubmissionPDFID]
				  ,DisbursementCheckerEmailAddress
				  ,DisbursementCheckerDecision
				  ,DisbursementCheckerSubmissionCompleted
				  ,DisbursementCheckerRejectionReason
				  ,[DisbursementCheckerSubmissionDate]
				  ,[DisbursementCheckerPDFID]				  
				  ,[RCOMakerEmailAddress]
				,@RCOMakerDecision
			   ,@RCOMakerSubmissionCompleted
			   ,@RCOMakerRejectionReason
			   ,getdate()
			   ,[RCOMakerPDFID]
			   ,[RCOCheckerEmailAddress]
			   ,[RCOCheckerDecision]
			   ,[RCOCheckerSubmissionCompleted]
			   ,[RCOCheckerRejectionReason]
			   ,[RCOCheckerSubmissionDate]
			   ,[RCOCheckerPDFID]
			   ,[CreatedDate]
				  ,[UpdatedDate]				
			  FROM [dbo].[aaintDisbursementSubmission]
			  where arn = @arn 

			update aaIntDisbursementSubmission
			set RCOMakerEmailAddress = null, 
				RCOMakerDecision = null, 
				RCOMakerSubmissionCompleted = null, 
				RCOMakerRejectionReason = null,
				[DisbursementCheckerSubmissionCompleted] = 0,				
				[UpdatedDate] = getdate()
			where arn = @arn 				

		end 
		else
		begin
			update aaIntDisbursementSubmission
			set RCOMakerEmailAddress = @RCOMakerEmailAddress, 
				RCOMakerDecision = @RCOMakerDecision, 
				RCOMakerSubmissionCompleted = @RCOMakerSubmissionCompleted, 
				RCOMakerRejectionReason = @RCOMakerRejectionReason,	
				[RCOMakerSubmissionDate] = getdate(),
				[UpdatedDate] = getdate()
			where arn = @arn 			
			
			update aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
			set RCOMakerEmail=@RCOMakerEmailAddress,
				RCOMakerApprovedDate= getdate()
			where arn = @arn 			
		end 
		 
	end

end 
GO
