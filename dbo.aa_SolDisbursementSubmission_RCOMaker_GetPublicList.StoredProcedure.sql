/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPublicList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPublicList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPublicList]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPublicList]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE     procedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPublicList]
as
begin
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		--case when rejected.arn is not null then 'Rejected by Disbursement Checker' else solsub.SolicitorSubmissionOption end as 'Status',		
		case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by RCO Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'No' end as 'VR Required', 
		case when vrapproved.arn is null then 'No' else 'Yes' end as 'VR Received',
		solsub.SolicitorSubmissionDate as SubmissionDate ,		
		case  when solsub.RCOMakerEmailAddress is null then m_rejected.RCOMakerEmailAddress else solsub.RCOMakerEmailAddress end as LastModifiedBy,
		case  when solsub.UpdatedDate is null then m_rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate	
	from aaSolDisbursementSubmission solsub		
		inner join sqlloads loads on loads.arn = solsub.arn 
		left join aaSolDisbursementSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1		
		left join aaSolDisbursementSubmission_RCOCheckerRejected c_rejected on c_rejected.arn = solsub.arn 
		left join aaSolDisbursementSubmission_RCOMakerRejected m_rejected on m_rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
	where 
		--solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted','Cancelled')
		solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted')
		and solsub.SolicitorSubmissionCompleted=1
		and solsub.DisbursementMakerSubmissionCompleted=1
		and solsub.DisbursementCheckerSubmissionCompleted=1
		and solsub.DisbursementCheckerDecision in ('Approve')
		--and solsub.arn not in (select arn from K2Instance where workflow = 'RCOMakerDisbursementApproval')
		and solsub.arn not in (select arn from MortgageAppTaskInstance where workflow = 'DisbRCOMakerSolicitorApproval')
		and isnull(solsub.RCOMakerSubmissionCompleted,0) <> 1
		--dumaker.[Status] = 'Completed'
		--and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission where SolicitorSubmissionStatus in ('Submitted','Resubmitted','Cancelled') )		
end 

GO
