/****** Object:  Table [dbo].[SQLSolicitorDPSubmission]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitorDPSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitorDPSubmission]
GO
/****** Object:  Table [dbo].[SQLSolicitorDPSubmission]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLSolicitorDPSubmission](
	[ARN] [nvarchar](100) NOT NULL,
	[SolicitorCode] [nvarchar](100) NOT NULL,
	[SolicitorCancellationReportAttachmentURL] [nvarchar](max) NULL,
	[SolicitorCancellationReportAttachment] [nvarchar](max) NULL,
	[SolicitorCancellationReportAttachmentDate] [date] NULL,
	[SolicitorRefReportAttachmentURL] [nvarchar](max) NULL,
	[SolicitorRefReportAttachmentDate] [date] NULL,
	[SolicitorRefReportAttachment] [nvarchar](max) NULL,
	[SolicitorReferenceNumber] [nvarchar](100) NULL,
	[PersonInChargeName] [nvarchar](max) NULL,
	[DocumentAdminFeeCreditedToOptionID] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[SolicitorCIFNumber] [nvarchar](100) NULL,
	[ExecutionDateByCustomer] [date] NULL,
	[SNPCompletionDateCommence] [bit] NULL,
	[SNPCompletionDate] [date] NULL,
	[SNPExtendedCompletionDate] [date] NULL,
	[DeveloperBillingDueForPayment] [bit] NULL,
	[DeveloperBillingDueDate] [date] NULL,
	[AttendingSolicitor] [nvarchar](max) NULL,
	[SolicitorDeclaration] [bit] NULL,
	[RefCoverLetter] [bit] NULL,
	[RefCustNRIC] [bit] NULL,
	[RefBoardResolution] [bit] NULL,
	[RefLandSearch] [bit] NULL,
	[RefPrincipalSPA] [bit] NULL,
	[RefLUToDev] [bit] NULL,
	[RefSpecimenOfCaveator] [bit] NULL,
	[RefDocAdminFeeForm] [bit] NULL,
	[RefOtherDocRemark] [nvarchar](max) NULL,
	[ExeFacilitiesAgreement] [bit] NULL,
	[ExeChargeAnnexure] [bit] NULL,
	[ExeDeedOfAssignment] [bit] NULL,
	[ExePowerOfAttorney] [bit] NULL,
	[ExeLetterOfGuarantee] [bit] NULL,
	[ExeChargeOverCashDeposit] [bit] NULL,
	[ExeForm34] [bit] NULL,
	[ExeEntryOfPrivateCaveat] [bit] NULL,
	[ExeF16ANLC] [bit] NULL,
	[Status] [nvarchar](100) NULL,
	[SStatus] [nvarchar](100) NULL,
	[SStatusOthers] [nvarchar](max) NULL,
	[OutputPDFID] [bigint] NULL,
	[Completed] [bit] NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_SQLSolicitorDPSubmission] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC,
	[SolicitorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
