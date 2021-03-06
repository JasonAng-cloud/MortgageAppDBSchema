/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_GetSessionRemainingTime]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_Session_GetSessionRemainingTime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_Session_GetSessionRemainingTime]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_GetSessionRemainingTime]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_InternalUser_Session_GetSessionRemainingTime]
@UserName nvarchar(100) = null,
@TimeInSecond bigint = null output 
as
begin
	
	if (@UserName like 'K2:%')
	begin		
		set @UserName = Stuff(@UserName, 1, 3, '')					

	end 

	set @TimeInSecond = 0

	declare @SessionExpiryDatetime datetime 

	select @SessionExpiryDatetime = Expired	
	from InternalUserSession
	where username = @UserName	

	set @TimeInSecond = DATEDIFF ( second , getdate() , @SessionExpiryDatetime )  	
	set @TimeInSecond = @TimeInSecond * 1000 

end 
GO
