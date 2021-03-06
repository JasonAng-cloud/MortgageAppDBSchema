/****** Object:  View [dbo].[vw_SQLValuerDPSubmission]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_SQLValuerDPSubmission]'))
DROP VIEW [dbo].[vw_SQLValuerDPSubmission]
GO
/****** Object:  View [dbo].[vw_SQLValuerDPSubmission]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE                 VIEW [dbo].[vw_SQLValuerDPSubmission] AS


SELECT [ARN]
      ,[ValuerCode]
      ,[ValuerReportAttachmentURL]
      ,[ValuerReportAttachment]
      ,[ValuerReportAttachmentDate]
      ,[VRInstructionDate]
      ,[ValuerReference]
      ,[PersonInChargeName]
      ,[VUpdateInfoStatus]
      ,[VLowerOMVStatus]
      ,[VUpdateInfoStatusOthers]
      ,[VLowerOMVReasons]
      ,[DateOfValuation]
      ,[MarketValue]
      ,[FireInsuranceValue]
      ,[InvoiceNumber]
      ,[ShortfallAmount]
      ,[Declaration]
      ,[Status]
      ,[ValuationFeeFinancedByBankFlag]
      ,[LF_PayeeName]
      ,[LF_BilledAmount]
      ,[LF_AccountNumber]
      ,[LF_Bank]
      ,[LF_PaymentDescription]
      ,[LF_PaymentMode]
      ,[Completed]
      ,[OutputPDFID]
      ,[CreatedDate]
      ,[UpdatedDate]
  FROM [dbo].[SQLValuerDPSubmission]
  union 
  
SELECT [ARN]
      ,[ValuerCode]
      ,[ValuerReportAttachmentURL]
      ,[ValuerReportAttachment]
      ,[ValuerReportAttachmentDate]
      ,[VRInstructionDate]
      ,[ValuerReference]
      ,[PersonInChargeName]
      ,[VUpdateInfoStatus]
      ,[VLowerOMVStatus]
      ,[VUpdateInfoStatusOthers]
      ,[VLowerOMVReasons]
      ,[DateOfValuation]
      ,[MarketValue]
      ,[FireInsuranceValue]
      ,[InvoiceNumber]
      ,[ShortfallAmount]
      ,[Declaration]
      ,[Status]
      ,[ValuationFeeFinancedByBankFlag]
      ,[LF_PayeeName]
      ,[LF_BilledAmount]
      ,[LF_AccountNumber]
      ,[LF_Bank]
      ,[LF_PaymentDescription]
      ,[LF_PaymentMode]
      ,[Completed]
      ,[OutputPDFID]
      ,[CreatedDate]
      ,[UpdatedDate]
  FROM [dbo].[SQLValuerDPSubmission_staging]



GO
