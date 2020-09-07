/****** Object:  StoredProcedure [dbo].[usp_ws_list_SolicitorDocumentationSubmissionAttachmentInStaging]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_list_SolicitorDocumentationSubmissionAttachmentInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_list_SolicitorDocumentationSubmissionAttachmentInStaging]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_list_SolicitorDocumentationSubmissionAttachmentInStaging]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE           procedure [dbo].[usp_ws_list_SolicitorDocumentationSubmissionAttachmentInStaging]
@arn nvarchar(100) = null 
as
begin

	select filecontent as ItemContent,
		[filename] as ItemFileName,
		filetype as ItemFileType
	from attachment_staging
	where arn = @arn 	
		and workflow = 'SolicitorDPSubmission'
	
end 
GO
