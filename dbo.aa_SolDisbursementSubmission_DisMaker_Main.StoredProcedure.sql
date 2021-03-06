/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_Main]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_Main]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_Main]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE          procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_Main]
@arn nvarchar(max) = null ,
@DisbursementMakerEmailAddress  nvarchar(max) = null ,
@DisbursementMakerDecision nvarchar(max) = null ,
@DisbursementMakerSubmissionCompleted nvarchar(max) = null ,
@DisbursementMakerRejectionReason nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin	
	set @Error = ''

	
	if (@DisbursementMakerEmailAddress like 'K2:%')
	begin		
		set @DisbursementMakerEmailAddress = Stuff(@DisbursementMakerEmailAddress, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	declare @SolicitorSubmissionOption nvarchar(max)

	select @SolicitorSubmissionOption  = SolicitorSubmissionOption
	from [aaSolDisbursementSubmission]
	where arn = @arn

	if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @DisbursementMakerDecision = 'Not In Order' and @DisbursementMakerSubmissionCompleted = 1)
	begin
		if (ltrim(rtrim(@DisbursementMakerRejectionReason)) = '' or @DisbursementMakerRejectionReason is null)
		begin
			set @Error = @Error + 'Please fill in Rejection Remarks <br>'
		end 
	end 

	if (
		(@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') 
		and @DisbursementMakerDecision <> 'Not In Order' 
		and @DisbursementMakerSubmissionCompleted = 1
		)
	begin

		if not exists 
		(
			select 1
			from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where arn = @arn 
		)
		begin
			set @Error = @Error + 'Please add at least 1 payment <br>'				
		end 
		else
		begin
			if exists 
			(
				select 1
				from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where (AccountFrom is null or ltrim(rtrim(AccountFrom)) = '')
					and arn = @arn 
			)
			begin		
				set @Error = @Error + 'Please fill in Account From for all the items in the payment tab <br>'	
			end 
		end 
		


	end 
	
	if (@Error = '')
	begin		
		if (@DisbursementMakerSubmissionCompleted = 1)
		begin
			delete from aaSolDisbursementSubmission_DisMakerRejected
			where arn = @arn 
		end 
		
		if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @DisbursementMakerDecision = 'Not In Order' and @DisbursementMakerSubmissionCompleted = 1)
		begin
						
			INSERT INTO [dbo].[aaSolDisbursementSubmission_DisMakerRejected]
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
           ,[CreatedDate]
           ,[UpdatedDate])
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
			  ,@DisbursementMakerEmailAddress
			  ,@DisbursementMakerDecision
			  ,@DisbursementMakerSubmissionCompleted
			  ,@DisbursementMakerRejectionReason
			  ,getdate()
			  ,null
			  ,[DisbursementCheckerEmailAddress]
			  ,[DisbursementCheckerDecision]
			  ,[DisbursementCheckerSubmissionCompleted]
			  ,[DisbursementCheckerRejectionReason]
			  ,[DisbursementCheckerSubmissionDate]
			  ,[DisbursementCheckerPDFID]
			  ,[CreatedDate]
			  ,getdate()
		  FROM [dbo].[aaSolDisbursementSubmission]
		  where arn = @arn 

		  update aaSolDisbursementSubmission
			set DisbursementMakerEmailAddress = null, 
				DisbursementMakerDecision = null, 
				DisbursementMakerSubmissionCompleted = null, 
				DisbursementMakerRejectionReason = null,
				SolicitorSubmissionCompleted = 0,
				[UpdatedDate] = getdate()
			where arn = @arn 

			delete from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where arn = @arn 

			insert into MortgageAppTaskInstance_logs 
			select [workflow]
				,[arn]
				,[TaskOwner]
				,[CreatedDate]
				,getdate()
				,[CreatedUser]
				,[UpdatedUser]
				, 0
				, 1
			from MortgageAppTaskInstance
			where workflow = 'DisbDUMakerSolicitorApproval'
			and arn = @arn 

			delete from MortgageAppTaskInstance
			where workflow = 'DisbDUMakerSolicitorApproval'
			and arn = @arn 

			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Disbursement Rejected By Disbursement Maker',@DisbursementMakerEmailAddress,null,getdate())

		end 
		else
		begin
			update aaSolDisbursementSubmission
			set DisbursementMakerEmailAddress = @DisbursementMakerEmailAddress, 
				DisbursementMakerDecision = @DisbursementMakerDecision, 
				DisbursementMakerSubmissionCompleted = @DisbursementMakerSubmissionCompleted, 
				DisbursementMakerRejectionReason = @DisbursementMakerRejectionReason,	
				[DisbursementMakerSubmissionDate] = getdate(),
				[UpdatedDate] = getdate()
			where arn = @arn 

			update aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
			set DisMakerEmail = @DisbursementMakerEmailAddress,
				DisMakerSubmissionDate = getdate()

			if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @DisbursementMakerDecision = 'All In Order' and @DisbursementMakerSubmissionCompleted = 1)
			begin
				insert into MortgageAppTaskInstance_logs 
				select [workflow]
					,[arn]
					,[TaskOwner]
					,[CreatedDate]
					,getdate()
					,[CreatedUser]
					,[UpdatedUser]
					, 0
					, 1
				from MortgageAppTaskInstance
				where workflow = 'DisbDUMakerSolicitorApproval'
				and arn = @arn 

				delete from MortgageAppTaskInstance
				where workflow = 'DisbDUMakerSolicitorApproval'
				and arn = @arn 

				insert into WorkflowHistory
				values ('Disbursement By Solicitor',@arn,'Disbursement Approved By Disbursement Maker',@DisbursementMakerEmailAddress,null,getdate())
			end 

			if (@SolicitorSubmissionOption = 'Cancelled' and @DisbursementMakerSubmissionCompleted = 1)
			begin
				insert into MortgageAppTaskInstance_logs 
				select [workflow]
					,[arn]
					,[TaskOwner]
					,[CreatedDate]
					,getdate()
					,[CreatedUser]
					,[UpdatedUser]
					, 0
					, 1
				from MortgageAppTaskInstance
				where workflow = 'DisbDUMakerSolicitorApproval'
				and arn = @arn 

				delete from MortgageAppTaskInstance
				where workflow = 'DisbDUMakerSolicitorApproval'
				and arn = @arn 

				insert into WorkflowHistory
				values ('Disbursement By Solicitor',@arn,'Cancellation Approved By Disbursement Maker',@DisbursementMakerEmailAddress,null,getdate())
			end 
		end 
					
	end

end 

--select * from MortgageAppTaskInstance
GO
