/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetPublicList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisChecker_GetPublicList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisChecker_GetPublicList]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetPublicList]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--[aa_SolDisbursementSubmission_DisChecker_GetPublicList] ''

CREATE       procedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetPublicList]
@DisCheckerEmail nvarchar(max) = null 
as
begin
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when history.arn IS NOT NULL then 'Balance Advice' else '1st Advice'  end as 'Disbursement Stage',
		--case when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		case when (m_rejected.arn is not null and c_rejected.arn is null) then 'Rejected by RCO Maker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'No' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		solsub.SolicitorSubmissionDate as SubmissionDate ,		
		case  when solsub.DisbursementCheckerEmailAddress is null then m_rejected.DisbursementCheckerEmailAddress else solsub.DisbursementCheckerEmailAddress end as LastModifiedBy,
		case  when solsub.UpdatedDate is null then m_rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate		
	from aaSolDisbursementSubmission solsub		
		inner join sqlloads loads on loads.arn = solsub.arn 		
		left join aaSolDisbursementSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1		
		left join aaSolDisbursementSubmission_DisCheckerRejected c_rejected on c_rejected.arn = solsub.arn 
		left join aaSolDisbursementSubmission_RCOMakerRejected m_rejected on m_rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
	where solsub.SolicitorSubmissionCompleted = 1
		and (solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted','Cancelled')
		and solsub.DisbursementMakerDecision in ('All In Order','With Outstanding Item','Accept Cancellation') )

		and solsub.DisbursementMakerSubmissionCompleted = 1
		and isnull(solsub.DisbursementCheckerSubmissionCompleted,0) <> 1
		and solsub.arn not in (select arn from MortgageAppTaskInstance where workflow = 'DisbDUCheckerSolicitorApproval')
		--and solsub.arn not in (select arn from K2Instance where workflow = 'DisCheckerDisbursementApproval')
		--and solsub.DisbursementMakerEmailAddress <> @DisCheckerEmail		
end 

GO
