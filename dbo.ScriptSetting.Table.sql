/****** Object:  Table [dbo].[ScriptSetting]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScriptSetting]') AND type in (N'U'))
DROP TABLE [dbo].[ScriptSetting]
GO
/****** Object:  Table [dbo].[ScriptSetting]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScriptSetting](
	[id] [int] NOT NULL,
	[PageTitle] [nvarchar](max) NULL,
 CONSTRAINT [PK_ScriptSetting] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
