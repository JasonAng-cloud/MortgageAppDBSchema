/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_delete]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_Session_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_Session_delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_delete]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_InternalUser_Session_delete]
@UserName nvarchar(100) = null, 
@output nvarchar(max) = null
as
begin

	declare @index int 
	if (@UserName like 'K2:%')
	begin						
		set @UserName = Stuff(@UserName, 1, 3, '')
				
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')
		
	end 

	delete from InternalUserSession
	where UserName = @UserName
end 
GO
