/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Update_Password]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Valuer_Update_Password]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Valuer_Update_Password]
GO
/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Update_Password]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Admin_Valuer_Update_Password]
@ValuerCode nvarchar(max),
@ValuerPassword nvarchar(max) = null,
@ValuerPasswordConfirmation nvarchar(max) = null,
@LoginUserEmail nvarchar(max) = null, 	
@Error nvarchar(max) = null output 
as
begin

	set @Error = ''

	
	if (
		@ValuerPassword is null or
		rtrim(ltrim(@ValuerPassword)) = '' or 
		@ValuerPasswordConfirmation is null or
		rtrim(ltrim(@ValuerPasswordConfirmation)) = '' 
	)
	begin
		set @Error = 'Please fill in New Password and Comfirmation Password'
	end 
	else
	begin
		if (
			@ValuerPassword <> @ValuerPasswordConfirmation			
		)
		begin
			set @Error = 'New Password and Confirmation Password are not the same'
		end 
		else
		begin
			
			declare @minlength int 
			select @minlength = ValuerPasswordMinCharacters
			from settings 

			-- password requirement check
			if (len(@ValuerPassword)<@minlength)
			BEGIN
				--set @Error = 'Password must have at least 12 characters<br>'
				set @Error = 'Password must have at least ' + str(@minlength)+ ' characters<br>'
			END 

			if ( PATINDEX('%[abcdefghijklmnopqrstuvwxyz]%', @ValuerPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
			begin 		
				set @Error = @Error + 'Password must have at least 1 lowercase character<br>'
			end

			if ( PATINDEX('%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%', @ValuerPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
			begin 		
				set @Error =  @Error +'Password must have at least 1 uppercase character<br>'
			end
	
			if ( PATINDEX('%[0-9]%', @ValuerPassword) = 0)	
			begin 
				set @Error =  @Error +'Password must have at least 1 number<br>'
			end 	

			if ( PATINDEX('%[^A-Za-z0-9, ]%', @ValuerPassword) = 0)	
			begin 
				set @Error =  @Error +'Password must have at least 1 special character<br>'
			end 		
			
		end 
	end 

	
	/*
	if (@Error = '')
	BEGIN 
		update sqlvaluer 
		set 
			ValuerPassword = @ValuerPassword,
			--[Status] = @Status,
			--ValuerName = @ValuerName, 	
			UpdatedUser = @LoginUserEmail ,
			updateddate = getdate()
		where ValuerCode= @ValuerCode	 	
	END 
	*/
end 


GO
