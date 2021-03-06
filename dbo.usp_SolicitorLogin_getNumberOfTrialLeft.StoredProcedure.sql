/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_getNumberOfTrialLeft]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorLogin_getNumberOfTrialLeft]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorLogin_getNumberOfTrialLeft]
GO
/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_getNumberOfTrialLeft]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_SolicitorLogin_getNumberOfTrialLeft]
@solicitorcode nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	if exists 
	(
		select TrialLeft 
		from SolicitorLoginTrialSession
		where SolicitorCode = @solicitorcode
	)
	begin
		select 'You still have ' + CAST(TrialLeft as varchar(100)) + ' trials left' as msg
		from SolicitorLoginTrialSession
		where SolicitorCode = @solicitorcode
	end 
	else
	begin 
		set @error = 'System Error. Please retry'
	end 

end 
GO
