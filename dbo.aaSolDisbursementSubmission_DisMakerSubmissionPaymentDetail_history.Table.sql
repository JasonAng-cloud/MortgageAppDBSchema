/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history]
GO
/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history](
	[arn] [nvarchar](100) NOT NULL,
	[RunningIDForCurrentSubmission] [bigint] NULL,
	[FacilityAccountNumber] [nvarchar](100) NULL,
	[PaymentMode] [nvarchar](100) NULL,
	[PayeeID] [nvarchar](50) NULL,
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
	[RunningIDForCompletedSubmission] [bigint] NOT NULL,
 CONSTRAINT [PK_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history] PRIMARY KEY CLUSTERED 
(
	[arn] ASC,
	[RunningIDForCompletedSubmission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
