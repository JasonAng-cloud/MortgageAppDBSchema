/****** Object:  Table [dbo].[TBD_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]') AND type in (N'U'))
DROP TABLE [dbo].[TBD_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
GO
/****** Object:  Table [dbo].[TBD_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBD_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail](
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
	[AccountFrom] [nvarchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
