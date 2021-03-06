/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword]
GO
/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword]
@SolicitorCode nvarchar(100),
@defaultPassword nvarchar(max)  = null output
as
begin
			
	declare @random nvarchar(max),
		@random_withoutdot nvarchar(max)

	set  @random = convert (nvarchar(max), rand() ) 

	--select @random

	set @random_withoutdot = replace (@random, '.','')
	--select @random_withoutdot

	
	SELECT @defaultpassword = [password]
	from DefaultPassword_Setting
	where [type] = 'SolicitorLogin'
	
	set @defaultpassword = @defaultpassword + @random_withoutdot

	--declare @defaultpassword nvarchar(max)

	/*
	update SQLSolicitor
	set SolicitorPassword = @defaultpassword
	where SolicitorCode = @SolicitorCode
	*/
end 


GO
