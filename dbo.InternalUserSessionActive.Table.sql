/****** Object:  Table [dbo].[InternalUserSessionActive]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUserSessionActive]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUserSessionActive]
GO
/****** Object:  Table [dbo].[InternalUserSessionActive]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternalUserSessionActive](
	[UserName] [nvarchar](100) NOT NULL,
	[LogonDatetime] [datetime] NULL,
	[ClientIPAddress] [nvarchar](100) NULL
) ON [PRIMARY]
GO
