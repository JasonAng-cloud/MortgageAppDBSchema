/****** Object:  StoredProcedure [dbo].[usp_getSolicitorCancellationAttachmentFileContent]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getSolicitorCancellationAttachmentFileContent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getSolicitorCancellationAttachmentFileContent]
GO
/****** Object:  StoredProcedure [dbo].[usp_getSolicitorCancellationAttachmentFileContent]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_getSolicitorCancellationAttachmentFileContent]
@arn nvarchar(100)
as
begin

	declare @ImageSource xml
	declare @Image nvarchar(max)
	declare @ImageName nvarchar(max)

	select @ImageSource= SolicitorCancellationReportAttachment	
	--select * 
	from dbo.SQLSolicitorDPSubmission 
	where arn = @arn
	

	set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')
	--set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	set @ImageName= 'Cancellation.pdf'
	select @Image as SolicitorCancellationReportAttachment, @ImageName as SolicitorCancellationReportAttachmentFileName
end 


GO
