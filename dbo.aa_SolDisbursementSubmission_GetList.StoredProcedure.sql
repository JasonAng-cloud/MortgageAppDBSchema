/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetList]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetList]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[aa_SolDisbursementSubmission_GetList]
@solcode nvarchar(100) = null 
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
		case when rejected.arn is not null then 'Rejected' when updateinfo.arn is not null then 'UpdateInfo' else 'New' end as 'Status',		
		DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Aging'	
	from SQLDUMakerDP_SolicitorSubmission dumaker 
		inner join sqlloads loads on loads.arn = dumaker.arn 
		left join aaSolDisbursementSubmission_History history on history.arn = dumaker.arn and history.RunningIDForCompletedSubmission = 1
		left join aaSolDisbursementSubmission solsub on solsub.arn = dumaker.arn 
		left join aaSolDisbursementSubmission_DisMakerRejected rejected on rejected.arn = dumaker.arn 
		left join aaSolDisbursementSubmission_updateinfo updateinfo on updateinfo.arn = dumaker.arn 
		left join aaSolDisbursementSubmission_staging staging on staging.arn = dumaker.arn 
	where 
		dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
		and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where a.SolicitorSubmissioncompleted =1 )				
		and dumaker.arn not in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] and isnull(BalanceAdviceLetterApplicableFlag,0) = 0)
		and staging.arn is null 
		and loads.SolicitorCode = @solcode 		
end 
GO
