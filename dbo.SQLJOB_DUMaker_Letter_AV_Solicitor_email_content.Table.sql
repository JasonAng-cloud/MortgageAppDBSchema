/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_Solicitor_email_content]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_AV_Solicitor_email_content]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_AV_Solicitor_email_content]
GO
/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_Solicitor_email_content]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLJOB_DUMaker_Letter_AV_Solicitor_email_content](
	[arn] [nvarchar](100) NOT NULL,
	[receiveremail] [nvarchar](150) NULL,
	[senderemail] [nvarchar](100) NULL,
	[email_header] [nvarchar](max) NULL,
	[email_body] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
