/****** Object:  StoredProcedure [dbo].[usp_InternalUserLogin_getNumberOfTrialLeft]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserLogin_getNumberOfTrialLeft]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserLogin_getNumberOfTrialLeft]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUserLogin_getNumberOfTrialLeft]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_InternalUserLogin_getNumberOfTrialLeft]
@UserName nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	declare @index int 
	if (@UserName like 'K2:%')
	begin						
		set @UserName = Stuff(@UserName, 1, 3, '')
				
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')
		
	end 

	if exists 
	(
		select TrialLeft 
		from InternalUserLoginTrialSession
		where UserName = @UserName
	)
	begin
		 
		select 'You still have ' + CAST(TrialLeft as varchar(100)) + ' trials left' as msg
		from InternalUserLoginTrialSession
		where UserName = @UserName
	end 
	else
	begin 
		set @error = 'System Error. Please retry'
	end 

end 
GO
