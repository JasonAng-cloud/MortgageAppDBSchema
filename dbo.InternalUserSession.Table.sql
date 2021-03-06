/****** Object:  Table [dbo].[InternalUserSession]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUserSession]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUserSession]
GO
/****** Object:  Table [dbo].[InternalUserSession]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternalUserSession](
	[UserName] [nvarchar](100) NOT NULL,
	[LogonDatetime] [datetime] NULL,
	[Expired] [datetime] NULL,
	[ClientIPAddress] [nvarchar](100) NULL,
 CONSTRAINT [PK_InternalUserSession] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
