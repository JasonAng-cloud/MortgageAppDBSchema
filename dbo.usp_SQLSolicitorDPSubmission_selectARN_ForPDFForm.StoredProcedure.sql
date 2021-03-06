/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_selectARN_ForPDFForm]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmission_selectARN_ForPDFForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmission_selectARN_ForPDFForm]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_selectARN_ForPDFForm]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     procedure [dbo].[usp_SQLSolicitorDPSubmission_selectARN_ForPDFForm]
@arn nvarchar(max) = null 
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
		  ,isnull([DocumentAdminFeeCreditedToOptionID],1) as [DocumentAdminFeeCreditedToOptionID]
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
	  FROM [dbo].[SQLSolicitorDPSubmission_staging]
	  where arn = @arn 
end 
GO
