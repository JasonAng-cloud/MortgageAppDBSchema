/****** Object:  Table [dbo].[test_usercontext]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test_usercontext]') AND type in (N'U'))
DROP TABLE [dbo].[test_usercontext]
GO
/****** Object:  Table [dbo].[test_usercontext]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_usercontext](
	[uinfo] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
