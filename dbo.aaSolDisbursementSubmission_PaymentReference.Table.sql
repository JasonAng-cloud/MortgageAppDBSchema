/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentReference]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentReference]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_PaymentReference]
GO
/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentReference]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aaSolDisbursementSubmission_PaymentReference](
	[PaymentReference] [nvarchar](200) NOT NULL,
	[SolicitorFlag] [bit] NOT NULL,
	[BankFlag] [bit] NOT NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
	[createduser] [nvarchar](max) NULL,
	[updateduser] [nvarchar](max) NULL,
 CONSTRAINT [PK_aaSolDisbursementSubmission_PaymentReference] PRIMARY KEY CLUSTERED 
(
	[PaymentReference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
