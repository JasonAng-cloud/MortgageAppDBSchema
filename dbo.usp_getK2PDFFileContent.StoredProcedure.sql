/****** Object:  StoredProcedure [dbo].[usp_getK2PDFFileContent]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getK2PDFFileContent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getK2PDFFileContent]
GO
/****** Object:  StoredProcedure [dbo].[usp_getK2PDFFileContent]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_getK2PDFFileContent]
@ID int
as
begin

	declare @ImageSource xml
	--declare @ImageSource nvarchar(max)
	declare @Image nvarchar(max)
	declare @ImageName nvarchar(max)

	select @ImageSource= PDF	
	--need to check
	from k2dbserver.k2.dbo.PdfFile 	
	--from kapps2.k2.dbo.PdfFile 
	where id = @id
	
	set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')

	select @Image as PDF, @ImageName as PDFFileName
	--select @ImageSource as PDF
end 



GO
