/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword_Final]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword_Final]
GO
/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword_Final]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword_Final]
@SolicitorCode nvarchar(100),
@EncrypteddefaultPassword nvarchar(max)  = null
as
begin

	declare @expirydayscount int 
	select @expirydayscount = SolicitorLoginPasswordMaxExpiryDays
	from settings

	declare @expirywarningdayscount int 
	select @expirywarningdayscount = SolicitorLoginPasswordMaxExpiryWarningDays
	from settings

	delete from SolicitorLoginTrialSession
	where SolicitorCode = @solicitorcode

	update SQLSolicitor
	set 
		PasswordForceReset = 'Yes',
		PasswordExpiryDate = DATEADD(DAY, @expirydayscount, getdate()),
		PasswordExpiryWarningDate = DATEADD(DAY, @expirywarningdayscount, getdate())	,
		SolicitorPassword = @EncrypteddefaultPassword	
	where SolicitorCode = @SolicitorCode

	--insert into [SolicitorPasswordHistory]
	--values (@SolicitorCode, @EncrypteddefaultPassword, getdate())
end 



GO
