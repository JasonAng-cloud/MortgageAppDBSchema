/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SelectByID]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_SelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_SelectByID]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SelectByID]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--drop procedure usp_InternalUser_SelectRecord

CREATE   procedure [dbo].[usp_InternalUser_SelectByID]
@UserName nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	set @Error= ''

	declare @index int 

	if (@UserName like 'K2:%')
	begin		
		set @UserName = Stuff(@UserName, 1, 3, '')
				
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	SELECT [UserName]
      ,[UserEmail]
      ,[UserFullName]
      ,[Branch]
      ,[LastLoginDatetime]
      ,[Status]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[IDLastLockedDatetime]
  FROM [dbo].[InternalUser]
  where username = @UserName

end 
GO
