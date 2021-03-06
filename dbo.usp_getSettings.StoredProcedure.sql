/****** Object:  StoredProcedure [dbo].[usp_getSettings]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getSettings]
GO
/****** Object:  StoredProcedure [dbo].[usp_getSettings]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/

CREATE     procedure [dbo].[usp_getSettings]
as
begin
	SELECT 
      [SolicitorLoginTrialsNumberOfLoginAllowed]
      ,[SolicitorLoginTrialsExpiryPeroidInMinutes]
      ,[ValuerLoginTrialsNumberOfLoginAllowed]
      ,[ValuerLoginTrialsExpiryPeroidInMinutes]
      ,[SolicitorDormantIDReportPeriodInDays]
      ,[ValuerDormantIDReportPeriodInDays]
      ,[SolicitorLoginPasswordHistoryCount]
      ,[ValuerLoginPasswordHistoryCount]
      ,[SolicitorLoginPasswordMaxExpiryDays]
      ,[ValuerLoginPasswordMaxExpiryDays]
      ,[SolicitorLoginPasswordMaxExpiryWarningDays]
      ,[ValuerLoginPasswordMaxExpiryWarningDays]
      ,[SolicitorPasswordMinCharacters]
      ,[ValuerPasswordMinCharacters]
      ,[SolicitorSessionInMinutes]
      ,[ValuerSessionInMinutes]
      ,[InternalUserSessionInMinutes]      
      ,[InternalUserDormantIDReportPeriodInDays]   
	  ,InternalUserLoginTrialsExpiryPeroidInMinutes
	  ,InternalUserLoginTrialsNumberOfLoginAllowed
	  ,tbl_solicitor.SolicitorDefaultPassword
	  ,tbl_valuer.ValuerDefaultPassword
  FROM [dbo].[Settings]
	left join (select [password] as SolicitorDefaultPassword 
				from [DefaultPassword_Setting]
				where type = 'SolicitorLogin') tbl_solicitor on 1=1
	left join (select [password] as ValuerDefaultPassword 
				from [DefaultPassword_Setting]
				where type = 'ValuerLogin') tbl_valuer on 1=1
end 







GO
