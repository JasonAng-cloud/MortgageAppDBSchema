/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_Login_Check]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLValuer_Login_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLValuer_Login_Check]
GO
/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_Login_Check]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_Maintenance_SQLValuer_Login_Check]
@ValuerCode nvarchar(100),
@ValuerPassword nvarchar(100),
@error nvarchar(max)  = null output
as
begin

	set @error = ''

	if not exists 
	(
		select 1 
		from dbo.SQLValuer
		where ValuerCode = @ValuerCode 
	
	)
	begin
		set @error = 'Valuer Code does not exists in the system'
	end 
	else 
	begin
		if not exists 
		(
			select 1 
			from dbo.SQLValuer
			where ValuerCode = @ValuerCode 
				and Status = 'Active'	
		)
		begin
			set @error = 'Valuer Code is not active in the system'
		end 
		/*
		else
		begin
			if not exists 
			(
				select 1 
				from dbo.SQLValuer
				where ValuerCode = @ValuerCode 
					and Status = 'Active'	
					and ValuerPassword = @ValuerPassword
			)
			begin
				set @error = 'Current password is incorrect'
			end 
		end 
		*/
	end 		 
end 


GO
