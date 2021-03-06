/****** Object:  Table [dbo].[SQLValuer]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuer]') AND type in (N'U'))
DROP TABLE [dbo].[SQLValuer]
GO
/****** Object:  Table [dbo].[SQLValuer]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLValuer](
	[ValuerCode] [nvarchar](100) NOT NULL,
	[ValuerPassword] [nvarchar](max) NULL,
	[Status] [nvarchar](100) NULL,
	[ValuerName] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL,
	[ValuerLastLoginDatetime] [datetime] NULL,
	[PasswordForceReset] [nvarchar](100) NULL,
	[PasswordExpiryDate] [datetime] NULL,
	[PasswordExpiryWarningDate] [datetime] NULL,
	[IDLastLockedDatetime] [datetime] NULL,
 CONSTRAINT [PK_SQLValuer] PRIMARY KEY CLUSTERED 
(
	[ValuerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
