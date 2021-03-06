/****** Object:  StoredProcedure [dbo].[usp_ValuerUISession_SetVar1]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerUISession_SetVar1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerUISession_SetVar1]
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuerUISession_SetVar1]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   procedure [dbo].[usp_ValuerUISession_SetVar1]
@ValCode nvarchar(max) =null ,
@Var1 nvarchar(max) =null 
as
begin
	if exists
	(
		select 1
		from ValuerUISession
		where ValuerCode = @ValCode
	)
	begin
		update ValuerUISession
		set var1 = @Var1
	end
	else
	begin
		insert into ValuerUISession (ValuerCode, Var1)
		values (@ValCode, @Var1)
	end 
end 
GO
