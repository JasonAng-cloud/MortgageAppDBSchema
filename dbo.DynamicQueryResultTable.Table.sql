/****** Object:  Table [dbo].[DynamicQueryResultTable]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DynamicQueryResultTable]') AND type in (N'U'))
DROP TABLE [dbo].[DynamicQueryResultTable]
GO
/****** Object:  Table [dbo].[DynamicQueryResultTable]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DynamicQueryResultTable](
	[colA] [nvarchar](max) NULL,
	[colB] [nvarchar](max) NULL,
	[colC] [nvarchar](max) NULL,
	[colD] [nvarchar](max) NULL,
	[colE] [nvarchar](max) NULL,
	[colF] [nvarchar](max) NULL,
	[colG] [nvarchar](max) NULL,
	[colH] [nvarchar](max) NULL,
	[colI] [nvarchar](max) NULL,
	[colJ] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
