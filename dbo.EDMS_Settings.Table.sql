/****** Object:  Table [dbo].[EDMS_Settings]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EDMS_Settings]') AND type in (N'U'))
DROP TABLE [dbo].[EDMS_Settings]
GO
/****** Object:  Table [dbo].[EDMS_Settings]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EDMS_Settings](
	[EDMSDocType] [nvarchar](100) NOT NULL,
	[ProfileName] [nvarchar](100) NULL,
	[LoginUser] [nvarchar](100) NULL,
	[DefaultFileName] [nvarchar](100) NULL,
	[EDMSUploadFolder] [nvarchar](100) NULL,
	[Category] [nvarchar](100) NULL,
 CONSTRAINT [PK_EDMS_Settings_1] PRIMARY KEY CLUSTERED 
(
	[EDMSDocType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
