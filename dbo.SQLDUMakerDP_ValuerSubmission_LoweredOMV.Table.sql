/****** Object:  Table [dbo].[SQLDUMakerDP_ValuerSubmission_LoweredOMV]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_ValuerSubmission_LoweredOMV]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_ValuerSubmission_LoweredOMV]
GO
/****** Object:  Table [dbo].[SQLDUMakerDP_ValuerSubmission_LoweredOMV]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLDUMakerDP_ValuerSubmission_LoweredOMV](
	[ARN] [nvarchar](100) NOT NULL,
	[FormSubmissionDate] [date] NULL,
	[DocumentExecutionSubmissionDate] [date] NULL,
	[Decision] [nvarchar](max) NULL,
	[DUMakerEmail] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[ValuerCode] [nvarchar](100) NULL,
	[ValuerReportAttachmentURL] [nvarchar](max) NULL,
	[ValuerReportAttachment] [nvarchar](max) NULL,
	[ValuerReportAttachmentDate] [date] NULL,
	[VRInstructionDate] [date] NULL,
	[ValuerReference] [nvarchar](max) NULL,
	[PersonInChargeName] [nvarchar](max) NULL,
	[VUpdateInfoStatus] [nvarchar](max) NULL,
	[VLowerOMVStatus] [nvarchar](max) NULL,
	[VUpdateInfoStatusOthers] [nvarchar](max) NULL,
	[VLowerOMVReasons] [nvarchar](max) NULL,
	[DateOfValuation] [date] NULL,
	[MarketValue] [money] NULL,
	[FireInsuranceValue] [money] NULL,
	[InvoiceNumber] [nvarchar](100) NULL,
	[ShortfallAmount] [money] NULL,
	[Declaration] [bit] NULL,
	[Status] [nvarchar](100) NULL,
	[ValuationFeeFinancedByBankFlag] [bit] NULL,
	[OutputPDFID] [bigint] NULL,
	[ValuerCreatedDate] [date] NULL,
	[ValuerUpdatedDate] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
