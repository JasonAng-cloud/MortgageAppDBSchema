/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_DeleteSolicitorAttachments]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_DeleteSolicitorAttachments]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_DeleteSolicitorAttachments]
GO
/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_DeleteSolicitorAttachments]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_DeleteSolicitorAttachments]
@arn nvarchar(max) =null,
@output nvarchar(max) = null output
as
begin
	
	set @output = ''

	update aaSolDisbursementSubmission
	set CancelLoan_File = null 		
	where arn = @arn 

	delete from aaSolicitorDisbursementSubmissionAttachment
	where arn = @arn 

end 
GO
