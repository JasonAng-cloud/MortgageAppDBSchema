/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_Login_Check]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_Login_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_Login_Check]
GO
/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_Login_Check]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_Maintenance_SQLSolicitor_Login_Check]
@SolicitorCode nvarchar(100),
@SolicitorPassword nvarchar(100),
@error nvarchar(max)  = null output
as
begin

	set @error = ''

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
				set @error = 'Current password is incorrect'
			end 
		end 
		*/
	end 		 
end 


GO
