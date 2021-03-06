/****** Object:  UserDefinedFunction [dbo].[ufn_getPDFImage]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_getPDFImage]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_getPDFImage]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_getPDFImage]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ufn_getPDFImage]
(@ImageSource xml)
RETURNS nvarchar(max)
as
begin	
	
	declare @Image nvarchar(max)
	
	set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')
	
	return @Image
end 

GO
