/****** Object:  StoredProcedure [dbo].[usp_ws_valuerattachment_preupload]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_valuerattachment_preupload]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_valuerattachment_preupload]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_valuerattachment_preupload]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_ws_valuerattachment_preupload]
@arn nvarchar(100) = null ,
@k2attachment nvarchar(max) = null ,
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	if (ltrim(rtrim(@k2attachment)) = '' or @k2attachment = '<file><name>scnull</name><content>scnull</content></file>' or @k2attachment is null)
	begin
		set @error = 'empty attachment'
	end 

	if (@error='')
	begin
		--declare @checksum binary(32), 
		declare @attachmentfilename  nvarchar(max) = null ,
		@attachmentcontent  nvarchar(max) = null ,
		@attachmentfiletype  nvarchar(max) = null

		

		set @attachmentfilename = dbo.ufn_getPDFImageName((CONVERT(XML, @k2attachment)))
		set @attachmentcontent = dbo.[ufn_getPDFImage]((CONVERT(XML, @k2attachment)))
		set @attachmentfiletype = dbo.[ufn_getPDFImageNameFileType]((CONVERT(XML, @k2attachment)))

		declare @checksum bigint
		set @checksum =Checksum(@attachmentcontent)

		--set @checksum = HASHBYTES('SHA2_256', @attachmentcontent) 

		if not exists
		(
			select 1
			from attachment_staging
			where arn = @arn 
				and workflow = 'ValuerDPSubmission'
				and SHA2_256 = @checksum
		)
		begin
			insert into attachment_staging
			values (@arn, 'ValuerDPSubmission', @attachmentfilename, @attachmentcontent, @attachmentfiletype, getdate(), getdate(),getdate(), @checksum)
		end 
		else
		begin
			set @error = 'File existed'
		end 
	end 
	

	
end 
GO
