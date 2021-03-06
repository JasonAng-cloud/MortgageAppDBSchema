/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_Check]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_Check]
GO
/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_Check]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_Check]
@SolicitorCode nvarchar(100) = null,
@error nvarchar(max)  = null output
as
begin

	set @Error = ''

	if (		
		@SolicitorCode is null or
		rtrim(ltrim(@SolicitorCode)) = '' 		
	)
	begin
		set @Error = 'Please fill in Solicitor Code'
	end 
	else
	begin 
		if not exists
		(
			select 1
			from SQLSolicitor
			where SolicitorCode = @SolicitorCode
		)
		begin
			set @Error = 'Solicitor Code does not exists in the system'
		end 
		else
		begin
			if not exists
			(
				select 1
				from SQLSolicitor
				where SolicitorCode = @SolicitorCode
					and Status = 'Active'
			)
			begin
				set @Error = 'Solicitor Code is not Active in the system'
			end 
			else 
			begin	
				if not exists 
				(					
					select 1
					from (select top 100 * from sqlloads where solicitorcode = @solicitorcode order by updateddate desc) tbl 
					where tbl.SolicitorEmail is not null or ltrim(rtrim(solicitoremail)) <> ''
				)
				begin
					set @Error = 'Cannot locate email for the Solicitor Code. Please check with the bank'
				end 
			end 
		end 
	end 

 
end 


GO
