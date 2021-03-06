/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_selectUpdateInfo]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_selectUpdateInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_selectUpdateInfo]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_selectUpdateInfo]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_selectUpdateInfo]
@ARN varchar(100)
as
begin
	
SELECT main.[ARN]
      ,main.[SolicitorCode]
      ,main.[SolicitorCancellationReportAttachmentURL]
      ,main.[SolicitorCancellationReportAttachment]
      ,main.[SolicitorCancellationReportAttachmentDate]
      ,main.[SolicitorRefReportAttachmentURL]
      ,main.[SolicitorRefReportAttachmentDate]
      ,main.[SolicitorRefReportAttachment]
      ,main.[SolicitorReferenceNumber]
      ,main.[PersonInChargeName]
      ,main.[DocumentAdminFeeCreditedToOptionID]
      ,main.[Remarks]
      ,main.[SolicitorCIFNumber]
      ,main.[ExecutionDateByCustomer]
      ,main.[SNPCompletionDateCommence]
      ,main.[SNPCompletionDate]
      ,main.[SNPExtendedCompletionDate]
      ,main.[DeveloperBillingDueForPayment]
      ,main.[DeveloperBillingDueDate]
      ,main.[AttendingSolicitor]
      ,main.[SolicitorDeclaration]
      ,main.[RefCoverLetter]
      ,main.[RefCustNRIC]
      ,main.[RefBoardResolution]
      ,main.[RefLandSearch]
      ,main.[RefPrincipalSPA]
      ,main.[RefLUToDev]
      ,main.[RefSpecimenOfCaveator]
      ,main.[RefDocAdminFeeForm]
      ,main.[RefOtherDocRemark]
      ,main.[ExeFacilitiesAgreement]
      ,main.[ExeChargeAnnexure]
      ,main.[ExeDeedOfAssignment]
      ,main.[ExePowerOfAttorney]
      ,main.[ExeLetterOfGuarantee]
      ,main.[ExeChargeOverCashDeposit]
      ,main.[ExeForm34]
      ,main.[ExeEntryOfPrivateCaveat]
      ,main.[ExeF16ANLC]
      ,ui.[Status]
      ,ui.[SStatus]
      ,ui.[SStatusOthers]
      ,main.[OutputPDFID]
      ,main.[CreatedDate]
      ,ui.[UpdatedDate]
	from SQLSolicitorDPSubmission main 	
		inner join SQLSolicitorDPSubmission_updateinfo ui on ui.arn = main.arn 
	where main.arn = @arn

end


GO
