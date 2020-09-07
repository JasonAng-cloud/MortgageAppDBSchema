/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_Main]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_Main]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_Main]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE        procedure [dbo].[aa_SolDisbursementSubmission_Main]
@arn nvarchar(max) = null 
,@BalanceAdviceLetterApplicableFlag bit = null 
,@UrgentFlag bit = null 
,@LS_RedemptionDueDateFlag bit = null 
,@LS_RedemptionDueDate datetime = null 
,@LS_ExtendedCompletionDateFlag bit = null 
,@LS_CompletionDate datetime = null 
,@LS_ExtendedCompletionDate datetime = null 
,@PR_DeveloperBillingDueDateFlag bit = null 
,@PR_Stage2AFlag bit = null 
,@PR_Stage2BFlag bit = null 
,@PR_Stage2CFlag bit = null 
,@PR_Stage2DFlag bit = null 
,@PR_Stage2EFlag bit = null 
,@PR_Stage2FFlag bit = null 
,@PR_Stage2GFlag bit = null 
,@PR_Stage2HFlag bit = null 
,@PR_StageOthers nvarchar(max) = null 
,@PR_EarliestBillingDueDate datetime = null 
,@PR_TotalBillingAmount nvarchar(max) = null 
,@PR_AnyBridgingFinancierFlag bit = null 
,@PR_BridgingFinancier nvarchar(max) = null 
,@PR_BridgingFinancierEmailAddress nvarchar(max) = null 
,@PR_BridgingFinancierRedemptionSum nvarchar(max) = null 
,@PR_RedemptionPaymentAccountNumber nvarchar(max) = null 
,@PR_BeneficiaryBank nvarchar(max) = null 
,@PR_BridgingFinancierRedemptionExpiryDate datetime = null 
,@PR_DeveloperName nvarchar(max) = null 
,@PR_DeveloperEmailAddress nvarchar(max) = null 
,@PR_DeveloperPIC nvarchar(max) = null 
,@PR_DeveloperHDA nvarchar(max) = null 
,@PR_DeveloperHDABank nvarchar(max) = null 
,@LF_PayeeName nvarchar(max) = null 
,@LF_BilledAmount nvarchar(max) = null 
,@LF_AccountNumber nvarchar(max) = null 
,@LF_Bank nvarchar(max) = null 
,@LF_PaymentDescription nvarchar(max) = null 
,@LF_PaymentMode nvarchar(max) = null 
,@UpdateInfo_Reason nvarchar(max) = null 
,@UpdateInfo_Others nvarchar(max) = null 
,@CancelLoan_Remarks nvarchar(max) = null 
,@CancelLoan_File nvarchar(max) = null 
,@SolicitorSubmissionOption nvarchar(max) = null 
,@SolicitorSubmissionStatus bit = null 
,@SolicitorCode nvarchar(max) = null 
--,@SolicitorSubmissionDate nvarchar(max) = null   
,@Error nvarchar(max) = null output 
as
begin	
	set @Error = ''

	--validate data types 
	if (@PR_TotalBillingAmount  is not null or ltrim(rtrim(@PR_TotalBillingAmount)) <> '')
	begin
		if (isnumeric(@PR_TotalBillingAmount) = 0)
		begin
			set @error = @error + 'Total Billing Amount in the Billing Related Information tab must be a number<br>'
		end 
	end 
	
	if (@PR_BridgingFinancierRedemptionSum  is not null or ltrim(rtrim(@PR_BridgingFinancierRedemptionSum)) <> '')
	begin
		if (isnumeric(@PR_BridgingFinancierRedemptionSum) = 0)
		begin
			set @error = @error + 'Bridging Financier Redemption Sum in the Bridging Financier / Developer Information tab must be a number<br>'
		end 
	end 

	if (@PR_RedemptionPaymentAccountNumber  is not null or ltrim(rtrim(@PR_RedemptionPaymentAccountNumber)) <> '')
	begin
		if (isnumeric(@PR_RedemptionPaymentAccountNumber) = 0)
		begin
			set @error = @error + 'Redemption Payment Account Number in the Bridging Financier / Developer Information tab must be a number<br>'
		end 
	end 

	if (@LF_BilledAmount  is not null or ltrim(rtrim(@LF_BilledAmount)) <> '')
	begin
		if (isnumeric(@LF_BilledAmount) = 0)
		begin
			set @error = @error + 'Billed Amount in the Details of Legal Fee Financed by Bank tab must be a number<br>'
		end 
	end 

	if (@LF_AccountNumber  is not null or ltrim(rtrim(@LF_AccountNumber)) <> '')
	begin
		if (isnumeric(@LF_AccountNumber) = 0)
		begin
			set @error = @error + 'Account Number in the Details of Legal Fee Financed by Bank tab must be a number<br>'
		end 
	end 

	if (@PR_BridgingFinancierEmailAddress  is not null or ltrim(rtrim(@PR_BridgingFinancierEmailAddress)) <> '')
	begin		
		IF NOT (
				CHARINDEX(' ',LTRIM(RTRIM(@PR_BridgingFinancierEmailAddress))) = 0 
		AND  LEFT(LTRIM(@PR_BridgingFinancierEmailAddress),1) <> '@' 
		AND  RIGHT(RTRIM(@PR_BridgingFinancierEmailAddress),1) <> '.' 
		AND  CHARINDEX('.',@PR_BridgingFinancierEmailAddress ,CHARINDEX('@',@PR_BridgingFinancierEmailAddress)) - CHARINDEX('@',@PR_BridgingFinancierEmailAddress ) > 1 
		AND  LEN(LTRIM(RTRIM(@PR_BridgingFinancierEmailAddress ))) - LEN(REPLACE(LTRIM(RTRIM(@PR_BridgingFinancierEmailAddress)),'@','')) = 1 
		AND  CHARINDEX('.',REVERSE(LTRIM(RTRIM(@PR_BridgingFinancierEmailAddress)))) >= 3 
		AND  (CHARINDEX('.@',@PR_BridgingFinancierEmailAddress ) = 0 AND CHARINDEX('..',@PR_BridgingFinancierEmailAddress ) = 0)
		)
		begin
			set @error = @error + 'Bridging Financier Email Address in the Bridging Financier / Developer Information tab is not in correct format<br>'
		end 
	end 

	if (@PR_DeveloperEmailAddress  is not null or ltrim(rtrim(@PR_DeveloperEmailAddress)) <> '')
	begin		
		IF NOT (
				CHARINDEX(' ',LTRIM(RTRIM(@PR_DeveloperEmailAddress))) = 0 
		AND  LEFT(LTRIM(@PR_DeveloperEmailAddress),1) <> '@' 
		AND  RIGHT(RTRIM(@PR_DeveloperEmailAddress),1) <> '.' 
		AND  CHARINDEX('.',@PR_DeveloperEmailAddress ,CHARINDEX('@',@PR_DeveloperEmailAddress)) - CHARINDEX('@',@PR_DeveloperEmailAddress ) > 1 
		AND  LEN(LTRIM(RTRIM(@PR_DeveloperEmailAddress ))) - LEN(REPLACE(LTRIM(RTRIM(@PR_DeveloperEmailAddress)),'@','')) = 1 
		AND  CHARINDEX('.',REVERSE(LTRIM(RTRIM(@PR_DeveloperEmailAddress)))) >= 3 
		AND  (CHARINDEX('.@',@PR_DeveloperEmailAddress ) = 0 AND CHARINDEX('..',@PR_DeveloperEmailAddress ) = 0)
		)
		begin
			set @error = @error + 'Developer Email Address in the Bridging Financier / Developer Information tab is not in correct format<br>'
		end 
	end 
	

	if (@error = '')
	begin
		if (@CancelLoan_File = '<file><name>scnull</name><content>scnull</content></file>' )
		begin
			set @CancelLoan_File = null 
		end 

		if (@SolicitorSubmissionStatus = 1 and @SolicitorSubmissionOption = 'Cancelled')	
		begin
			if (@CancelLoan_File is null)
			begin				
				set @error = @error + 'Please attach a document <br>'
			end

			if (@CancelLoan_Remarks is null or ltrim(rtrim(@CancelLoan_Remarks)) = '')
			begin
				set @error = @error + 'Please insert remarks <br>'
			end
		end 

		if (@SolicitorSubmissionStatus = 1 and @SolicitorSubmissionOption = 'UpdateInfo')	
		begin
			if (
				(@UpdateInfo_Reason = 'Customers related - others' or 
				@UpdateInfo_Reason = 'Developer related - others' or 
				@UpdateInfo_Reason = 'Others')
				and (@UpdateInfo_Others is null or ltrim(rtrim(@UpdateInfo_Others)) = '')
				)
			begin
				set @error = @error + 'Please fill in others field <br>'
			end 		
		end 

		if (@SolicitorSubmissionOption = 'Submitted')	
		begin
			-- first advice related validation 
			declare @legalfee money
			select @legalfee = LegalFeesFinancedAmount
			from sqlloads
			where arn = @arn 
 
			declare @firstsubmissionflag bit 
			set @firstsubmissionflag= 0

			declare @attachment_count int 
			select @attachment_count = count(*)
			from aaSolicitorDisbursementSubmissionAttachment
			where arn = @ARN 			

			if not exists(
				select 1
				from [aaSolDisbursementSubmission_history]
				where arn =@arn 
			)
			begin
				set @firstsubmissionflag= 1
			end 				

			if (@SolicitorSubmissionStatus = 1 and @firstsubmissionflag=1 and (ltrim(rtrim(@legalfee)) <>'' or @legalfee is not null))
			begin
				if (@LF_PayeeName is null or ltrim(rtrim(@LF_PayeeName)) = '')
				begin
					set @error = @error + 'Please fill in Payee Name field in the Details of Legal Fee Financed by Bank tab<br>'
				end 

				if (@LF_AccountNumber is null or ltrim(rtrim(@LF_AccountNumber)) = '')
				begin
					set @error = @error + 'Please fill in Account Number field in the Details of Legal Fee Financed by Bank tab<br>'
				end 

				if (@LF_BilledAmount is null or ltrim(rtrim(@LF_BilledAmount)) = '')
				begin
					set @error = @error + 'Please fill in Billed Amount field in the Details of Legal Fee Financed by Bank tab<br>'
				end 

				if (@LF_Bank is null or ltrim(rtrim(@LF_Bank)) = '')
				begin
					set @error = @error + 'Please fill in Bank field in the Details of Legal Fee Financed by Bank tab<br>'
				end 
			
			end

			if (@SolicitorSubmissionStatus = 1 and @SolicitorSubmissionOption = 'Submitted')
			begin
				if (@attachment_count < 1)
				begin
					set @error =  @error + 'Please attach a document <br>'
				end 

				if (@attachment_count > 10)
				begin
					set @error =  @error + 'Only 10 attachement files are allowed for other attachments <br>'
				end 
			end 
			

			-- pr related validation 
			declare @disbursementmanner nvarchar(100)
			select @disbursementmanner = disbursementmanner
			from sqlloads 
			where arn = @arn 

			if (@SolicitorSubmissionStatus = 1 and @disbursementmanner='PR')
			begin
				if (@PR_DeveloperBillingDueDateFlag =1)
				begin
					if (@PR_StageOthers is null or ltrim(rtrim(@PR_StageOthers)) = '')
					begin
						set @error = @error + 'Please fill in Remarks field in the Billing Related Information tab<br>'
					end 

					if (@PR_EarliestBillingDueDate is null or ltrim(rtrim(@PR_EarliestBillingDueDate)) = '')
					begin
						set @error = @error + 'Please fill in Earliest Billing Due Date field in the Billing Related Information tab<br>'
					end 

					if (@PR_TotalBillingAmount is null or ltrim(rtrim(@PR_TotalBillingAmount)) = '')
					begin
						set @error = @error + 'Please fill in Total Billing Amount field in the Billing Related Information tab<br>'
					end 

					if not exists 
					(
						select 1
						from aaSolDisbursementSubmission_PaymentDetail
						where arn = @arn 
					)
					begin
						set @error = @error + 'Please enter at least 1 payment in the Payment tab<br>'
					end 
				end 
				if (@PR_AnyBridgingFinancierFlag =1)
				begin
					if (@PR_BridgingFinancier is null or ltrim(rtrim(@PR_BridgingFinancier)) = '')
					begin
						set @error = @error + 'Please fill in Bridging Financier field in the Bridging Financier/ Developer Information tab<br>'
					end 

					if (@PR_BridgingFinancierRedemptionSum is null or ltrim(rtrim(@PR_BridgingFinancierRedemptionSum)) = '')
					begin
						set @error = @error + 'Please fill in Bridging Financier Redemption Sum field in the Bridging Financier/ Developer Information tab<br>'
					end 

					if (@PR_RedemptionPaymentAccountNumber is null or ltrim(rtrim(@PR_RedemptionPaymentAccountNumber)) = '')
					begin
						set @error = @error + 'Please fill in Redemption Payment Account Number field in the Bridging Financier/ Developer Information tab<br>'
					end 

					if (@PR_BridgingFinancierRedemptionExpiryDate is null or ltrim(rtrim(@PR_BridgingFinancierRedemptionExpiryDate)) = '')
					begin
						set @error = @error + 'Please fill in Bridging Financier Redemption Expiry Date field in the Bridging Financier/ Developer Information tab<br>'
					end 

					if (@PR_DeveloperEmailAddress  is null or ltrim(rtrim(@PR_DeveloperEmailAddress)) = '')
					begin
						set @error = @error + 'Please fill in Developer Email Address field in the Bridging Financier/ Developer Information tab<br>'
					end 
				end 
			end 

			if (@SolicitorSubmissionStatus = 1 and @disbursementmanner='LS')
			begin
				if (@LS_RedemptionDueDateFlag =1)
				begin
					if (@LS_RedemptionDueDate  is null or ltrim(rtrim(@LS_RedemptionDueDate)) = '')
					begin
						set @error = @error + 'Please fill in Redemption Due Date field in the Redemption/ SPA Related Information tab<br>'
					end 

					if (@LS_CompletionDate  is null or ltrim(rtrim(@LS_CompletionDate)) = '')
					begin
						set @error = @error + 'Please fill in Completion Date field in the Redemption/ SPA Related Information tab<br>'
					end 				
				end 

				if not exists 
				(
					select 1
					from aaSolDisbursementSubmission_PaymentDetail
					where arn = @arn 
				)
				begin
					set @error = @error + 'Please enter at least 1 payment in the Payment tab<br>'
				end 

			end 
		end 
			
		
		if (@error = '')
		begin
			-- amount disburse validation 
			declare @FinancingAmountExcludeFLVM decimal 
			select @FinancingAmountExcludeFLVM = loanamount 
			from sqlloads 
			where arn = @arn 

			declare @TotalDisbursedAmount decimal 

			select @TotalDisbursedAmount = @TotalDisbursedAmount + sum(AmountDisburse)
			from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where arn = @arn 

			select @TotalDisbursedAmount = @TotalDisbursedAmount + sum(AmountDisburse)
			from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
			where arn = @arn 

			/*
			select @TotalDisbursedAmount = @TotalDisbursedAmount + sum(AmountDisburse)
			from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where arn = @arn 

			select @TotalDisbursedAmount = @TotalDisbursedAmount + sum(AmountDisburse)
			from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
			where arn = @arn 
			*/

			select @TotalDisbursedAmount = @TotalDisbursedAmount + sum(AmountDisburse)
			from aaSolDisbursementSubmission_PaymentDetail
			where arn = @arn 

			if (@TotalDisbursedAmount > @FinancingAmountExcludeFLVM)
			begin
				set @error = @error + 'Total Disbursement Amount is more than Financing Amount (exclude FLVM)<br>'
			end 

			if (@SolicitorSubmissionStatus = 1 and @firstsubmissionflag=1 and (ltrim(rtrim(@legalfee)) <>'' or @legalfee is not null))
			begin
				if (@LF_BilledAmount> @legalfee  )
				begin
					set @error = @error + 'Legal Fee Billed Amount is more than Legal Fees Financed Amount<br>'
				end 
			end 
		end 

		-- all is good. proceed to save 	
		if (@error = '')
		begin
			-- if submission option is updateinfo, add the record to updateinfo table
			if (@SolicitorSubmissionStatus = 1 and @SolicitorSubmissionOption='UpdateInfo')
			begin
				if exists
				(
					select 1
					from [aaSolDisbursementSubmission_UpdateInfo]
					where arn = @arn 
				)
				begin
					update [aaSolDisbursementSubmission_UpdateInfo]
					set [UpdateInfo_Reason] = @UpdateInfo_Reason
						 ,[UpdateInfo_Others] = @UpdateInfo_Others
						, [UpdatedDate] = getdate()	
					where arn = @arn 
				end 
				else
				begin
					INSERT INTO [dbo].[aaSolDisbursementSubmission_UpdateInfo]
						   ([arn]
						   ,[UpdateInfo_Reason]
						   ,[UpdateInfo_Others]					 
						   ,[CreatedDate]
						   ,[UpdatedDate])
					 VALUES
						   (
						   @arn, 
						   @UpdateInfo_Reason, 
						   @UpdateInfo_Others, 
						   getdate(),
						   getdate()					 
						   )
				end 
			
				-- set the completed flag to 0 
				set @SolicitorSubmissionStatus = 0

			end

			-- if submission option is submitted and was previously rejected, change the status to resubmitted
			if (@SolicitorSubmissionStatus = 1 and @SolicitorSubmissionOption='Submitted')
			begin
				if exists (
					select 1
					from aaSolDisbursementSubmission_DisMakerRejected
					where arn = @arn 
				)
				begin
					set @SolicitorSubmissionOption = 'Resubmitted'
				end 				
			end 

			if not exists 
			(
				select 1
				from [aaSolDisbursementSubmission]
				where arn = @arn 
			)
			begin
				INSERT INTO [dbo].[aaSolDisbursementSubmission]
				(
					[arn]
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
				   ,[CreatedDate]
				   ,[UpdatedDate]
				)
				VALUES
				(
					@arn
				   ,@BalanceAdviceLetterApplicableFlag
					,@UrgentFlag
					,@LS_RedemptionDueDateFlag
					,@LS_RedemptionDueDate
					,@LS_ExtendedCompletionDateFlag
					,@LS_CompletionDate
					,@LS_ExtendedCompletionDate
					,@PR_DeveloperBillingDueDateFlag
					,@PR_Stage2AFlag
					,@PR_Stage2BFlag
					,@PR_Stage2CFlag
					,@PR_Stage2DFlag
					,@PR_Stage2EFlag
					,@PR_Stage2FFlag
					,@PR_Stage2GFlag
					,@PR_Stage2HFlag
					,@PR_StageOthers
					,@PR_EarliestBillingDueDate
					,@PR_TotalBillingAmount
					,@PR_AnyBridgingFinancierFlag
					,@PR_BridgingFinancier
					,@PR_BridgingFinancierEmailAddress
					,@PR_BridgingFinancierRedemptionSum
					,@PR_RedemptionPaymentAccountNumber
					,@PR_BeneficiaryBank
					,@PR_BridgingFinancierRedemptionExpiryDate
					,@PR_DeveloperName
					,@PR_DeveloperEmailAddress
					,@PR_DeveloperPIC
					,@PR_DeveloperHDA
					,@PR_DeveloperHDABank
					,@LF_PayeeName
					,@LF_BilledAmount
					,@LF_AccountNumber
					,@LF_Bank
					,@LF_PaymentDescription
					,@LF_PaymentMode
					,@UpdateInfo_Reason
					,@UpdateInfo_Others
					,@CancelLoan_Remarks
					,@CancelLoan_File
					,@SolicitorSubmissionOption
					,@SolicitorSubmissionStatus
					,@SolicitorCode
					,getdate()			
					,getdate()
					,getdate()
				)
			end 
			else
			begin
				if exists 
				(
					select 1
					from [aaSolDisbursementSubmission]
					where [SolicitorSubmissionCompleted] = 1
						and arn = @arn 
				)
				begin
					set @error = 'The record is previously submitted'
				end 
				else
				begin
					UPDATE [dbo].[aaSolDisbursementSubmission]
					SET 
						[BalanceAdviceLetterApplicableFlag] = @BalanceAdviceLetterApplicableFlag
						,[UrgentFlag] = @UrgentFlag
						,[LS_RedemptionDueDateFlag] = @LS_RedemptionDueDateFlag
						,[LS_RedemptionDueDate] = @LS_RedemptionDueDate
						,[LS_ExtendedCompletionDateFlag] = @LS_ExtendedCompletionDateFlag
						,[LS_CompletionDate] = @LS_CompletionDate
						,[LS_ExtendedCompletionDate] = @LS_ExtendedCompletionDate
						,[PR_DeveloperBillingDueDateFlag] = @PR_DeveloperBillingDueDateFlag
						,[PR_Stage2AFlag] = @PR_Stage2AFlag
						,[PR_Stage2BFlag] = @PR_Stage2BFlag
						,[PR_Stage2CFlag] = @PR_Stage2CFlag
						,[PR_Stage2DFlag] = @PR_Stage2DFlag
						,[PR_Stage2EFlag] = @PR_Stage2EFlag
						,[PR_Stage2FFlag] = @PR_Stage2FFlag
						,[PR_Stage2GFlag] = @PR_Stage2GFlag
						,[PR_Stage2HFlag] = @PR_Stage2HFlag
						,[PR_StageOthers] = @PR_StageOthers
						,[PR_EarliestBillingDueDate] = @PR_EarliestBillingDueDate
						,[PR_TotalBillingAmount] = @PR_TotalBillingAmount
						,[PR_AnyBridgingFinancierFlag] = @PR_AnyBridgingFinancierFlag
						,[PR_BridgingFinancier] = @PR_BridgingFinancier
						,[PR_BridgingFinancierEmailAddress] = @PR_BridgingFinancierEmailAddress
						,[PR_BridgingFinancierRedemptionSum] = @PR_BridgingFinancierRedemptionSum
						,[PR_RedemptionPaymentAccountNumber] = @PR_RedemptionPaymentAccountNumber
						,[PR_BeneficiaryBank] = @PR_BeneficiaryBank
						,[PR_BridgingFinancierRedemptionExpiryDate] = @PR_BridgingFinancierRedemptionExpiryDate
						,[PR_DeveloperName] = @PR_DeveloperName
						,[PR_DeveloperEmailAddress] = @PR_DeveloperEmailAddress
						,[PR_DeveloperPIC] = @PR_DeveloperPIC
						,[PR_DeveloperHDA] = @PR_DeveloperHDA
						,[PR_DeveloperHDABank] = @PR_DeveloperHDABank
						,[LF_PayeeName] = @LF_PayeeName
						,[LF_BilledAmount] = @LF_BilledAmount
						,[LF_AccountNumber] = @LF_AccountNumber
						,[LF_Bank] = @LF_Bank
						,[LF_PaymentDescription] = @LF_PaymentDescription
						,[LF_PaymentMode] = @LF_PaymentMode
						,[UpdateInfo_Reason] = @UpdateInfo_Reason
						,[UpdateInfo_Others] = @UpdateInfo_Others
						,[CancelLoan_Remarks] = @CancelLoan_Remarks
						,[CancelLoan_File] = @CancelLoan_File
						,[SolicitorSubmissionOption] = @SolicitorSubmissionOption
						,[SolicitorSubmissionCompleted] = @SolicitorSubmissionStatus
						,[SolicitorCode] = @SolicitorCode
						,[SolicitorSubmissionDate] = getdate()	  
						,[UpdatedDate] = getdate()
					WHERE arn =@arn 
				end 						
			end

			-- remove updateinfo record after record submitted
			if ( @error = '' and @SolicitorSubmissionStatus = 1)
			begin 
				if exists
				(
					select 1
					from aaSolDisbursementSubmission
					where [SolicitorSubmissionCompleted] = 1
						and arn = @arn 
				)
				begin
					delete from aaSolDisbursementSubmission_UpdateInfo
					where arn = @arn 	
				end 
			end 

			-- polish the final record after process completed (submitted) 
			if ( @error = '' and @SolicitorSubmissionStatus = 1)
			begin 			
				
				if exists
				(
					select 1
					from aaSolDisbursementSubmission
					where ([PR_DeveloperBillingDueDateFlag] is null or [PR_DeveloperBillingDueDateFlag] = 0)
						and [SolicitorSubmissionCompleted] = 1
						and [SolicitorSubmissionOption] = 'Submitted'
						and @disbursementmanner='PR'
						and arn = @arn 
				)
				begin
					delete from aaSolDisbursementSubmission_PaymentDetail
					where arn = @arn 
				end		
			end 
		end 
		
		-- polish the final record after process completed(cancelled) 
		if ( @error = '' and @SolicitorSubmissionStatus = 1)
		begin 
			if exists
			(
				select 1
				from aaSolDisbursementSubmission
				where [SolicitorSubmissionCompleted] = 1
					and [SolicitorSubmissionOption] = 'Cancelled'
					and arn = @arn 
			)
			begin
				delete from aaSolDisbursementSubmission_PaymentDetail
				where arn = @arn 

				update aaSolDisbursementSubmission
				set BalanceAdviceLetterApplicableFlag = 0
				where arn = @arn 
			end		
		end 

		if ( @error = '' and @SolicitorSubmissionStatus = 1)
		begin 
			if exists
			(
				select 1
				from aaSolDisbursementSubmission_PaymentDetail
				where arn = @arn 
			)
			begin
				
				insert into aaSolDisbursementSubmission_PaymentDetail_temp 
				select * from aaSolDisbursementSubmission_PaymentDetail
				where arn = @arn 

				--move aaSolDisbursementSubmission_PaymentDetail to aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail 
				declare @runningid_alpha bigint 
				declare @previousmaxrunningid_alpha int 

				if not exists 
				(
					select 1
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					where arn = @arn 
				)
				begin
					set @runningid_alpha = 1
				end 
				else
				begin					 
					select @previousmaxrunningid_alpha = max(RunningIDForCurrentSubmission)
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					where arn = @arn 
					
					set @runningid_alpha = @previousmaxrunningid_alpha + 1					
				end 

				declare @RecordCount bigint 
				select @RecordCount = count(*) 
				from aaSolDisbursementSubmission_PaymentDetail_temp 
				where arn = @arn 								

				declare @aaSolDisbursementSubmission_PaymentDetail_runningid bigint 
				while @RecordCount >0
				begin

					select top 1 @aaSolDisbursementSubmission_PaymentDetail_runningid = RunningIDForCurrentSubmission
					from aaSolDisbursementSubmission_PaymentDetail_temp
					where arn = @arn 
					order by RunningIDForCurrentSubmission asc 

					INSERT INTO [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
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
					   ,[CreatedDate]
					   ,[UpdatedDate])			
					SELECT top 1 [arn]
						  ,@runningid_alpha
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
					from aaSolDisbursementSubmission_PaymentDetail
					where arn = @arn 
						and RunningIDForCurrentSubmission =@aaSolDisbursementSubmission_PaymentDetail_runningid 
					--order by RunningIDForCurrentSubmission asc 

					delete from aaSolDisbursementSubmission_PaymentDetail_temp
					where arn = @arn 
						and RunningIDForCurrentSubmission =@aaSolDisbursementSubmission_PaymentDetail_runningid 

					set @runningid_alpha = @runningid_alpha + 1

					select @RecordCount = count(*) 
					from aaSolDisbursementSubmission_PaymentDetail_temp 
					where arn = @arn 		
				end 
				
			end 

			-- move legal fee to payment detail table
			declare @runningid int 
			declare @previousmaxrunningid int 
			declare @CustomerName nvarchar(max)

			-- prevent duplicate entry 
			if not exists 
			(
				select 1
				from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where [PaymentReference] = 'Legal Fee'
					and arn = @arn 					
				union 
				select 1
				from vw_aaDisbursementPaymentHistory 
				where [PaymentReference] = 'Legal Fee'
					and arn = @arn 					
			)
			begin
				if (@LF_BilledAmount > 0)
				begin 
					
					if not exists 
					(
						select 1
						from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
						where arn = @arn 
					)
					begin
						set @runningid = 1
					end 
					else
					begin				
						select @previousmaxrunningid = max(RunningIDForCurrentSubmission)
						from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
						where arn = @arn 

						set @runningid = @previousmaxrunningid + 1
					end 
			
					declare @solicitor_name nvarchar(max)

					select @solicitor_name = [SolicitorName] 
					from sqlloads 
					where arn = @arn 

					INSERT INTO [dbo].aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					(	
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
					)
					VALUES 
					(
						@arn,
						@runningid,
						null,
						@LF_PaymentMode,
						null,
						@LF_PayeeName,
						@LF_Bank,
						@LF_AccountNumber,
						@LF_BilledAmount,
						'Legal Fee', 
						@LF_PaymentDescription,
						getdate(),
						getdate()
					)

					
					-- get balance legal fee
					declare @LegalFeesFinancedAmount money 
					declare @LegalFeesFinancedAmountBalance money 
					 
					select @LegalFeesFinancedAmount= LegalFeesFinancedAmount
					from sqlloads 
					where arn = @arn 

					if (@LegalFeesFinancedAmount>0)
					begin
						set @LegalFeesFinancedAmountBalance = @LegalFeesFinancedAmount - @LF_BilledAmount

						if (@LegalFeesFinancedAmountBalance>0)
						begin

							if not exists 
							(
								select 1
								from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
								where arn = @arn 
							)
							begin
								set @runningid = 1
							end 
							else
							begin					 
								select @previousmaxrunningid = max(RunningIDForCurrentSubmission)
								from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
								where arn = @arn 

								set @runningid = @previousmaxrunningid + 1
							end 
							
							select @CustomerName = [CustomerName] 
							from sqlloads 
							where arn = @arn 

							INSERT INTO [dbo].aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
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
								,[CreatedDate]
								,[UpdatedDate])
								VALUES 
								(
								@arn,
								@runningid,
								null,
								null,
								null,
								@CustomerName,
								null,
								null,
								@LegalFeesFinancedAmountBalance,
								'Legal Fee', 
								'Principal Payment',
								getdate(),
								getdate()
								)
						end 						
					end 
					
				end 
			end 
		end 				 
	end
end 
GO
