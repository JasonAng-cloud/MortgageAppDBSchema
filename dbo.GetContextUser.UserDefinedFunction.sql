/****** Object:  UserDefinedFunction [dbo].[GetContextUser]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetContextUser]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetContextUser]
GO
/****** Object:  UserDefinedFunction [dbo].[GetContextUser]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE FUNCTION [dbo].[GetContextUser] ( )
RETURNS nvarchar(128)
AS
BEGIN
    declare @nvc nvarchar(128);
    set @nvc = convert(nvarchar(128),CONTEXT_INFO())
    set @nvc = LOWER((SELECT REPLACE(@nvc, nCHAR(0),
               '' COLLATE Latin1_General_100_BIN2)));
    RETURN @nvc
END
GO
