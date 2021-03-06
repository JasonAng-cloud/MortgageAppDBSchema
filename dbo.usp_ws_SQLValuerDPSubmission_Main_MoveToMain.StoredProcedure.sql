/****** Object:  StoredProcedure [dbo].[usp_ws_SQLValuerDPSubmission_Main_MoveToMain]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SQLValuerDPSubmission_Main_MoveToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SQLValuerDPSubmission_Main_MoveToMain]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_SQLValuerDPSubmission_Main_MoveToMain]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_ws_SQLValuerDPSubmission_Main_MoveToMain]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin

	insert into SQLValuerDPSubmissionRemark
	select * from SQLValuerDPSubmissionRemark_Staging
	where arn = @arn

	insert into SQLValuerDPSubmission
	select * from SQLValuerDPSubmission_Staging
	where arn = @arn


	delete from SQLValuerDPSubmission_Staging
	where arn = @arn 

	delete from SQLValuerDPSubmissionRemark_Staging
	where arn = @arn 

	declare @valuerstatus nvarchar(max), @valcode nvarchar(max) 
	select @valuerstatus = [status], @valcode = ValuerCode
	from SQLValuerDPSubmission
	where arn = @arn 

	if (@valuerstatus = 'Submitted') 
	begin
		insert into WorkflowHistory
		values ('Valuation Report',@arn,'VR Submitted',@valcode,null,getdate())
	end 	

	if (@valuerstatus = 'Submitted') 
	begin
		insert into WorkflowHistory
		values ('Valuation Report',@arn,'VR Resubmitted',@valcode,null,getdate())
	end 	

	if (@valuerstatus = 'UpdateInfo') 
	begin
		insert into WorkflowHistory
		values ('Valuation Report',@arn,'Update Info Submitted',@valcode,null,getdate())
	end 	

	if (@valuerstatus = 'Cancelled') 
	begin
		insert into WorkflowHistory
		values ('Valuation Report',@arn,'Cancellation Submitted',@valcode,null,getdate())
	end 	

	if (@valuerstatus = 'LowerOMV') 
	begin
		insert into WorkflowHistory
		values ('Valuation Report',@arn,'LowerOMV Submitted',@valcode,null,getdate())
	end 
	
end 
GO
