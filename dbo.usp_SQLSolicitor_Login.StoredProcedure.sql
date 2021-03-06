/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitor_Login]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitor_Login]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitor_Login]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitor_Login]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[usp_SQLSolicitor_Login]
@SolicitorCode nvarchar(100) = null,
@SolicitorPassword nvarchar(max) = null,
@error nvarchar(max)  = null output
as
begin

	set @error = ''

	
	if (		
		@SolicitorCode is null or
		rtrim(ltrim(@SolicitorCode)) = '' 		
	)
	begin
		set @Error = 'Please enter Solicitor Code'
	end 
	else
	begin
		if (		
			@SolicitorPassword is null or
			rtrim(ltrim(@SolicitorPassword)) = '' 		
		)
		begin
			set @Error = 'Please enter Password'
		end 
		else
		begin
			if not exists 
			(
				select 1 
				from dbo.SQLSolicitor
				where SolicitorCode = @SolicitorCode 	
			)
			begin
				set @error = 'Solicitor Code does not exists in the system'
			end 
			else 
			begin
				if not exists 
				(
					select 1 
					from dbo.SQLSolicitor
					where SolicitorCode = @SolicitorCode 
						and Status = 'Active'	
				)
				begin
					set @error = 'Solicitor Code is not active in the system'
				end 
				/*
				else
				begin
					if not exists 
					(
						select 1 
						from dbo.SQLSolicitor
						where SolicitorCode = @SolicitorCode 
							and Status = 'Active'	
							and SolicitorPassword = @SolicitorPassword
					)
					begin
						set @error = 'Password is incorrect'
					end 
				end 
				*/
			end 	
		end 
	end 
		 
end 



GO
