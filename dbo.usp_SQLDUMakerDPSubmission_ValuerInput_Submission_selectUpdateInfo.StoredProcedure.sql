/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_selectUpdateInfo]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_selectUpdateInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_selectUpdateInfo]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_selectUpdateInfo]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   procedure [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_selectUpdateInfo]
@ARN varchar(100)
as
begin

	SELECT main.[ARN]
		  ,main.[ValuerCode]
		  ,main.[ValuerReportAttachmentURL]
		  ,main.[ValuerReportAttachment]
		  ,main.[ValuerReportAttachmentDate]
		  ,main.[VRInstructionDate]
		  ,main.[ValuerReference]
		  ,main.[PersonInChargeName]
		  ,ui.[VUpdateInfoStatus]
		  ,main.[VLowerOMVStatus]
		  ,ui.[VUpdateInfoStatusOthers]
		  ,main.[VLowerOMVReasons]
		  ,main.[DateOfValuation]
		  ,main.[MarketValue]
		  ,main.[FireInsuranceValue]
		  ,main.[InvoiceNumber]
		  ,main.[ShortfallAmount]
		  ,main.[Declaration]
		  ,main.[Status]
		  ,main.[CreatedDate]
		  ,ui.[UpdatedDate]
		  ,main.[ValuationFeeFinancedByBankFlag]
	from SQLValuerDPSubmission main 
		inner join SQLValuerDPSubmission_updateinfo ui on ui.arn = main.arn 
	where main.arn = @arn

end


GO
