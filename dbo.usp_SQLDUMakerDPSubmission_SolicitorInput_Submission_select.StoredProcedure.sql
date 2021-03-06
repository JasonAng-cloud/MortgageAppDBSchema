/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_select]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_select]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_select]
@ARN varchar(100)
as
begin
	
SELECT [ARN]
      ,[SolicitorCode]
      ,[SolicitorCancellationReportAttachmentURL]
      ,[SolicitorCancellationReportAttachment]
      ,[SolicitorCancellationReportAttachmentDate]
      ,[SolicitorRefReportAttachmentURL]
      ,[SolicitorRefReportAttachmentDate]
      ,[SolicitorRefReportAttachment]
      ,[SolicitorReferenceNumber]
      ,[PersonInChargeName]
      ,[DocumentAdminFeeCreditedToOptionID]
      ,[Remarks]
      ,[SolicitorCIFNumber]
      ,[ExecutionDateByCustomer]
      ,[SNPCompletionDateCommence]
      ,[SNPCompletionDate]
      ,[SNPExtendedCompletionDate]
      ,[DeveloperBillingDueForPayment]
      ,[DeveloperBillingDueDate]
      ,[AttendingSolicitor]
      ,[SolicitorDeclaration]
      ,[RefCoverLetter]
      ,[RefCustNRIC]
      ,[RefBoardResolution]
      ,[RefLandSearch]
      ,[RefPrincipalSPA]
      ,[RefLUToDev]
      ,[RefSpecimenOfCaveator]
      ,[RefDocAdminFeeForm]
      ,[RefOtherDocRemark]
      ,[ExeFacilitiesAgreement]
      ,[ExeChargeAnnexure]
      ,[ExeDeedOfAssignment]
      ,[ExePowerOfAttorney]
      ,[ExeLetterOfGuarantee]
      ,[ExeChargeOverCashDeposit]
      ,[ExeForm34]
      ,[ExeEntryOfPrivateCaveat]
      ,[ExeF16ANLC]
      ,[Status]
      ,[SStatus]
      ,[SStatusOthers]
      ,[OutputPDFID]
      ,[CreatedDate]
      ,[UpdatedDate]
	from SQLSolicitorDPSubmission
	where arn = @arn

end


GO
