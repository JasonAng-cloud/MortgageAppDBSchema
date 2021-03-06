/****** Object:  StoredProcedure [dbo].[usp_getSolicitorOthersAttachmentFileContent]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getSolicitorOthersAttachmentFileContent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getSolicitorOthersAttachmentFileContent]
GO
/****** Object:  StoredProcedure [dbo].[usp_getSolicitorOthersAttachmentFileContent]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_getSolicitorOthersAttachmentFileContent]
@arn nvarchar(100),
@solicitorcode nvarchar(100),
@fileid int 
as
begin

	declare @ImageSource xml
	declare @Image nvarchar(max)
	declare @ImageName nvarchar(max)

	select @ImageSource= Attachment	
	--select * 
	from dbo.SQLSolicitorDPSubmissionAttachment2 
	where arn = @arn
		and solicitorcode = @solicitorcode 
		and AttachmentID = @fileid
	
	set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')
	--set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	set @ImageName= 'others.pdf'
	select @Image as Attachment, @ImageName as AttachmentFileName
end 


GO
