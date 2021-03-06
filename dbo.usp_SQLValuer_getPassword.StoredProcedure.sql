/****** Object:  StoredProcedure [dbo].[usp_SQLValuer_getPassword]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuer_getPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuer_getPassword]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLValuer_getPassword]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_SQLValuer_getPassword]
@ValuerCode nvarchar(100) = null,
@ValuerPassword nvarchar(max)  = null output,
@EncryptionKey nvarchar(max)  = null output
as
begin
	select @ValuerPassword = ValuerPassword
	from SQLValuer
	where ValuerCode = @ValuerCode

	select @EncryptionKey = [EncryptionKey]
	from [Settings]
end 

GO
