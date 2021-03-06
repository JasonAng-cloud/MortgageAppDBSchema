/****** Object:  Table [dbo].[VS_attachment_detail]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VS_attachment_detail]') AND type in (N'U'))
DROP TABLE [dbo].[VS_attachment_detail]
GO
/****** Object:  Table [dbo].[VS_attachment_detail]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VS_attachment_detail](
	[arn] [nvarchar](100) NOT NULL,
	[workflow] [nvarchar](100) NOT NULL,
	[filename_original] [nvarchar](100) NULL,
	[filename_new] [nvarchar](100) NULL,
	[filecontent] [nvarchar](max) NULL,
	[filetype] [nvarchar](max) NULL,
	[attachmentuploaddate] [datetime] NULL,
	[fe_file_url] [nvarchar](max) NULL,
	[fe_fireeye_id] [nvarchar](100) NOT NULL,
	[fe_failed_description] [nvarchar](max) NULL,
	[fe_failed_code] [nvarchar](max) NULL,
	[result] [nvarchar](100) NULL,
	[VSCreatedDate] [datetime] NULL,
	[VSUpdatedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_VS_attachment_detail] PRIMARY KEY CLUSTERED 
(
	[arn] ASC,
	[workflow] ASC,
	[fe_fireeye_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
