/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDP_SolicitorSubmission_K2Instance_Select]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDP_SolicitorSubmission_K2Instance_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDP_SolicitorSubmission_K2Instance_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDP_SolicitorSubmission_K2Instance_Select]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_SQLDUMakerDP_SolicitorSubmission_K2Instance_Select] 
@AllocatedUser nvarchar(max)
as
begin
	
	if (@AllocatedUser like 'K2:%')
	begin		
		set @AllocatedUser = Stuff(@AllocatedUser, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	select i.arn as arn,
		--instance.EventInstanceStartDate as EventInstanceStartDate,
		FORMAT (i.Createddate, 'dd/MM/yyyy') as EventInstanceStartDate,
		FORMAT (i.UpdatedDate, 'dd/MM/yyyy') as EventInstanceLastModifiedDate,
		i.createduser as createduser,
		i.updateduser as updateduser,
		solicitor.Status as SolicitorStatus ,
		loads.LoanAmount as LoanAmount,
		loads.ApplicantName as ApplicantName,
		--solicitor.UpdatedDate as SubmissionDate,
		FORMAT (solicitor.UpdatedDate, 'dd/MM/yyyy') as SubmissionDate,		
		DATEDIFF(day, solicitor.UpdatedDate, getdate()) as aging ,
		loads.MortgateCenterCode,
		loads.FinancingType,
		loads.TotalFinancingAmount,
		--case when dumaker.DUMakerEmail is null then dumaker.DUMakerEmail else dumaker_reject.DUMakerEmail end as lastmodifieduser,
		--case when dumaker.DUMakerEmail is null then dumaker.UpdatedDate else dumaker_reject.UpdatedDate end as lastmodifieddate		
		case when dumaker.DUMakerEmail is null then dumaker_reject.DUMakerEmail else dumaker.DUMakerEmail end as lastmodifieduser,
		--case when dumaker.DUMakerEmail is null then dumaker_reject.UpdatedDate else dumaker.UpdatedDate end as lastmodifieddate	,
		case when dumaker.DUMakerEmail is null then FORMAT (dumaker_reject.UpdatedDate, 'dd/MM/yyyy') else FORMAT (dumaker.UpdatedDate, 'dd/MM/yyyy') end as lastmodifieddate	,
		loads.CollateralPurpose as CollateralPurpose
	--from SQLDUMakerDP_SolicitorSubmission_K2Instance instance
	from SQLSolicitorDPSubmission solicitor
		--inner join SQLSolicitorDPSubmission solicitor on solicitor.ARN = instance.arn 
		inner join sqlloads loads on loads.arn = solicitor.ARN
		left join SQLDUMakerDP_SolicitorSubmission dumaker on dumaker.arn = solicitor.arn 
		left join SQLDUMakerDP_SolicitorSubmission_Rejected dumaker_reject on dumaker_reject.arn = solicitor.arn 
		inner join MortgageAppTaskInstance i on i.arn = solicitor.ARN
			and i.Workflow = 'DPDUMakerSolicitorApproval'
	where i.TaskOwner = @AllocatedUser 
	
	
end 


GO
