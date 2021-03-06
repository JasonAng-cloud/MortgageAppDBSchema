/****** Object:  StoredProcedure [dbo].[usp_ws_SQLSolicitorDPSubmission_Main_MoveToMain]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SQLSolicitorDPSubmission_Main_MoveToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SQLSolicitorDPSubmission_Main_MoveToMain]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_SQLSolicitorDPSubmission_Main_MoveToMain]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_ws_SQLSolicitorDPSubmission_Main_MoveToMain]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin

	insert into SQLSolicitorDPSubmissionRemark
	select * from SQLSolicitorDPSubmissionRemark_Staging
	where arn = @arn

	/*
	insert into SQLSolicitorDPSubmissionAttachment2
	select * from SQLSolicitorDPSubmissionAttachment2_Staging
	where arn = @arn
	*/

	insert into SQLSolicitorDPSubmissionExeDocs
	select * from SQLSolicitorDPSubmissionExeDocs_Staging
	where arn = @arn

	update SQLSolicitorDPSubmission_Staging
	set SolicitorCancellationReportAttachment = null,
		SolicitorRefReportAttachment = null		
	where arn = @arn 

	insert into SQLSolicitorDPSubmission
	select * from SQLSolicitorDPSubmission_Staging
	where arn = @arn


	delete from SQLSolicitorDPSubmission_Staging
	where arn = @arn 

	delete from SQLSolicitorDPSubmissionExeDocs_Staging
	where arn = @arn 

	delete from SQLSolicitorDPSubmissionAttachment2_Staging
	where arn = @arn 

	delete from SQLSolicitorDPSubmissionRemark_Staging
	where arn = @arn 

	declare @solicitorstatus nvarchar(max), @solcode nvarchar(max) 
	select @solicitorstatus = [status], @solcode = SolicitorCode
	from SQLSolicitorDPSubmission
	where arn = @arn 

	if (@solicitorstatus = 'Submitted') 
	begin
		insert into WorkflowHistory
		values ('Documentation',@arn,'Documentation Submitted',@solcode,null,getdate())
	end 	
	
	if ( @solicitorstatus = 'Resubmitted') 
	begin
		insert into WorkflowHistory
		values ('Documentation',@arn,'Documentation Resubmitted',@solcode,null,getdate())
	end 

	if ( @solicitorstatus = 'UpdateInfo') 
	begin
		insert into WorkflowHistory
		values ('Documentation',@arn,'Update Info Submitted',@solcode,null,getdate())
	end 

	if ( @solicitorstatus = 'Cancelled') 
	begin
		insert into WorkflowHistory
		values ('Documentation',@arn,'Cancellation Submitted',@solcode,null,getdate())
	end 
end 
GO
