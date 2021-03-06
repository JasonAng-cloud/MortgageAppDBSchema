/****** Object:  Table [dbo].[UAMReport]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UAMReport]') AND type in (N'U'))
DROP TABLE [dbo].[UAMReport]
GO
/****** Object:  Table [dbo].[UAMReport]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UAMReport](
	[UserName] [nvarchar](100) NOT NULL,
	[UserEmail] [nvarchar](100) NULL,
	[UserFullName] [nvarchar](max) NULL,
	[Branch] [nvarchar](max) NULL,
	[LastLoginDatetime] [datetime] NULL,
	[Status] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IDLastLockedDatetime] [datetime] NULL,
	[AccessList] [nvarchar](max) NULL,
 CONSTRAINT [PK_UAMReport] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
