/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_Main_MoveToStaging]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmission_Main_MoveToStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmission_Main_MoveToStaging]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_Main_MoveToStaging]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_SQLSolicitorDPSubmission_Main_MoveToStaging]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin

	insert into SQLSolicitorDPSubmissionRemark_Staging
	select * from SQLSolicitorDPSubmissionRemark
	where arn = @arn

	insert into SQLSolicitorDPSubmissionAttachment2_Staging
	select * from SQLSolicitorDPSubmissionAttachment2
	where arn = @arn

	insert into SQLSolicitorDPSubmissionExeDocs_Staging
	select * from SQLSolicitorDPSubmissionExeDocs
	where arn = @arn

	insert into SQLSolicitorDPSubmission_Staging
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
      ,[Completed]
      ,[CreatedDate]
      ,[UpdatedDate]
  FROM [dbo].[SQLSolicitorDPSubmission]
	where arn = @arn


	delete from SQLSolicitorDPSubmission
	where arn = @arn 

	delete from SQLSolicitorDPSubmissionExeDocs
	where arn = @arn 

	delete from SQLSolicitorDPSubmissionAttachment2
	where arn = @arn 

	delete from SQLSolicitorDPSubmissionRemark
	where arn = @arn 
end 
GO
