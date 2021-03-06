/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_PasswordReset_GenerateEmail]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_PasswordReset_GenerateEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_PasswordReset_GenerateEmail]
GO
/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_PasswordReset_GenerateEmail]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_Admin_Solicitor_PasswordReset_GenerateEmail]
@SolicitorCode nvarchar(max),
@password nvarchar(max) = null, 	
@senderemail nvarchar(max)  = null output,
@receiveremail nvarchar(max)  = null output,
@emailheader nvarchar(max)  = null output,
@emailbody nvarchar(max)  = null output
as
begin
	declare @SolicitorLoginURL nvarchar(max)				
		
	select @senderemail = [SenderEmail]
	from settings		
	
	select @SolicitorLoginURL = [url]	
	from [URL_Setting]
	where [type]= 'SolicitorLogin'

	IF OBJECT_ID('tempdb..#SQLSolicitor_GetEmail') IS NOT NULL
    DROP TABLE #SQLSolicitor_GetEmail

	select top 100 Solicitorcode, SolicitorEmail,updateddate 
	into #SQLSolicitor_GetEmail
	from sqlloads 
	where Solicitorcode = @SolicitorCode
	order by updateddate desc

	select top 1 @receiveremail = SolicitorEmail 
	from #SQLSolicitor_GetEmail 
	where SolicitorEmail is not null 
		or ltrim(rtrim(SolicitorEmail)) <> '' 
	order by updateddate desc

	set @emailheader = 'Reset Password for Solicitor Code:' + @Solicitorcode

	set @emailbody = 'Please use the link <a href="'+@SolicitorLoginURL+'">link</a> to access the system. You are required to change the password immediately upon log in.<br>'
	set @emailbody = @emailbody + 'New password: ' + @Password + '<br>'

end 


GO
