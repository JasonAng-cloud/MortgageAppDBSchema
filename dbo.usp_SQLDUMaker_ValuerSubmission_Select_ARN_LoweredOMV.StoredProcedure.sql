/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_ARN_LoweredOMV]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_ValuerSubmission_Select_ARN_LoweredOMV]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_ARN_LoweredOMV]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_ARN_LoweredOMV]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_ARN_LoweredOMV]
@arn nvarchar(max)
as
begin

	SELECT [ARN]			
		  --,[FormSubmissionDate]
		  ,FORMAT (FormSubmissionDate, 'dd/MM/yyyy') as FormSubmissionDate
		  --,[DocumentExecutionSubmissionDate]
		  ,FORMAT (DocumentExecutionSubmissionDate, 'dd/MM/yyyy') as DocumentExecutionSubmissionDate
		  ,[Decision]
		  ,[DUMakerEmail]		  
		  ,[CreatedDate]
		  ,[UpdatedDate]
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
		  ,[OutputPDFID]
		  --,[ValuerCreatedDate]
		  ,FORMAT (ValuerCreatedDate, 'dd/MM/yyyy') as ValuerCreatedDate
		  --,[ValuerUpdatedDate]
		  ,FORMAT (ValuerUpdatedDate, 'dd/MM/yyyy') as ValuerUpdatedDate
	  FROM [dbo].[SQLDUMakerDP_ValuerSubmission_LoweredOMV]
	  where arn = @arn 
end 


GO
