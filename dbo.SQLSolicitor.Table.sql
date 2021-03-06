/****** Object:  Table [dbo].[SQLSolicitor]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitor]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitor]
GO
/****** Object:  Table [dbo].[SQLSolicitor]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLSolicitor](
	[SolicitorCode] [nvarchar](100) NOT NULL,
	[SolicitorPassword] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](100) NULL,
	[SolicitorName] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL,
	[SolicitorLastLoginDatetime] [datetime] NULL,
	[PasswordForceReset] [nvarchar](100) NULL,
	[PasswordExpiryDate] [datetime] NULL,
	[PasswordExpiryWarningDate] [datetime] NULL,
	[IDLastLockedDatetime] [datetime] NULL,
 CONSTRAINT [PK_SQLSolicitor] PRIMARY KEY CLUSTERED 
(
	[SolicitorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
