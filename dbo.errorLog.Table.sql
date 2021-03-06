/****** Object:  Table [dbo].[errorLog]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[errorLog]') AND type in (N'U'))
DROP TABLE [dbo].[errorLog]
GO
/****** Object:  Table [dbo].[errorLog]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[errorLog](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[APIName] [nvarchar](max) NULL,
	[errorType] [nvarchar](max) NULL,
	[errorMessage] [nvarchar](max) NULL,
	[errorDetail] [nvarchar](max) NULL,
	[APIErrorDt] [datetime] NULL,
	[DateInserted] [datetime] NULL,
 CONSTRAINT [PK_errorLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
