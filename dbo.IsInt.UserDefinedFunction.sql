/****** Object:  UserDefinedFunction [dbo].[IsInt]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IsInt]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[IsInt]
GO
/****** Object:  UserDefinedFunction [dbo].[IsInt]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   FUNCTION [dbo].[IsInt]
(
@number VARCHAR(20)
)
RETURNS BIT
AS
BEGIN

   RETURN ISNUMERIC(Replace(Replace(@number,'+','A'),'-','A') + '.0e0')

END
GO
