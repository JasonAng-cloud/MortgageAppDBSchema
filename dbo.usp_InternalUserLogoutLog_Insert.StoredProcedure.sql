/****** Object:  StoredProcedure [dbo].[usp_InternalUserLogoutLog_Insert]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserLogoutLog_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserLogoutLog_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUserLogoutLog_Insert]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_InternalUserLogoutLog_Insert]
@UserName nvarchar(max) = null 
as
begin

	if (@UserName like 'K2:%')
	begin						
		set @UserName = Stuff(@UserName, 1, 3, '')						
		
	end 

	insert into InternalUserLogoutLog
	values (@UserName, getdate(), getdate())
end 
GO
