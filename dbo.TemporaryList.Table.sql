/****** Object:  Table [dbo].[TemporaryList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TemporaryList]') AND type in (N'U'))
DROP TABLE [dbo].[TemporaryList]
GO
/****** Object:  Table [dbo].[TemporaryList]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemporaryList](
	[item] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
