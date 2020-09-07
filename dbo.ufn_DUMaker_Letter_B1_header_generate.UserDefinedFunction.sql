/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_B1_header_generate]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_B1_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_B1_header_generate]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_B1_header_generate]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[ufn_DUMaker_Letter_B1_header_generate]
(@param_arn nvarchar(100))
RETURNS nvarchar(max)
as
begin	
	
	declare @line1 nvarchar(max)

	set @line1 = 'Reminder to forward valuation report for ' + @param_arn 
	
	return @line1
end 


GO
