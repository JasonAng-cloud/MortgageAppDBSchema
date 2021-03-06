/****** Object:  Table [dbo].[URL_Setting]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[URL_Setting]') AND type in (N'U'))
DROP TABLE [dbo].[URL_Setting]
GO
/****** Object:  Table [dbo].[URL_Setting]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URL_Setting](
	[Type] [nvarchar](100) NOT NULL,
	[URL] [nvarchar](max) NULL,
 CONSTRAINT [PK_URL_Setting] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
