/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_Delete]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerSession_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerSession_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_Delete]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_ValuerSession_Delete]
@ValuerCode nvarchar(100),
@error nvarchar(max) =null output 
as
begin
	
	insert into ValuerLogoutLog
	values (@ValuerCode, getdate(), getdate())

	delete from ValuerSession
	where ValuerCode = @ValuerCode

	/*
	if exists 
	(
		select 1 as col1
		from ValuerSession
		where ValuerCode = @ValuerCode
	)
	begin
		delete from ValuerSession
		where ValuerCode = @ValuerCode
	end 
	else
	begin 
		set @error = 'session not found'
	end 
	*/
end 
GO
