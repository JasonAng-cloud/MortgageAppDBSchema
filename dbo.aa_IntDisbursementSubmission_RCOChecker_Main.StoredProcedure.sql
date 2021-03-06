/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_Main]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOChecker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOChecker_Main]
GO
/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_Main]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE                  procedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_Main]
@arn nvarchar(max) = null ,
@billingid bigint = null, 
@RCOCheckerEmailAddress  nvarchar(max) = null ,
@RCOCheckerDecision nvarchar(max) = null ,
@RCOCheckerSubmissionCompleted nvarchar(max) = null ,
@RCOCheckerRejectionReason nvarchar(max) = null ,
@Error nvarchar(max) = null output ,
@RunningIDForCompletedSubmission bigint = null output
as
begin	
	set @Error = ''

	if (@RCOCheckerDecision = 'Reject' and @RCOCheckerSubmissionCompleted = 1)
	begin
		if (ltrim(rtrim(@RCOCheckerRejectionReason)) = '' or @RCOCheckerRejectionReason is null)
		begin
			set @Error = 'Please fill in Remarks'
		end 
		
	end 

	

	if (@Error = '')
	begin						

		delete from [aaIntDisbursementSubmission_RCOCheckerRejected]
		where arn = @arn 

		if (@RCOCheckerDecision = 'Reject' and @RCOCheckerSubmissionCompleted = 1)
		begin
			INSERT INTO [dbo].[aaIntDisbursementSubmission_RCOCheckerRejected]
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
				,RCOMakerDecision
			   ,RCOMakerSubmissionCompleted
			   ,RCOMakerRejectionReason
			   ,RCOMakersubmissiondate
			   ,[RCOMakerPDFID]
			   ,@RCOCheckerEmailAddress
			   ,@RCOCheckerDecision
			   ,@RCOCheckerSubmissionCompleted
			   ,@RCOCheckerRejectionReason
			   ,getdate()
			   ,[RCOCheckerPDFID]
			   ,[CreatedDate]
				  ,[UpdatedDate]				 
			  FROM [dbo].[aaintDisbursementSubmission]
			  where arn = @arn 				

			update aaIntDisbursementSubmission
			set RCOCheckerEmailAddress = null, 
				RCOCheckerDecision = null, 
				RCOCheckerSubmissionCompleted = null, 
				RCOCheckerRejectionReason = null,
				[RCOMakerSubmissionCompleted] = 0,				
				[UpdatedDate] = getdate()
			where arn = @arn 				

		end 
		else
		begin
			update aaIntDisbursementSubmission
			set RCOCheckerEmailAddress = @RCOCheckerEmailAddress, 
				RCOCheckerDecision = @RCOCheckerDecision, 
				RCOCheckerSubmissionCompleted = @RCOCheckerSubmissionCompleted, 
				RCOCheckerRejectionReason = @RCOCheckerRejectionReason,	
				[RCOCheckerSubmissionDate] = getdate(),
				[UpdatedDate] = getdate()
			where arn = @arn 				
			
			update aaIntDisbursementSubmission_RCOCheckerSubmissionPaymentDetail
			set RCOCheckerEmail=@RCOCheckerEmailAddress,
				RCOCheckerApprovedDate= getdate()
			where arn = @arn 				
		end 
		 
		 
		if exists 
		(
			select 1
			from aaIntDisbursementSubmission
			where RCOCheckerSubmissionCompleted = 1 
				and arn = @arn 				
		)
		begin
			if exists 
			(
				select 1
				from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 					
			)
			begin

				declare @runningid int 
				if not exists 
				(
					select 1
					from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
					where arn = @arn 
				)
				begin
					set @runningid = 1
				end 
				else
				begin
					declare @previousmaxrunningid int 
					select @previousmaxrunningid = max(RunningIDForCompletedSubmission)
					from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
					where arn = @arn 

					set @runningid = @previousmaxrunningid + 1
				end 

				insert into aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
				select *,@runningid from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 					

				delete from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 					
			end 

			/*
			declare @runningid2 int 
			if not exists 
			(
				select 1
				from aaIntDisbursementSubmission_History
				where arn = @arn 
			)
			begin
				set @runningid2 = 1
			end 
			else
			begin
				declare @previousmaxrunningid2 int 
				select @previousmaxrunningid2 = max(RunningIDForCompletedSubmission)
				from aaIntDisbursementSubmission_History
				where arn = @arn 

				set @runningid2 = @previousmaxrunningid + 1
			end 
			*/

			insert into aaIntDisbursementSubmission_History  ([arn]
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
           ,[UpdatedDate] )
			select * 
			from aaIntDisbursementSubmission
			where arn = @arn 									

			delete from aaIntDisbursementSubmission
			where arn = @arn 				

			-- return RunningID
			SELECT top 1  @RunningIDForCompletedSubmission = RunningID 
			FROM aaIntDisbursementSubmission_History 
			where arn = @arn 				
			order by RunningID desc
		end 
	end

end 
GO
