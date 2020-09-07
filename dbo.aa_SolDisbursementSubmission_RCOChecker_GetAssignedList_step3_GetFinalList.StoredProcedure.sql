/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       procedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList] 
@AllocatedUser nvarchar(max)
as
begin
	
	if (@AllocatedUser like 'K2:%')
	begin		
		set @AllocatedUser = Stuff(@AllocatedUser, 1, 3, '')			
	end 

	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		--case when rejected.arn is not null then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		case when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'No' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		--worklist.SerialNumber
		solsub.SolicitorSubmissionDate as SubmissionDate ,
		case solsub.RCOCheckerEmailAddress when null then rejected.RCOCheckerEmailAddress else solsub.RCOCheckerEmailAddress end as LastModifiedBy,
		case solsub.UpdatedDate when null then rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate
	from aaSolDisbursementSubmission solsub		
		inner join sqlloads loads on loads.arn = solsub.arn 
		--inner join aaSolDisbursementSubmission_RCOChecker_AssignedList worklist on worklist.arn = solsub.arn 
		inner join MortgageAppTaskInstance worklist on worklist.arn = solsub.arn and workflow = 'DisbRCOCheckerSolicitorApproval'
		left join aaSolDisbursementSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1		
		left join aaSolDisbursementSubmission_RCOCheckerRejected rejected on rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
	where solsub.SolicitorSubmissionCompleted  = 1
		--and solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted','Cancelled')
		and solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted')
		and solsub.DisbursementMakerSubmissionCompleted  = 1
		and solsub.DisbursementCheckerSubmissionCompleted  = 1		
		and solsub.RCOMakerSubmissionCompleted  = 1
		and solsub.RCOMakerDecision in ('Approve')
		and isnull(solsub.RCOCheckerSubmissionCompleted,0) <> 1
		--and worklist.allocateduser = @AllocatedUser
	
end 

GO
