/****** Object:  Table [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_Draft]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_Draft]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_Draft]
GO
/****** Object:  Table [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_Draft]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_Draft](
	[arn] [nvarchar](100) NOT NULL,
	[RunningIDForCurrentSubmission] [bigint] NOT NULL,
	[FacilityAccountNumber] [nvarchar](100) NULL,
	[PaymentMode] [nvarchar](100) NULL,
	[PayeeID] [nvarchar](100) NULL,
	[PayeeName] [nvarchar](200) NULL,
	[BeneficiaryBank] [nvarchar](200) NULL,
	[BeneficiaryBankAccountNumber] [nvarchar](100) NULL,
	[AmountDisburse] [money] NULL,
	[PaymentReference] [nvarchar](200) NULL,
	[PaymentDescription] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[DisMakerEmail] [nvarchar](100) NULL,
	[DisMakerSubmissionDate] [datetime] NULL,
	[DisCheckerEmail] [nvarchar](100) NULL,
	[DisCheckerApprovedDate] [datetime] NULL,
	[RCOMakerEmail] [nvarchar](100) NULL,
	[RCOMakerApprovedDate] [datetime] NULL,
	[RCOCheckerEmail] [nvarchar](100) NULL,
	[RCOCheckerApprovedDate] [datetime] NULL,
	[AccountFrom] [nvarchar](100) NULL,
	[BillingRunningID] [bigint] NOT NULL,
 CONSTRAINT [PK_aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_Draft] PRIMARY KEY CLUSTERED 
(
	[arn] ASC,
	[RunningIDForCurrentSubmission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
