/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_ARN_Rejected]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_ARN_Rejected]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_ARN_Rejected]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_ARN_Rejected]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_ARN_Rejected]
@arn nvarchar(max)
as
begin
SELECT [ARN]
      ,[a1]
      ,[a2]
      ,[a3]
      ,[a4]
      ,[a5]
      ,[a6]
      ,[a7]
      ,[a8_Remarks]
      ,[a9]
      ,[aOthers]
      ,[AttorneyCentreID]
      ,[AttorneyNameID]
      ,[b1]
      ,[b2]
      ,[b3]
      ,[b4]
      ,[b5]
      ,[b6]
      ,[bOthers]
      ,[FacilityCancelledDate]
      ,[DUMakerEmail]
      ,[HardCopyReceivedDate]
      ,[Decision]
      ,[CreatedDate]
      ,[UpdatedDate]
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
	  ,[AttorneyCentre]
	  ,[AttorneyName]
      ,[SStatus]
      ,[SStatusOthers]
      ,[OutputPDFID]
      ,[SolicitorCreatedDate]
      ,[SolicitorUpdatedDate]
  FROM [dbo].[SQLDUMakerDP_SolicitorSubmission_Rejected]
  where arn = @arn 

end 



GO
