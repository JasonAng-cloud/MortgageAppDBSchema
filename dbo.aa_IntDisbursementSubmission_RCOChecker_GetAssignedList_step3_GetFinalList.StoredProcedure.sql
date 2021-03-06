/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]
GO
/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE         procedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList] 
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
		--case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		'Billing'  as 'Disbursement Stage',
		--case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by Disbursement Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		--case when c_rejected.arn is not null then 'Rejected by RCO Checker' else 'New' end as 'Status',	
		'New' as 'Status',	
		DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		worklist.SerialNumber
	from aaIntDisbursementSubmission IntSub 	
		inner join sqlloads loads on loads.arn = IntSub.arn 
		inner join aaIntDisbursementSubmission_RCOChecker_AssignedList worklist on worklist.arn = IntSub.arn 
		left join aaIntDisbursementSubmission_History history on history.arn = IntSub.arn and history.RunningIDForCompletedSubmission = 1		
		--left join aaIntDisbursementSubmission_RCOCheckerRejected c_rejected on c_rejected.arn = IntSub.arn 
		--left join aaIntDisbursementSubmission_DisMakerRejected m_rejected on m_rejected.arn = IntSub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = IntSub.arn and vrapproved.[Status] = 'Completed'
	where  worklist.allocateduser = @AllocatedUser
	
end 

GO
