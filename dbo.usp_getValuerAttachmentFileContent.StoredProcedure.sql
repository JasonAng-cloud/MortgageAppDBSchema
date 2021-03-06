/****** Object:  StoredProcedure [dbo].[usp_getValuerAttachmentFileContent]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getValuerAttachmentFileContent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getValuerAttachmentFileContent]
GO
/****** Object:  StoredProcedure [dbo].[usp_getValuerAttachmentFileContent]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_getValuerAttachmentFileContent]
@arn nvarchar(100)
as
begin

	declare @ImageSource xml
	declare @Image nvarchar(max)
	declare @ImageName nvarchar(max)

	select @ImageSource= ValuerReportAttachment	
	--select * 
	from dbo.SQLValuerDPSubmission 
	where arn = @arn
	

	set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')
	--set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	--set @ImageName= 'valuer'
	set @ImageName= 'valuer.pdf'
	select @Image as ValuerReportAttachment, @ImageName as ValuerReportAttachmentFileName
end 


GO
