/****** Object:  StoredProcedure [dbo].[usp_SolicitorSession_Delete]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorSession_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorSession_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_SolicitorSession_Delete]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_SolicitorSession_Delete]
@SolicitorCode nvarchar(100),
@error nvarchar(max) =null output 
as
begin

	insert into SolicitorLogoutLog
	values (@SolicitorCode, getdate(), getdate())

	delete from SolicitorSession
	where SolicitorCode = @SolicitorCode

	/*
	if exists 
	(
		select 1 as col1
		from SolicitorSession
		where SolicitorCode = @SolicitorCode
	)
	begin
		delete from SolicitorSession
		where SolicitorCode = @SolicitorCode
	end 
	else
	begin 
		set @error = 'session not found'
	end 
	*/
end 
GO
