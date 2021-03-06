/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRejectedList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetRejectedList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRejectedList]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRejectedList]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE           procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRejectedList]
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
		case when rejected.arn is not null then 'Rejected' else solsub.SolicitorSubmissionOption end as 'Status',		
		DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'No' end as 'VR Required', 
		case when vrapproved.arn is null then 'No' else 'Yes' end as 'VR Received',
		solsub.SolicitorSubmissionDate as SubmissionDate ,
		case when solsub.DisbursementMakerEmailAddress is null then rejected.DisbursementMakerEmailAddress else solsub.DisbursementMakerEmailAddress end as LastModifiedBy,
		case when solsub.UpdatedDate is null then rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate	
	from vw_aaSolDisbursementSubmission solsub		
		inner join aaSolDisbursementSubmission_DisMakerRejected rejected on rejected.arn = solsub.arn 
		inner join sqlloads loads on loads.arn = solsub.arn 
		left join aaSolDisbursementSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1		
		--left join aaSolDisbursementSubmission_DisCheckerRejected rejected on rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
	--where solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted','Cancelled')
		--and solsub.SolicitorSubmissionCompleted=1
		--dumaker.[Status] = 'Completed'
		--and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission where SolicitorSubmissionStatus in ('Submitted','Resubmitted','Cancelled') )		
end 

GO
