/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_SelectAll]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_SelectAll]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   procedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_SelectAll]
@arn nvarchar(max) = null
as
begin

	SELECT [ARN]
      ,[SolicitorCode]
      ,[AttachmentID]
      ,[Attachment]
      ,[CreatedDate]
      ,[AttachmentName]
	from aaSolicitorDisbursementSubmissionAttachment
	where arn = @arn 

end 
GO
