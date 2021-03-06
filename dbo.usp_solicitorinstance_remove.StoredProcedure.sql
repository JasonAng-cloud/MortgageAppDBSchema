/****** Object:  StoredProcedure [dbo].[usp_solicitorinstance_remove]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_solicitorinstance_remove]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_solicitorinstance_remove]
GO
/****** Object:  StoredProcedure [dbo].[usp_solicitorinstance_remove]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE procedure [dbo].[usp_solicitorinstance_remove]
  @arn nvarchar(100) = null,
  @error nvarchar(max) = null output 
  as
  begin
	
	set @error = ''
	/*
	delete from [dbo].[K2Instance]
	where Workflow= 'DPDUMakerSolicitorApproval'
		and arn =  @arn	
	*/

	delete from MortgageAppTaskInstance
	where Workflow= 'DPDUMakerSolicitorApproval'
		and arn = @arn

	-- dumaker submission 
	delete from SQLDUMakerDP_SolicitorSubmission
	where arn = @arn 
	
	-- dumaker submission (rejected)
	delete from SQLDUMakerDP_SolicitorSubmission_ExeDocs_Rejected
	where arn = @arn 

	delete from SQLDUMakerDP_SolicitorSubmission_Rejected
	where arn = @arn 

	-- solicitor submission
	delete from SQLSolicitorDPSubmission
	where arn = @arn

	delete from SQLSolicitorDPSubmissionAttachment2
	where arn = @arn

	delete from SQLSolicitorDPSubmissionExeDocs
	where arn = @arn

	delete from SQLSolicitorDPSubmissionRemark
	where arn = @arn

	-- solicitor submission in staging
	delete from SQLSolicitorDPSubmission_staging
	where arn = @arn

	delete from SQLSolicitorDPSubmissionAttachment2_staging
	where arn = @arn

	delete from SQLSolicitorDPSubmissionExeDocs_staging
	where arn = @arn

	delete from SQLSolicitorDPSubmissionRemark_staging
	where arn = @arn

	declare @NewSolCode nvarchar(max) 

	select @NewSolCode = [SolicitorCode]
	from [SQLLOADS]
	where arn = @arn 

	insert into WorkflowHistory
	values ('Documentation',@arn,'Change of Solicitor',@NewSolCode,null,getdate())
  end 
GO
