/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_select]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_select]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_select]
@ARN varchar(100)
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
		  ,[CreatedDate]
		  ,[UpdatedDate]
		  ,[ValuationFeeFinancedByBankFlag]
		  ,[LF_PayeeName]
		  ,[LF_BilledAmount]
		  ,[LF_AccountNumber]
		  ,[LF_Bank]
		  ,[LF_PaymentDescription]
		  ,[LF_PaymentMode]
	from SQLValuerDPSubmission
	where arn = @arn

end


GO
