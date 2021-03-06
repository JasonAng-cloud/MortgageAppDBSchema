/****** Object:  StoredProcedure [dbo].[usp_ws_getEDMS_Solicitor_Setting]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_getEDMS_Solicitor_Setting]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_getEDMS_Solicitor_Setting]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_getEDMS_Solicitor_Setting]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_ws_getEDMS_Solicitor_Setting]
@error nvarchar(max) = null output 
as
begin
	SELECT [EDMSDocType]
      ,[ProfileName]
      ,[LoginUser]
      ,[DefaultFileName]
      ,[EDMSUploadFolder]
      ,[Category]
  FROM [dbo].[EDMS_Settings]
  where EDMSDocType = 'CRA02 Documentation'
end 

GO
