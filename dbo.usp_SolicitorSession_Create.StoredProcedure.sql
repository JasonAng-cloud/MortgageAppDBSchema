/****** Object:  StoredProcedure [dbo].[usp_SolicitorSession_Create]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorSession_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorSession_Create]
GO
/****** Object:  StoredProcedure [dbo].[usp_SolicitorSession_Create]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_SolicitorSession_Create]
@SolicitorCode nvarchar(100),
@ClientSessionID bigint, 
@error nvarchar(max) =null output 
as
begin
	
	delete from SolicitorLoginTrialSession where SolicitorCode = @SolicitorCode

	delete from SolicitorSession where SolicitorCode = @SolicitorCode

	declare @SolicitorSessionInMinutes int 

	select @SolicitorSessionInMinutes = SolicitorSessionInMinutes
	from settings 

	insert into SolicitorSession (SolicitorCode, LogonDatetime, Expired, ClientSessionID) 
		values( @SolicitorCode, getdate(),DATEADD(MINUTE, @SolicitorSessionInMinutes, getdate()), @ClientSessionID)

	insert into SolicitorUserLoginLog
	values (@SolicitorCode, getdate(), getdate())

	/*
	if not exists 
	(
		select 1 as col1
		from SolicitorSession
		where SolicitorCode = @SolicitorCode
	)
	begin
		insert into SolicitorSession (SolicitorCode, LogonDatetime, Expired) 
		values( @SolicitorCode, getdate(),DATEADD(MINUTE, 20, getdate()))
	end 
	else
	begin 
		set @error = 'session existed'
	end 
	*/
end 
GO
