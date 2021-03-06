/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_GetExpiryWarning]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorLogin_GetExpiryWarning]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorLogin_GetExpiryWarning]
GO
/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_GetExpiryWarning]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_SolicitorLogin_GetExpiryWarning]
@scode nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	declare @expirydate date 

	if exists 
	(
		select 1
		from SQLSolicitor
		where SolicitorCode = @scode
			and PasswordExpiryWarningDate <= getdate()
	)
	begin 
		
		select @expirydate = PasswordExpiryDate
		from SQLSolicitor
		where SolicitorCode = @scode
			and PasswordExpiryWarningDate <= getdate()
			
		set @error = 'Your password is going to expired on ' +convert(varchar, @expirydate, 103)+'. Please change your password as soon as possible to avoid service interuption'

	end 
end
GO
