/****** Object:  StoredProcedure [dbo].[aaGetNewBilling]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaGetNewBilling]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaGetNewBilling]
GO
/****** Object:  StoredProcedure [dbo].[aaGetNewBilling]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     procedure [dbo].[aaGetNewBilling]

as

begin
       declare @CDC nvarchar(max), @sql nvarchar(max), @NewCDC datetime 

	   declare @doctype nvarchar(max)

	   set @doctype = 'CRA06 Billings'

       select @CDC= newBillingCDC
       from tblCDC

       declare @VersionTblName nvarchar(max)

       select @VersionTblName= [VersionTblName]	   	   
       --select * 
	   FROM [EDMSDBSERVER].[HLBB_DMS].[dbo].[TblDocProfile]
       where ProfileName = 'MG-Mortgage'
	   
		set @sql = '
			select top 1 @NewCDC = DateModified
				from [EDMSDBSERVER].[HLBB_DMS].[dbo].' + @VersionTblName + ' tbl
				inner join (
							select RecID, max(version) as version
							from [EDMSDBSERVER].[HLBB_DMS].[dbo].'+ @VersionTblName +'
							where field6=  '''+@doctype+'''
							group by RecID
							) temp on temp.RecID = tbl.RecID and tbl.Version = temp.version
				where tbl.DateCreated > @CDC 			
				
				order by DateModified desc'
		
		--select @sql

		--and tbl.field3 COLLATE Latin1_General_CI_AS not in (select arn COLLATE Latin1_General_CI_AS from SQLLOADS) 
		EXECUTE sp_executesql @SQL, N'@CDC NVARCHAR(max),@NewCDC datetime OUTPUT' , @CDC  , @NewCDC OUTPUT
 		
		if (@NewCDC is not null )
		begin
			TRUNCATE TABLE aaIntDisbursement_New_Billing_Staging

			set @sql = '
				insert into aaIntDisbursement_New_Billing_Staging (RowNumber,ARN)
				select ROW_NUMBER() OVER(ORDER BY tbl100.arn ASC) AS RowNumber,tbl100.arn
				from (
					select distinct tbl.field3 as [ARN]
					from [EDMSDBSERVER].[HLBB_DMS].[dbo].' + @VersionTblName + ' tbl
					inner join (
								select RecID, max(version) as version
								from [EDMSDBSERVER].[HLBB_DMS].[dbo].'+ @VersionTblName +'
								where field6=  '''+@doctype+'''
								group by RecID
								) temp on temp.RecID = tbl.RecID and tbl.Version = temp.version
					where tbl.DateCreated > @CDC 
				  
					) tbl100' 
			--and tbl.field3 COLLATE Latin1_General_CI_AS not in (select arn COLLATE Latin1_General_CI_AS from SQLLOADS) 
			EXECUTE sp_executesql @SQL, N'@CDC NVARCHAR(max)', @CDC  
		
			if (@NewCDC	<> '' or @NewCDC is not null)
			begin
				update tblCDC
				set tempBillingCDC = @NewCDC	
			end 		
			
			-- new billing if sol disbursement submission is completed 
			insert into aaIntDisbursementSubmission
			select 
				staging.[arn] as [arn]
			  ,solsubhistory.[BalanceAdviceLetterApplicableFlag] as [BalanceAdviceLetterApplicableFlag]
			  ,solsubhistory.[UrgentFlag] as [UrgentFlag]
			  ,solsubhistory.[LS_RedemptionDueDateFlag] as [LS_RedemptionDueDateFlag]
			  ,solsubhistory.[LS_RedemptionDueDate] as [LS_RedemptionDueDate]
			  ,solsubhistory.[LS_ExtendedCompletionDateFlag] as [LS_ExtendedCompletionDateFlag]
			  ,solsubhistory.[LS_CompletionDate] as [LS_CompletionDate]
			  ,solsubhistory.[LS_ExtendedCompletionDate] as [LS_ExtendedCompletionDate]
			  ,solsubhistory.[PR_DeveloperBillingDueDateFlag] as [PR_DeveloperBillingDueDateFlag]
			  ,solsubhistory.[PR_Stage2AFlag] as [PR_Stage2AFlag]
			  ,solsubhistory.[PR_Stage2BFlag] as [PR_Stage2BFlag]
			  ,solsubhistory.[PR_Stage2CFlag] as [PR_Stage2CFlag]
			  ,solsubhistory.[PR_Stage2DFlag] as [PR_Stage2DFlag]
			  ,solsubhistory.[PR_Stage2EFlag] as [PR_Stage2EFlag]
			  ,solsubhistory.[PR_Stage2FFlag] as [PR_Stage2FFlag]
			  ,solsubhistory.[PR_Stage2GFlag] as [PR_Stage2GFlag]
			  ,solsubhistory.[PR_Stage2HFlag] as [PR_Stage2HFlag]
			  ,solsubhistory.[PR_StageOthers] as [PR_StageOthers]
			  ,solsubhistory.[PR_EarliestBillingDueDate] as [PR_EarliestBillingDueDate]
			  ,solsubhistory.[PR_TotalBillingAmount] as [PR_TotalBillingAmount]
			  ,solsubhistory.[PR_AnyBridgingFinancierFlag] as [PR_AnyBridgingFinancierFlag]
			  ,solsubhistory.[PR_BridgingFinancier] as [PR_BridgingFinancier]
			  ,solsubhistory.[PR_BridgingFinancierEmailAddress] as [PR_BridgingFinancierEmailAddress]
			  ,solsubhistory.[PR_BridgingFinancierRedemptionSum] as [PR_BridgingFinancierRedemptionSum]
			  ,solsubhistory.[PR_RedemptionPaymentAccountNumber] as [PR_RedemptionPaymentAccountNumber]
			  ,solsubhistory.[PR_BeneficiaryBank] as [PR_BeneficiaryBank]
			  ,solsubhistory.[PR_BridgingFinancierRedemptionExpiryDate] as [PR_BridgingFinancierRedemptionExpiryDate]
			  ,solsubhistory.[PR_DeveloperName] as [PR_DeveloperName]
			  ,solsubhistory.[PR_DeveloperEmailAddress] as [PR_DeveloperEmailAddress]
			  ,solsubhistory.[PR_DeveloperPIC] as [PR_DeveloperPIC]
			  ,solsubhistory.[PR_DeveloperHDA] as [PR_DeveloperHDA]
			  ,solsubhistory.[PR_DeveloperHDABank] as [PR_DeveloperHDABank]
			  ,solsubhistory.[LF_PayeeName] as [LF_PayeeName]
			  ,solsubhistory.[LF_BilledAmount] as [LF_BilledAmount]
			  ,solsubhistory.[LF_AccountNumber] as [LF_AccountNumber]
			  ,solsubhistory.[LF_Bank] as [LF_Bank]
			  ,solsubhistory.[LF_PaymentDescription] as [LF_PaymentDescription]
			  ,solsubhistory.[LF_PaymentMode] as [LF_PaymentMode]
			  ,solsubhistory.[UpdateInfo_Reason] as [UpdateInfo_Reason] 
			  ,solsubhistory.[UpdateInfo_Others] as [UpdateInfo_Others]
			  ,solsubhistory.[CancelLoan_Remarks] as [CancelLoan_Remarks]
			  ,solsubhistory.[CancelLoan_File] as [CancelLoan_File]
			  ,'New Billing' as [SolicitorSubmissionOption]
			  ,solsubhistory.[SolicitorSubmissionCompleted] as [SolicitorSubmissionCompleted]
			  ,solsubhistory.[SolicitorCode] as [SolicitorCode]
			  ,solsubhistory.[SolicitorSubmissionDate] as [SolicitorSubmissionDate]
			  ,solsubhistory.[SolicitorSubmissionPDFID] as [SolicitorSubmissionPDFID]
			  ,null as [DisbursementMakerEmailAddress]
			  ,null as [DisbursementMakerDecision]
			  ,null as [DisbursementMakerSubmissionCompleted]
			  ,null as [DisbursementMakerRejectionReason]
			  ,null as [DisbursementMakerSubmissionDate]
			  ,null as [DisbursementMakerSubmissionPDFID]
			  ,null as [DisbursementCheckerEmailAddress]
			  ,null as [DisbursementCheckerDecision]
			  ,null as [DisbursementCheckerSubmissionCompleted]
			  ,null as [DisbursementCheckerRejectionReason]
			  ,null as [DisbursementCheckerSubmissionDate]
			  ,null as [DisbursementCheckerPDFID]
			   ,null as [RCOMakerEmailAddress]
			  ,null as [RCOMakerDecision]
			  ,null as [RCOMakerSubmissionCompleted]
			  ,null as [RCOMakerRejectionReason]
			  ,null as [RCOMakerSubmissionDate]
			  ,null as [RCOMakerPDFID]
			  ,null as [RCOCheckerEmailAddress]
			  ,null as [RCOCheckerDecision]
			  ,null as [RCOCheckerSubmissionCompleted]
			  ,null as [RCOCheckerRejectionReason]
			  ,null as [RCOCheckerSubmissionDate]
			  ,null as [RCOCheckerPDFID]
			  ,getdate() as [CreatedDate]
			  ,getdate() as [UpdatedDate]
			  --,case when tbl_max_billing_id.billingid_max is not null then (tbl_max_billing_id.billingid_max) + 1 else 1 end 
			from aaIntDisbursement_New_Billing_Staging staging 
			left join (select history.*
						from vw_aaSolDisbursementSubmissionIncludeHistory history
						inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
									from vw_aaSolDisbursementSubmissionIncludeHistory
									group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
						) solsubhistory on solsubhistory.arn = staging.arn 
			/*
			left join aaIntDisbursementSubmission currentsubmission on currentsubmission.arn = staging.arn 				
				
			where currentsubmission.arn is null
				--and solsubhistory.SolicitorSubmissionCompleted = 1
				and solsubhistory.DisbursementCheckerSubmissionCompleted = 1
			*/
			/*
			left join (select arn, max(billingid) as billingid_max 
						from aaIntDisbursementSubmission
						group by arn) tbl_max_billing_id on tbl_max_billing_id.arn =staging.arn 
			*/
			/*
			where (currentsubmission.arn is null 
					or 				
					currentsubmission.DisbursementCheckerSubmissionCompleted = 1
					)
				and solsubhistory.SolicitorSubmissionCompleted = 1					
			*/
			
			/*
			-- new billing if sol disbursement submission is not completed 
			insert into aaIntDisbursementSubmission
			select 
				staging.[arn] as [arn]
			  ,solsubhistory.[BalanceAdviceLetterApplicableFlag] as [BalanceAdviceLetterApplicableFlag]
			  ,solsubhistory.[UrgentFlag] as [UrgentFlag]
			  ,solsubhistory.[LS_RedemptionDueDateFlag] as [LS_RedemptionDueDateFlag]
			  ,solsubhistory.[LS_RedemptionDueDate] as [LS_RedemptionDueDate]
			  ,solsubhistory.[LS_ExtendedCompletionDateFlag] as [LS_ExtendedCompletionDateFlag]
			  ,solsubhistory.[LS_CompletionDate] as [LS_CompletionDate]
			  ,solsubhistory.[LS_ExtendedCompletionDate] as [LS_ExtendedCompletionDate]
			  ,solsubhistory.[PR_DeveloperBillingDueDateFlag] as [PR_DeveloperBillingDueDateFlag]
			  ,solsubhistory.[PR_Stage2AFlag] as [PR_Stage2AFlag]
			  ,solsubhistory.[PR_Stage2BFlag] as [PR_Stage2BFlag]
			  ,solsubhistory.[PR_Stage2CFlag] as [PR_Stage2CFlag]
			  ,solsubhistory.[PR_Stage2DFlag] as [PR_Stage2DFlag]
			  ,solsubhistory.[PR_Stage2EFlag] as [PR_Stage2EFlag]
			  ,solsubhistory.[PR_Stage2FFlag] as [PR_Stage2FFlag]
			  ,solsubhistory.[PR_Stage2GFlag] as [PR_Stage2GFlag]
			  ,solsubhistory.[PR_Stage2HFlag] as [PR_Stage2HFlag]
			  ,solsubhistory.[PR_StageOthers] as [PR_StageOthers]
			  ,solsubhistory.[PR_EarliestBillingDueDate] as [PR_EarliestBillingDueDate]
			  ,solsubhistory.[PR_TotalBillingAmount] as [PR_TotalBillingAmount]
			  ,solsubhistory.[PR_AnyBridgingFinancierFlag] as [PR_AnyBridgingFinancierFlag]
			  ,solsubhistory.[PR_BridgingFinancier] as [PR_BridgingFinancier]
			  ,solsubhistory.[PR_BridgingFinancierEmailAddress] as [PR_BridgingFinancierEmailAddress]
			  ,solsubhistory.[PR_BridgingFinancierRedemptionSum] as [PR_BridgingFinancierRedemptionSum]
			  ,solsubhistory.[PR_RedemptionPaymentAccountNumber] as [PR_RedemptionPaymentAccountNumber]
			  ,solsubhistory.[PR_BeneficiaryBank] as [PR_BeneficiaryBank]
			  ,solsubhistory.[PR_BridgingFinancierRedemptionExpiryDate] as [PR_BridgingFinancierRedemptionExpiryDate]
			  ,solsubhistory.[PR_DeveloperName] as [PR_DeveloperName]
			  ,solsubhistory.[PR_DeveloperEmailAddress] as [PR_DeveloperEmailAddress]
			  ,solsubhistory.[PR_DeveloperPIC] as [PR_DeveloperPIC]
			  ,solsubhistory.[PR_DeveloperHDA] as [PR_DeveloperHDA]
			  ,solsubhistory.[PR_DeveloperHDABank] as [PR_DeveloperHDABank]
			  ,solsubhistory.[LF_PayeeName] as [LF_PayeeName]
			  ,solsubhistory.[LF_BilledAmount] as [LF_BilledAmount]
			  ,solsubhistory.[LF_AccountNumber] as [LF_AccountNumber]
			  ,solsubhistory.[LF_Bank] as [LF_Bank]
			  ,solsubhistory.[LF_PaymentDescription] as [LF_PaymentDescription]
			  ,solsubhistory.[LF_PaymentMode] as [LF_PaymentMode]
			  ,solsubhistory.[UpdateInfo_Reason] as [UpdateInfo_Reason] 
			  ,solsubhistory.[UpdateInfo_Others] as [UpdateInfo_Others]
			  ,solsubhistory.[CancelLoan_Remarks] as [CancelLoan_Remarks]
			  ,solsubhistory.[CancelLoan_File] as [CancelLoan_File]
			  ,'New Billing' as [SolicitorSubmissionOption]
			  ,solsubhistory.[SolicitorSubmissionCompleted] as [SolicitorSubmissionCompleted]
			  ,solsubhistory.[SolicitorCode] as [SolicitorCode]
			  ,solsubhistory.[SolicitorSubmissionDate] as [SolicitorSubmissionDate]
			  ,solsubhistory.[SolicitorSubmissionPDFID] as [SolicitorSubmissionPDFID]
			  ,null as [DisbursementMakerEmailAddress]
			  ,null as [DisbursementMakerDecision]
			  ,null as [DisbursementMakerSubmissionCompleted]
			  ,null as [DisbursementMakerRejectionReason]
			  ,null as [DisbursementMakerSubmissionDate]
			  ,null as [DisbursementMakerSubmissionPDFID]
			  ,null as [DisbursementCheckerEmailAddress]
			  ,null as [DisbursementCheckerDecision]
			  ,null as [DisbursementCheckerSubmissionCompleted]
			  ,null as [DisbursementCheckerRejectionReason]
			  ,null as [DisbursementCheckerSubmissionDate]
			  ,null as [DisbursementCheckerPDFID]
			   ,null as [RCOMakerEmailAddress]
			  ,null as [RCOMakerDecision]
			  ,null as [RCOMakerSubmissionCompleted]
			  ,null as [RCOMakerRejectionReason]
			  ,null as [RCOMakerSubmissionDate]
			  ,null as [RCOMakerPDFID]
			  ,null as [RCOCheckerEmailAddress]
			  ,null as [RCOCheckerDecision]
			  ,null as [RCOCheckerSubmissionCompleted]
			  ,null as [RCOCheckerRejectionReason]
			  ,null as [RCOCheckerSubmissionDate]
			  ,null as [RCOCheckerPDFID]
			  ,getdate() as [CreatedDate]
			  ,getdate() as [UpdatedDate]
			  --,case when tbl_max_billing_id.billingid_max is not null then (tbl_max_billing_id.billingid_max) + 1 else 1 end 
			from aaIntDisbursement_New_Billing_Staging staging 
			left join aaIntDisbursementSubmission currentsubmission on currentsubmission.arn = staging.arn 				
			left join (select history.*
						from vw_aaSolDisbursementSubmissionIncludeHistory history
						inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
									from vw_aaSolDisbursementSubmissionIncludeHistory
									group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
						) solsubhistory on solsubhistory.arn = staging.arn 	
			/*
			left join (select arn, max(billingid) as billingid_max 
						from aaIntDisbursementSubmission
						group by arn) tbl_max_billing_id on tbl_max_billing_id.arn =staging.arn 
			*/
			/*
			where (currentsubmission.arn is null 
					or 				
					currentsubmission.DisbursementCheckerSubmissionCompleted = 1
					)
				and solsubhistory.SolicitorSubmissionCompleted = 1					
			*/
			where currentsubmission.arn is not null
				--and solsubhistory.SolicitorSubmissionCompleted = 1
				and solsubhistory.DisbursementCheckerSubmissionCompleted = 1
			*/

			/*
			-- new billing(pending LA) if sol disbursement submission is not completed 
			insert into aaIntDisbursementSubmission_pendingLA   ([arn]
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
			select 
				staging.[arn] as [arn]
			  ,solsubhistory.[BalanceAdviceLetterApplicableFlag] as [BalanceAdviceLetterApplicableFlag]
			  ,solsubhistory.[UrgentFlag] as [UrgentFlag]
			  ,solsubhistory.[LS_RedemptionDueDateFlag] as [LS_RedemptionDueDateFlag]
			  ,solsubhistory.[LS_RedemptionDueDate] as [LS_RedemptionDueDate]
			  ,solsubhistory.[LS_ExtendedCompletionDateFlag] as [LS_ExtendedCompletionDateFlag]
			  ,solsubhistory.[LS_CompletionDate] as [LS_CompletionDate]
			  ,solsubhistory.[LS_ExtendedCompletionDate] as [LS_ExtendedCompletionDate]
			  ,solsubhistory.[PR_DeveloperBillingDueDateFlag] as [PR_DeveloperBillingDueDateFlag]
			  ,solsubhistory.[PR_Stage2AFlag] as [PR_Stage2AFlag]
			  ,solsubhistory.[PR_Stage2BFlag] as [PR_Stage2BFlag]
			  ,solsubhistory.[PR_Stage2CFlag] as [PR_Stage2CFlag]
			  ,solsubhistory.[PR_Stage2DFlag] as [PR_Stage2DFlag]
			  ,solsubhistory.[PR_Stage2EFlag] as [PR_Stage2EFlag]
			  ,solsubhistory.[PR_Stage2FFlag] as [PR_Stage2FFlag]
			  ,solsubhistory.[PR_Stage2GFlag] as [PR_Stage2GFlag]
			  ,solsubhistory.[PR_Stage2HFlag] as [PR_Stage2HFlag]
			  ,solsubhistory.[PR_StageOthers] as [PR_StageOthers]
			  ,solsubhistory.[PR_EarliestBillingDueDate] as [PR_EarliestBillingDueDate]
			  ,solsubhistory.[PR_TotalBillingAmount] as [PR_TotalBillingAmount]
			  ,solsubhistory.[PR_AnyBridgingFinancierFlag] as [PR_AnyBridgingFinancierFlag]
			  ,solsubhistory.[PR_BridgingFinancier] as [PR_BridgingFinancier]
			  ,solsubhistory.[PR_BridgingFinancierEmailAddress] as [PR_BridgingFinancierEmailAddress]
			  ,solsubhistory.[PR_BridgingFinancierRedemptionSum] as [PR_BridgingFinancierRedemptionSum]
			  ,solsubhistory.[PR_RedemptionPaymentAccountNumber] as [PR_RedemptionPaymentAccountNumber]
			  ,solsubhistory.[PR_BeneficiaryBank] as [PR_BeneficiaryBank]
			  ,solsubhistory.[PR_BridgingFinancierRedemptionExpiryDate] as [PR_BridgingFinancierRedemptionExpiryDate]
			  ,solsubhistory.[PR_DeveloperName] as [PR_DeveloperName]
			  ,solsubhistory.[PR_DeveloperEmailAddress] as [PR_DeveloperEmailAddress]
			  ,solsubhistory.[PR_DeveloperPIC] as [PR_DeveloperPIC]
			  ,solsubhistory.[PR_DeveloperHDA] as [PR_DeveloperHDA]
			  ,solsubhistory.[PR_DeveloperHDABank] as [PR_DeveloperHDABank]
			  ,solsubhistory.[LF_PayeeName] as [LF_PayeeName]
			  ,solsubhistory.[LF_BilledAmount] as [LF_BilledAmount]
			  ,solsubhistory.[LF_AccountNumber] as [LF_AccountNumber]
			  ,solsubhistory.[LF_Bank] as [LF_Bank]
			  ,solsubhistory.[LF_PaymentDescription] as [LF_PaymentDescription]
			  ,solsubhistory.[LF_PaymentMode] as [LF_PaymentMode]
			  ,solsubhistory.[UpdateInfo_Reason] as [UpdateInfo_Reason] 
			  ,solsubhistory.[UpdateInfo_Others] as [UpdateInfo_Others]
			  ,solsubhistory.[CancelLoan_Remarks] as [CancelLoan_Remarks]
			  ,solsubhistory.[CancelLoan_File] as [CancelLoan_File]
			  ,'New Billing' as [SolicitorSubmissionOption]
			  ,solsubhistory.[SolicitorSubmissionCompleted] as [SolicitorSubmissionCompleted]
			  ,solsubhistory.[SolicitorCode] as [SolicitorCode]
			  ,solsubhistory.[SolicitorSubmissionDate] as [SolicitorSubmissionDate]
			  ,solsubhistory.[SolicitorSubmissionPDFID] as [SolicitorSubmissionPDFID]
			  ,null as [DisbursementMakerEmailAddress]
			  ,null as [DisbursementMakerDecision]
			  ,null as [DisbursementMakerSubmissionCompleted]
			  ,null as [DisbursementMakerRejectionReason]
			  ,null as [DisbursementMakerSubmissionDate]
			  ,null as [DisbursementMakerSubmissionPDFID]
			  ,null as [DisbursementCheckerEmailAddress]
			  ,null as [DisbursementCheckerDecision]
			  ,null as [DisbursementCheckerSubmissionCompleted]
			  ,null as [DisbursementCheckerRejectionReason]
			  ,null as [DisbursementCheckerSubmissionDate]
			  ,null as [DisbursementCheckerPDFID]
			    ,null as [RCOMakerEmailAddress]
			  ,null as [RCOMakerDecision]
			  ,null as [RCOMakerSubmissionCompleted]
			  ,null as [RCOMakerRejectionReason]
			  ,null as [RCOMakerSubmissionDate]
			  ,null as [RCOMakerPDFID]
			  ,null as [RCOCheckerEmailAddress]
			  ,null as [RCOCheckerDecision]
			  ,null as [RCOCheckerSubmissionCompleted]
			  ,null as [RCOCheckerRejectionReason]
			  ,null as [RCOCheckerSubmissionDate]
			  ,null as [RCOCheckerPDFID]
			  ,getdate() as [CreatedDate]
			  ,getdate() as [UpdatedDate]
			  --,case when tbl_max_billing_id.billingid_max is not null then (tbl_max_billing_id.billingid_max) + 1 else 1 end 			
			from aaIntDisbursement_New_Billing_Staging staging 
			left join aaIntDisbursementSubmission currentsubmission on currentsubmission.arn = staging.arn 				
			left join (select history.*
						from vw_aaSolDisbursementSubmissionIncludeHistory history
						inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
									from vw_aaSolDisbursementSubmissionIncludeHistory
									group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
						) solsubhistory on solsubhistory.arn = staging.arn 		
			/*
			left join (select arn, max(billingid) as billingid_max 
						from aaIntDisbursementSubmission
						group by arn) tbl_max_billing_id on tbl_max_billing_id.arn =staging.arn 
			*/
			/*
			where solsubhistory.arn is null 
				and currentsubmission.arn is null 
			*/
			where solsubhistory.arn is null  
			*/

			update tblCDC
			set newBillingCDC = @NewCDC	
		end 
		
end

GO
