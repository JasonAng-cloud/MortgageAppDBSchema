/****** Object:  Table [dbo].[ImageSettings]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImageSettings]') AND type in (N'U'))
DROP TABLE [dbo].[ImageSettings]
GO
/****** Object:  Table [dbo].[ImageSettings]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageSettings](
	[ImageType] [nvarchar](100) NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_ImageSettings] PRIMARY KEY CLUSTERED 
(
	[ImageType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
