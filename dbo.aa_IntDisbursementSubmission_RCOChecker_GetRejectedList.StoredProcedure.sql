/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetRejectedList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOChecker_GetRejectedList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetRejectedList]
GO
/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetRejectedList]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE         procedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetRejectedList]
as
begin
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',		
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		'Billing'  as 'Disbursement Stage',
		--case when rejected.arn is not null then 'Rejected by RCO Checker' else 'New' end as 'Status',		
		'Rejected' as 'Status',		
		DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Aging',
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received'

	from aaIntDisbursementSubmission IntSub 
		inner join sqlloads loads on loads.arn = IntSub.arn 
		inner join aaIntDisbursementSubmission_RCOCheckerRejected rejected on rejected.arn = IntSub.arn 
		--left join aaK2Instance_billing instance on instance.arn = IntSub.arn 		
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = IntSub.arn and vrapproved.[Status] = 'Completed'
	/*
	where 		
		IntSub.DisbursementMakerSubmissionCompleted = 1
		and IntSub.DisbursementCheckerSubmissionCompleted = 1
		and IntSub.RCOMakerSubmissionCompleted = 1
		and isnull(IntSub.RCOCheckerSubmissionCompleted,0) <> 1
		and instance.arn is null 
		and IntSub.arn in (select arn from aaSolDisbursementSubmission where arn = IntSub.arn and SolicitorSubmissionCompleted = 1 union select arn from aaSolDisbursementSubmission_history where arn = IntSub.arn and SolicitorSubmissionCompleted = 1)
		and loads.DisbursementManner = 'PR'
	*/
end 
GO
