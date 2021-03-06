/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate_Final]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate_Final]
GO
/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate_Final]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate_Final]
@SolicitorCode nvarchar(100),
@SolicitorEncryptedNewPassword nvarchar(max) = null
as
begin
	
	declare @expirydayscount int 
	select @expirydayscount = SolicitorLoginPasswordMaxExpiryDays
	from settings

	declare @expirywarningdayscount int 
	select @expirywarningdayscount = SolicitorLoginPasswordMaxExpiryWarningDays
	from settings

	update sqlSolicitor 
	set 			
		SolicitorPassword = @SolicitorEncryptedNewPassword ,
		passwordforcereset = 'No'		,
		PasswordExpiryDate = DATEADD(DAY, @expirydayscount, getdate())		,
		PasswordExpiryWarningDate = DATEADD(DAY, @expirywarningdayscount, getdate())
	where SolicitorCode = @SolicitorCode

	declare @encryptionkkey nvarchar(100)

	select @encryptionkkey = EncryptionKey
	from Settings

	insert into [SolicitorPasswordHistory]
	values (@SolicitorCode, @SolicitorEncryptedNewPassword, getdate(), @encryptionkkey)
	 
end 


GO
