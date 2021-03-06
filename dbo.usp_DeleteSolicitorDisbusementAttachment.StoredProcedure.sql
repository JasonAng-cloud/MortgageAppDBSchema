/****** Object:  StoredProcedure [dbo].[usp_DeleteSolicitorDisbusementAttachment]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteSolicitorDisbusementAttachment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DeleteSolicitorDisbusementAttachment]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteSolicitorDisbusementAttachment]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_DeleteSolicitorDisbusementAttachment]
@arn nvarchar(max) =null,
@output nvarchar(max) = null output
as
begin
	
	set @output = ''

	update aaSolDisbursementSubmission
	set CancelLoan_File = null 
	where arn = @arn 

	update aaSolDisbursementSubmission_staging
	set CancelLoan_File = null 
	where arn = @arn 

	delete from aaSolicitorDisbursementSubmissionAttachment
	where arn = @arn 

	delete from aaSolicitorDisbursementSubmissionAttachment_staging
	where arn = @arn 
end 
GO
