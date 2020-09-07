/****** Object:  StoredProcedure [dbo].[aa_ws_getEDMS_SolicitorDisbursement_Setting]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_getEDMS_SolicitorDisbursement_Setting]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_getEDMS_SolicitorDisbursement_Setting]
GO
/****** Object:  StoredProcedure [dbo].[aa_ws_getEDMS_SolicitorDisbursement_Setting]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE       procedure [dbo].[aa_ws_getEDMS_SolicitorDisbursement_Setting]
@error nvarchar(max) = null output 
as
begin
	SELECT *
  FROM [dbo].[EDMS_Settings]
  where EDMSDocType = 'CRA05 Disbursement'
end 
GO
