/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword_Final]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword_Final]
GO
/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword_Final]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword_Final]
@ValuerCode nvarchar(100),
@EncrypteddefaultPassword nvarchar(max)  = null
as
begin
	declare @expirydayscount int 
	select @expirydayscount = ValuerLoginPasswordMaxExpiryDays
	from settings

	declare @expirywarningdayscount int 
	select @expirywarningdayscount = ValuerLoginPasswordMaxExpiryWarningDays
	from settings

	delete from ValuerLoginTrialSession
	where ValuerCode = @valuercode 

	update SQLValuer
	set ValuerPassword = @EncrypteddefaultPassword,
		passwordforcereset = 'Yes',
		PasswordExpiryDate = DATEADD(DAY, @expirydayscount, getdate())	,
		PasswordExpiryWarningDate = DATEADD(DAY, @expirywarningdayscount, getdate())		
	where ValuerCode = @ValuerCode

	/*
	declare @encryptionkkey nvarchar(100)

	select @encryptionkkey = EncryptionKey
	from Settings

	insert into [ValuerPasswordHistory]
	values (@ValuerCode, @EncrypteddefaultPassword, getdate(), @encryptionkkey)
	*/
end



GO
