/****** Object:  StoredProcedure [dbo].[aa_ws_check_SolicitorDisbursementSubmissionStillInStaging]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_check_SolicitorDisbursementSubmissionStillInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_check_SolicitorDisbursementSubmissionStillInStaging]
GO
/****** Object:  StoredProcedure [dbo].[aa_ws_check_SolicitorDisbursementSubmissionStillInStaging]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   procedure [dbo].[aa_ws_check_SolicitorDisbursementSubmissionStillInStaging]
@arn nvarchar(100) = null ,
@error nvarchar(100) = null output
as
begin
	set @error = ''
	if exists 
	(
		select 1
		from aaSolDisbursementSubmission_staging
		where arn = @arn 
	)
	begin
		set @error = '1'
	end 
end 
GO
