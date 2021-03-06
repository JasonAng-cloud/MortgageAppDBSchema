/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_Main]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisChecker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisChecker_Main]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_Main]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--[aa_SolDisbursementSubmission_DisChecker_Main] 'arn20', 'jason@jason.com', 'approve', 0, 'aaa'

CREATE            procedure [dbo].[aa_SolDisbursementSubmission_DisChecker_Main]
@arn nvarchar(max) = null ,
@DisbursementCheckerEmailAddress  nvarchar(max) = null ,
@DisbursementCheckerDecision nvarchar(max) = null ,
@DisbursementCheckerSubmissionCompleted nvarchar(max) = null ,
@DisbursementCheckerRejectionReason nvarchar(max) = null ,
@Error nvarchar(max) = null output ,
@RunningIDForCompletedSubmission bigint = null output
as
begin	
	set @Error = ''

	if (@DisbursementCheckerEmailAddress like 'K2:%')
	begin		
		set @DisbursementCheckerEmailAddress = Stuff(@DisbursementCheckerEmailAddress, 1, 3, '')					

	end 

	if (@DisbursementCheckerDecision = 'Reject' and @DisbursementCheckerSubmissionCompleted = 1)
	begin
		if (ltrim(rtrim(@DisbursementCheckerRejectionReason)) = '' or @DisbursementCheckerRejectionReason is null)
		begin
			set @Error = 'Please fill in Rejection Remarks'
		end 
	end 

	if (@Error = '')
	begin		
		delete from aaSolDisbursementSubmission_DisCheckerRejected
		where arn = @arn 

		if (@DisbursementCheckerDecision = 'Reject' and @DisbursementCheckerSubmissionCompleted = 1)
		begin
						
			INSERT INTO [dbo].[aaSolDisbursementSubmission_DisCheckerRejected]
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
			  ,[DisbursementMakerEmailAddress]
			  ,[DisbursementMakerDecision]
			  ,[DisbursementMakerSubmissionCompleted]
			  ,[DisbursementMakerRejectionReason]
			  ,[DisbursementMakerSubmissionDate]
			  ,[DisbursementMakerSubmissionPDFID]
			  ,@DisbursementCheckerEmailAddress
			  ,@DisbursementCheckerDecision
			  ,@DisbursementCheckerSubmissionCompleted
			  ,@DisbursementCheckerRejectionReason
			  ,getdate()
			  ,null
			  ,[CreatedDate]
			  ,getdate()
		  FROM [dbo].[aaSolDisbursementSubmission]
		  where arn = @arn 

		  update aaSolDisbursementSubmission
			set DisbursementCheckerEmailAddress = null, 
				DisbursementCheckerDecision = null, 
				DisbursementCheckerSubmissionCompleted = null, 
				DisbursementCheckerRejectionReason = null,
				[DisbursementMakerSubmissionCompleted] = 0,				
				[UpdatedDate] = getdate()
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
			where workflow = 'DisbDUCheckerSolicitorApproval'
			and arn = @arn 

			delete from MortgageAppTaskInstance
			where workflow = 'DisbDUCheckerSolicitorApproval'
			and arn = @arn 

			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Disbursement Rejected By Disbursement Checker',@DisbursementCheckerEmailAddress,null,getdate())


		end 
		else
		begin
			update aaSolDisbursementSubmission
			set DisbursementCheckerEmailAddress = @DisbursementCheckerEmailAddress, 
				DisbursementCheckerDecision = @DisbursementCheckerDecision, 
				DisbursementCheckerSubmissionCompleted = @DisbursementCheckerSubmissionCompleted, 
				DisbursementCheckerRejectionReason = @DisbursementCheckerRejectionReason,				
				DisbursementCheckerSubmissionDate = getdate(),
				[UpdatedDate] = getdate()
			where arn = @arn 

			declare @SolicitorSubmissionOption nvarchar(max)

			select @SolicitorSubmissionOption  = SolicitorSubmissionOption
			from [aaSolDisbursementSubmission]
			where @arn = @arn

			if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @DisbursementCheckerDecision = 'Approve' and @DisbursementCheckerSubmissionCompleted = 1)
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
				where workflow = 'DisbDUCheckerSolicitorApproval'
				and arn = @arn 

				delete from MortgageAppTaskInstance
				where workflow = 'DisbDUCheckerSolicitorApproval'
				and arn = @arn 

				insert into WorkflowHistory
				values ('Disbursement By Solicitor',@arn,'Disbursement Approved By Disbursement Checker',@DisbursementCheckerEmailAddress,null,getdate())

				if exists 
				(
					select 1
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					where arn = @arn 
				)
				begin

					update aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					set DisCheckerEmail = @DisbursementCheckerEmailAddress,
						DisCheckerApprovedDate = getdate()
					where arn = @arn 

				end 

				if (@SolicitorSubmissionOption = 'Cancelled' and @DisbursementCheckerSubmissionCompleted = 1)
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
					where workflow = 'DisbDUCheckerSolicitorApproval'
					and arn = @arn 

					delete from MortgageAppTaskInstance
					where workflow = 'DisbDUCheckerSolicitorApproval'
					and arn = @arn 

					insert into WorkflowHistory
					values ('Disbursement By Solicitor',@arn,'Cancellation Approved By Disbursement Checker',@DisbursementCheckerEmailAddress,null,getdate())

					-- move aaSolDisbursementSubmission to aaSolDisbursementSubmission_History
					--declare @RunningIDForCompletedSubmission int 
					if not exists 
					(
						select 1
						from aaSolDisbursementSubmission_History
						where arn = @arn 
					)
					begin
						set @RunningIDForCompletedSubmission = 1
					end 
					else
					begin
						declare @LastMaxRunningIDForCompletedSubmission int 
						select @LastMaxRunningIDForCompletedSubmission = max(RunningIDForCompletedSubmission)
						from aaSolDisbursementSubmission_History
						where arn = @arn 

						set @RunningIDForCompletedSubmission = @LastMaxRunningIDForCompletedSubmission + 1
					end 

					insert into aaSolDisbursementSubmission_History
					select * , @RunningIDForCompletedSubmission
					from aaSolDisbursementSubmission
					where arn = @arn 
			
					delete from aaSolDisbursementSubmission
					where arn = @arn 

					-- return RunningIDForCompletedSubmission
					SELECT top 1  @RunningIDForCompletedSubmission = RunningIDForCompletedSubmission 
					FROM aaSolDisbursementSubmission_History 
					where arn = @arn 				
					order by RunningIDForCompletedSubmission desc
				end 
			end 

		end 
		
	end

end 
GO
