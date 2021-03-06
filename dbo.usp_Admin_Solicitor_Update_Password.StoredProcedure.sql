/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Password]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_Update_Password]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_Update_Password]
GO
/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Password]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Admin_Solicitor_Update_Password]
@SolicitorCode nvarchar(max),
@SolicitorPassword nvarchar(max) = null,
@SolicitorPasswordConfirmation nvarchar(max) = null,
@LoginUserEmail nvarchar(max) = null, 	
@Error nvarchar(max) = null output 
as
begin

	set @Error = ''

	
	if (
		@SolicitorPassword is null or
		rtrim(ltrim(@SolicitorPassword)) = '' or 
		@SolicitorPasswordConfirmation is null or
		rtrim(ltrim(@SolicitorPasswordConfirmation)) = '' 
		--@SolicitorName is null or
		--rtrim(ltrim(@SolicitorName)) = '' 
	)
	begin
		set @Error = 'Please fill in New Password and Comfirmation Password'
	end 
	else
	begin
		if (
			@SolicitorPassword <> @SolicitorPasswordConfirmation			
		)
		begin
			set @Error = 'New Password and Confirmation Password are not the same'
		end 
		else
		begin
			
			declare @minlength int 
			select @minlength = SolicitorPasswordMinCharacters
			from settings 

			-- password requirement check
			if (len(@SolicitorPassword)<@minlength)
			BEGIN
				set @Error = 'Password must have at least ' + str(@minlength)+ ' characters<br>'
			END 

			if ( PATINDEX('%[abcdefghijklmnopqrstuvwxyz]%', @SolicitorPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
			begin 		
				set @Error = @Error + 'Password must have at least 1 lowercase character<br>'
			end

			if ( PATINDEX('%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%', @SolicitorPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
			begin 		
				set @Error =  @Error +'Password must have at least 1 uppercase character<br>'
			end
	
			if ( PATINDEX('%[0-9]%', @SolicitorPassword) = 0)	
			begin 
				set @Error =  @Error +'Password must have at least 1 number<br>'
			end 	

			if ( PATINDEX('%[^A-Za-z0-9, ]%', @SolicitorPassword) = 0)	
			begin 
				set @Error =  @Error +'Password must have at least 1 special character<br>'
			end 		
			
		end 
	end 

	
	/*
	if (@Error = '')
	BEGIN 
		update sqlSolicitor 
		set 
			SolicitorPassword = @SolicitorPassword,
			--[Status] = @Status,
			--SolicitorName = @SolicitorName, 	
			UpdatedUser = @LoginUserEmail ,
			updateddate = getdate()
		where SolicitorCode= @SolicitorCode	 	
	END 
	*/
end 


GO
