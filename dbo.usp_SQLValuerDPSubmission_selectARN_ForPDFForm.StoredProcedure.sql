/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_selectARN_ForPDFForm]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmission_selectARN_ForPDFForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmission_selectARN_ForPDFForm]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_selectARN_ForPDFForm]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       procedure [dbo].[usp_SQLValuerDPSubmission_selectARN_ForPDFForm]
@arn nvarchar(max) = null 
as
begin

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
	  where arn = @arn 
end 
GO
