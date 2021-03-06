/****** Object:  Table [dbo].[InternalUser]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUser]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUser]
GO
/****** Object:  Table [dbo].[InternalUser]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternalUser](
	[UserName] [nvarchar](100) NOT NULL,
	[UserEmail] [nvarchar](100) NULL,
	[UserFullName] [nvarchar](max) NULL,
	[Branch] [nvarchar](max) NULL,
	[LastLoginDatetime] [datetime] NULL,
	[Status] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IDLastLockedDatetime] [datetime] NULL,
	[IDLastLockedByAdminDatetime] [datetime] NULL,
	[Remarks] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
