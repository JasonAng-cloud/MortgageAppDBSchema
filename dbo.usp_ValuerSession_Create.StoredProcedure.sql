/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_Create]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerSession_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerSession_Create]
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_Create]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_ValuerSession_Create]
@ValuerCode nvarchar(100),
@ClientSessionID bigint, 
@error nvarchar(max) =null output 
as
begin

	delete from ValuerLoginTrialSession where ValuerCode = @ValuerCode
	
	delete from ValuerSession where ValuerCode = @ValuerCode

	declare @ValuerSessionInMinutes int 

	select @ValuerSessionInMinutes = ValuerSessionInMinutes
	from settings 

	insert into ValuerSession (ValuerCode, LogonDatetime, Expired, ClientSessionID ) 
	values( @ValuerCode, getdate(),DATEADD(MINUTE, @ValuerSessionInMinutes, getdate()),@ClientSessionID)

	insert into ValuerUserLoginLog
	values (@ValuerCode, getdate(), getdate())

	/*
	if not exists 
	(
		select 1 as col1
		from ValuerSession
		where ValuerCode = @ValuerCode
	)
	begin
		insert into ValuerSession (ValuerCode, LogonDatetime, Expired) 
		values( @ValuerCode, getdate(),DATEADD(MINUTE, 20, getdate()))
	end 
	else
	begin 
		set @error = 'session existed'
	end 
	*/
end 
GO
