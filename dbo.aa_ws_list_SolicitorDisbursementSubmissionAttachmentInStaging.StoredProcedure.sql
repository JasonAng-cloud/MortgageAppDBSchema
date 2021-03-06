/****** Object:  StoredProcedure [dbo].[aa_ws_list_SolicitorDisbursementSubmissionAttachmentInStaging]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_list_SolicitorDisbursementSubmissionAttachmentInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_list_SolicitorDisbursementSubmissionAttachmentInStaging]
GO
/****** Object:  StoredProcedure [dbo].[aa_ws_list_SolicitorDisbursementSubmissionAttachmentInStaging]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE         procedure [dbo].[aa_ws_list_SolicitorDisbursementSubmissionAttachmentInStaging]
@arn nvarchar(100) = null 
as
begin

	select filecontent as ItemContent,
		[filename] as ItemFileName,
		filetype as ItemFileType
	from attachment_staging
	where arn = @arn 	
		and workflow = 'DisbursementSolicitorSubmission'
	
end 
GO
