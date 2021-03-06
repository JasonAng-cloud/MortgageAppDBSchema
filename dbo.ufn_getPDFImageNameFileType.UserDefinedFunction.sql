/****** Object:  UserDefinedFunction [dbo].[ufn_getPDFImageNameFileType]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_getPDFImageNameFileType]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_getPDFImageNameFileType]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_getPDFImageNameFileType]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ufn_getPDFImageNameFileType]
(@ImageSource xml)
RETURNS nvarchar(max)
as
begin	
	
	--declare @ImageSource xml
	
	declare @ImageName nvarchar(max)
	declare @dotindex int
	declare @filetype nvarchar(max)
	declare @filetypereversed nvarchar(max)

	
	set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	set @dotindex = CHARINDEX('.', reverse(@ImageName))

	--select CHARINDEX('.', '4.Fixed asset - Internal Stock Requisition.pdf')
	--select reverse('4.Fixed asset - Internal Stock Requisition.pdf')
	set @filetypereversed = stuff(reverse(@ImageName),@dotindex,len(reverse(@ImageName))+1,'')
	set @filetype = reverse(@filetypereversed);
	--set @filetype =  stuff('Fixed asset - Internal Stock Requisition.pdf',1,CHARINDEX('.', 'Fixed asset - Internal Stock Requisition.pdf'),'')
	--select @filetype

	return @filetype
end 

GO
