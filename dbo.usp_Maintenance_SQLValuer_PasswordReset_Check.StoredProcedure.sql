/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_Check]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLValuer_PasswordReset_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLValuer_PasswordReset_Check]
GO
/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_Check]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_Check]
@ValuerCode nvarchar(100)  = null,
@error nvarchar(max)  = null output
as
begin

	set @Error = ''

	if (		
		@ValuerCode is null or
		rtrim(ltrim(@ValuerCode)) = '' 		
	)
	begin
		set @Error = 'Please fill in Valuer Code'
	end 
	else
	begin 
		if not exists
		(
			select 1
			from SQLValuer
			where ValuerCode = @ValuerCode
		)
		begin
			set @Error = 'Valuer Code does not exists in the system'
		end 
		else
		begin
			if not exists
			(
				select 1
				from SQLValuer
				where ValuerCode = @ValuerCode
					and Status = 'Active'
			)
			begin
				set @Error = 'Valuer Code is not Active in the system'
			end 
			else 
			begin	
				if not exists 
				(					
					select 1
					from (select top 100 * from sqlloads where Valuercode = @Valuercode order by updateddate desc) tbl 
					where tbl.ValuerEmail is not null or ltrim(rtrim(Valueremail)) <> ''
				)
				begin
					set @Error = 'Cannot locate email for the Valuer Code. Please check with the bank'
				end 
			end 
		end 
	end 

 
end 


GO
