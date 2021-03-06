/****** Object:  UserDefinedFunction [dbo].[ufn_getPDFImageName]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_getPDFImageName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_getPDFImageName]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_getPDFImageName]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ufn_getPDFImageName]
(@ImageSource xml)
RETURNS nvarchar(max)
as
begin	
	
	--declare @ImageSource xml
	
	declare @ImageName nvarchar(max)
	
	set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	
	return @ImageName
end 

GO
