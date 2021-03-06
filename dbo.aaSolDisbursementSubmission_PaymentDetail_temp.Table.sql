/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentDetail_temp]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentDetail_temp]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_PaymentDetail_temp]
GO
/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentDetail_temp]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aaSolDisbursementSubmission_PaymentDetail_temp](
	[arn] [nvarchar](100) NOT NULL,
	[RunningIDForCurrentSubmission] [bigint] NOT NULL,
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
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
