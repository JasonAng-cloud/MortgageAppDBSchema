/****** Object:  StoredProcedure [dbo].[usp_ws_SQLValuerDPSubmission_MoveFailedToMain]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SQLValuerDPSubmission_MoveFailedToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SQLValuerDPSubmission_MoveFailedToMain]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_SQLValuerDPSubmission_MoveFailedToMain]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_ws_SQLValuerDPSubmission_MoveFailedToMain]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin	

	declare @status nvarchar(100)	

	if exists
	(
		select 1
		from SQLDUMakerDP_ValuerSubmission_LoweredOMV
		where arn = @arn 
	)
	begin
		set @status = 'Resubmit-New'
	end 
	else
	begin
		set @status = 'New'
	end 

	update SQLValuerDPSubmission_Staging
	set ValuerReportAttachment = null,
		status = @status,
		completed = 0 
	where arn = @arn 

	insert into SQLValuerDPSubmission
	select * from SQLValuerDPSubmission_Staging 
	where arn = @arn 
	

	delete from SQLValuerDPSubmission_Staging 
	where arn = @arn 

	-- generate email 
	declare @senderemail nvarchar(max),
		@valueremail nvarchar(max),
		@emailheader nvarchar(max),
		@emailcontent nvarchar(max)

	select @senderemail = [SenderEmail] FROM [dbo].[Settings]
	select @valueremail = valueremail from sqlloads where arn = @arn 

	delete from SQLJOB_DUMaker_Letter_AV_Valuer_email_content

	--insert into SQLJOB_DUMaker_Letter_AV_Valuer_generate_list_aging_staging
	insert into SQLJOB_DUMaker_Letter_AV_Valuer_email_content
	select @arn,   @valueremail, @senderemail, dbo.[ufn_DUMaker_Letter_AV_Valuer_header_generate](@arn), dbo.[ufn_DUMaker_Letter_AV_Valuer_body_generate](@arn) 
		
end 



GO
