/****** Object:  Table [dbo].[SQLValuerDPSubmission]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuerDPSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[SQLValuerDPSubmission]
GO
/****** Object:  Table [dbo].[SQLValuerDPSubmission]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLValuerDPSubmission](
	[ARN] [nvarchar](100) NOT NULL,
	[ValuerCode] [nvarchar](100) NOT NULL,
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
	[LF_PayeeName] [nvarchar](100) NULL,
	[LF_BilledAmount] [money] NULL,
	[LF_AccountNumber] [nvarchar](100) NULL,
	[LF_Bank] [nvarchar](100) NULL,
	[LF_PaymentDescription] [nvarchar](100) NULL,
	[LF_PaymentMode] [nvarchar](100) NULL,
	[Completed] [bit] NULL,
	[OutputPDFID] [bigint] NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_ValuerDPSubmission] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC,
	[ValuerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
