/****** Object:  Table [dbo].[SolicitorUISession]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitorUISession]') AND type in (N'U'))
DROP TABLE [dbo].[SolicitorUISession]
GO
/****** Object:  Table [dbo].[SolicitorUISession]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitorUISession](
	[SolicitorCode] [nvarchar](100) NOT NULL,
	[Var1] [nvarchar](max) NOT NULL,
	[Var2] [nvarchar](max) NOT NULL,
	[Var3] [nvarchar](max) NOT NULL,
	[Var4] [nvarchar](max) NOT NULL,
	[Var5] [nvarchar](max) NOT NULL,
	[Var6] [nvarchar](max) NOT NULL,
	[Var7] [nvarchar](max) NOT NULL,
	[Var8] [nvarchar](max) NOT NULL,
	[Var9] [nvarchar](max) NOT NULL,
	[Var10] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SolicitorUISession] PRIMARY KEY CLUSTERED 
(
	[SolicitorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
