/****** Object:  StoredProcedure [dbo].[usp_ApplicationSetting_select]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ApplicationSetting_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ApplicationSetting_select]
GO
/****** Object:  StoredProcedure [dbo].[usp_ApplicationSetting_select]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   procedure [dbo].[usp_ApplicationSetting_select]
as
begin

	select *
	from (select ProfileName as [CRA02_Documentation_ProfileName],
				LoginUser as [CRA02_Documentation_LoginUser],
				DefaultFileName as [CRA02_Documentation_DefaultFileName],
				EDMSUploadFolder as [CRA02_Documentation_EDMSUploadFolder],
				Category as [CRA02_Documentation_Category]
			from EDMS_Settings
			where EDMSDocType = 'CRA02 Documentation') cra02 
	left join (select ProfileName as [CRA04_Valuation_ProfileName],
					LoginUser as [CRA04_Valuation_LoginUser],
					DefaultFileName as [CRA04_Valuation_DefaultFileName],
					EDMSUploadFolder as [CRA04_Valuation_EDMSUploadFolder],
					Category as [CRA04_Valuation_Category]
				from EDMS_Settings
				where EDMSDocType = 'CRA04 Valuation') cra04 on 1=1 
	left join (select ProfileName as [CRA05_Disbursement_ProfileName],
					LoginUser as [CRA05_Disbursement_LoginUser],
					DefaultFileName as [CRA05_Disbursement_DefaultFileName],
					EDMSUploadFolder as [CRA05_Disbursement_EDMSUploadFolder],
					Category as [CRA05_Disbursement_Category]
				from EDMS_Settings
				where EDMSDocType = 'CRA05 Disbursement' ) cra05 on 1=1 
	left join (select ProfileName as [CRA06_Billings_ProfileName],
					LoginUser as [CRA06_Billings_LoginUser],
					DefaultFileName as [CRA06_Billings_DefaultFileName],
					EDMSUploadFolder as [CRA06_Billings_EDMSUploadFolder],
					Category as [CRA06_Billings_Category]
				from EDMS_Settings
				where EDMSDocType = 'CRA06 Billings' ) cra06 on 1=1 	
	left join (SELECT [URL] as DU1_Letter_URL
				FROM [dbo].[URL_Setting]
				where type = 'DU1'  ) du1 on 1=1
	left join (SELECT [URL] as DU2_Letter_URL
				FROM [dbo].[URL_Setting]
				where type = 'DU2' ) du2 on 1=1
	left join (SELECT [URL] as LogoutURL_URL
				FROM [dbo].[URL_Setting]
				where type = 'LogoutURL' ) LogoutURL on 1=1
	left join (SELECT [URL] as SolicitorLogin_URL
				FROM [dbo].[URL_Setting]
				where type = 'SolicitorLogin' ) SolicitorLogin on 1=1
	left join (SELECT [URL] as ValuerLogin_URL
				FROM [dbo].[URL_Setting]
				where type = 'ValuerLogin' ) ValuerLogin on 1=1
	left join (SELECT [URL] as SolicitorDocSubPDF_Cancellation_URL
				FROM [dbo].[URL_Setting]
				where type = 'SolicitorDocSubPDF_Cancellation' ) SolicitorDocSubPDF_Cancellation on 1=1
	left join (SELECT [URL] as SolicitorDocSubPDF_Submission_URL
				FROM [dbo].[URL_Setting]
				where type = 'SolicitorDocSubPDF_Submission' ) SolicitorDocSubPDF_Submission on 1=1
	left join (SELECT [URL] as SolicitorDocSubPDF_UpdateInfo_URL
				FROM [dbo].[URL_Setting]
				where type = 'SolicitorDocSubPDF_UpdateInfo' ) SolicitorDocSubPDF_UpdateInfo on 1=1
	left join (SELECT [URL] as ValuerVRSubPDF_UpdateInfo_URL
				FROM [dbo].[URL_Setting]
				where type = 'ValuerVRSubPDF_UpdateInfo' ) ValuerVRSubPDF_UpdateInfo on 1=1
	left join (SELECT [URL] as ValuerVRSubPDF_Cancellation_URL
				FROM [dbo].[URL_Setting]
				where type = 'ValuerVRSubPDF_Cancellation' ) ValuerVRSubPDF_Cancellation on 1=1
	left join (SELECT [URL] as ValuerVRSubPDF_LowerOMV_URL
				FROM [dbo].[URL_Setting]
				where type = 'ValuerVRSubPDF_LowerOMV' ) ValuerVRSubPDF_LowerOMV on 1=1
	left join (SELECT [URL] as ValuerVRSubPDF_Submission_URL
				FROM [dbo].[URL_Setting]
				where type = 'ValuerVRSubPDF_Submission' ) ValuerVRSubPDF_Submission on 1=1
	left join (SELECT [newLICDC] as edms_letter_of_instruction_cdc_date
					,[newBillingCDC] as edms_billing_cdc
				FROM [dbo].[tblCDC] ) edms_cdc on 1=1

end 
GO
