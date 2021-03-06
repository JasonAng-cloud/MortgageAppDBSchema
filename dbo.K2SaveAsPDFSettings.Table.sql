/****** Object:  Table [dbo].[K2SaveAsPDFSettings]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[K2SaveAsPDFSettings]') AND type in (N'U'))
DROP TABLE [dbo].[K2SaveAsPDFSettings]
GO
/****** Object:  Table [dbo].[K2SaveAsPDFSettings]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[K2SaveAsPDFSettings](
	[id] [int] NOT NULL,
	[AppendDate] [bit] NULL,
	[CleanIFrames] [bit] NULL,
	[FileName] [nvarchar](100) NULL,
	[PageSize] [nvarchar](100) NULL,
	[PageOrientation] [nvarchar](100) NULL,
	[Theme] [nvarchar](100) NULL,
	[LeftMargin] [int] NULL,
	[RightMargin] [int] NULL,
	[TopMargin] [int] NULL,
	[BottomMargin] [int] NULL,
 CONSTRAINT [PK_K2SaveAsPDFSettings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
