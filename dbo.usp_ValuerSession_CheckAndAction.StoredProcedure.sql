/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_CheckAndAction]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerSession_CheckAndAction]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerSession_CheckAndAction]
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_CheckAndAction]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_ValuerSession_CheckAndAction]
@ValuerCode nvarchar(100),
@clientsessionID bigint = null, 
@error nvarchar(max) =null output 
as
begin
	set @error = ''

	declare @currentdatetime datetime 
	set @currentdatetime= getdate()
	
	delete from ValuerLoginTrialSession
	where ValuerCode = @valuercode 

	if not exists 
	(
		select 1 as col1
		from ValuerSession
		where ValuerCode = @ValuerCode					
	)
	begin
		-- redirect to login page if session data not available  
		set @error = 'Session expired. Please Login'
	end 
	else
	begin
		if exists 
		(			
			select 1 as	col1
			from ValuerSession
			where ValuerCode = @ValuerCode
				and expired < @currentdatetime
		)
		begin			
			-- delete session data and redirect to login page if session data is expired 
			delete from ValuerSession where ValuerCode = @ValuerCode

			set @error = 'Session expired. Please Login'
		end 
		else
		begin
			if exists 
			(
				select 1 as	col1
				from ValuerSession
				where ValuerCode = @ValuerCode
				and clientsessionid = @clientsessionID
			)
			begin
				declare @ValuerSessionInMinutes int 

				select @ValuerSessionInMinutes = ValuerSessionInMinutes
				from settings 
				-- session data is valid. extend session period to another 20 minutes 
				update ValuerSession
				set expired = DATEADD(MINUTE, @ValuerSessionInMinutes, @currentdatetime) 
				where ValuerCode = @ValuerCode
			end 
			else
			begin
				set @error = 'Multiple Sessions detected. Please Login to continue'
			end 
			
		end 
	end 

end 
GO
