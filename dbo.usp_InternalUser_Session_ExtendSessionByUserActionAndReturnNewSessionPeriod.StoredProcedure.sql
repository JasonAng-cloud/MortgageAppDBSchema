/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_ExtendSessionByUserActionAndReturnNewSessionPeriod]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_Session_ExtendSessionByUserActionAndReturnNewSessionPeriod]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_Session_ExtendSessionByUserActionAndReturnNewSessionPeriod]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_ExtendSessionByUserActionAndReturnNewSessionPeriod]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     procedure [dbo].[usp_InternalUser_Session_ExtendSessionByUserActionAndReturnNewSessionPeriod]
@UserName nvarchar(100) = null,
@TimeInSecond bigint = null output 
as
begin
	if (@UserName like 'K2:%')
	begin						
		set @UserName = Stuff(@UserName, 1, 3, '')								
	end 

	declare @InternalUserSessionInMinutes int , @InternalUserDormantIDReportPeriodInDays int 
	declare @Expired datetime 

	select @InternalUserSessionInMinutes = InternalUserSessionInMinutes		
	from settings 
		
	set @Expired = DATEADD(MINUTE, @InternalUserSessionInMinutes, getdate())

	update InternalUserSession
	set Expired= @Expired
	where username = @UserName

	set @TimeInSecond = @InternalUserSessionInMinutes * 60000 

end 
GO
