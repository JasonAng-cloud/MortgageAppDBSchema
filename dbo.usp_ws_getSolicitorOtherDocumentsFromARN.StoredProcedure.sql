/****** Object:  StoredProcedure [dbo].[usp_ws_getSolicitorOtherDocumentsFromARN]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_getSolicitorOtherDocumentsFromARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_getSolicitorOtherDocumentsFromARN]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_getSolicitorOtherDocumentsFromARN]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_ws_getSolicitorOtherDocumentsFromARN]
@arn nvarchar(100),
@solicitorcode nvarchar(100)
as
begin

	declare @ImageSource xml	
	--declare @Image nvarchar(max)
	--declare @ImageName nvarchar(max)

	--declare @attachmentID int;
	
	--IF OBJECT_ID('tempdb..#temp_SQLSolicitorDPSubmissionAttachment2') IS NOT NULL DROP TABLE #temp_SQLSolicitorDPSubmissionAttachment2
	
	--select @ImageSource= Attachment	, @attachmentID = attachmentID
	--into tempdb..#temp_SQLSolicitorDPSubmissionAttachment2
	select 
		tbl.ARN,
		tbl.SolicitorCode,
		AttachmentID,
		--CreatedDate,
		'others.pdf' as AttachmentName,
		Attachment,
		--dbo.[ufn_getPDFImageName](Attachment) as ImageName,
		'others.pdf' as ImageName,
		dbo.[ufn_getPDFImage](Attachment) as Image,
		sqlloads.CustomerID as customerID,
		sqlloads.CustomerName as customerName
	from dbo.SQLSolicitorDPSubmissionAttachment2 tbl
	inner join sqlloads on sqlloads.arn = tbl.arn 
	where tbl.arn = @arn
		and tbl.SolicitorCode = @solicitorcode
		
	--set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	--set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')

	--select @Image as PDF, @ImageName as PDFFileName
	
end 


GO
