/****** Object:  Table [dbo].[InternalUserRole_AccessList]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUserRole_AccessList]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUserRole_AccessList]
GO
/****** Object:  Table [dbo].[InternalUserRole_AccessList]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternalUserRole_AccessList](
	[UserRoleID] [bigint] NOT NULL,
	[UserRoleName] [nvarchar](100) NULL,
	[UserRoleDescription] [nvarchar](max) NULL,
	[AccessList] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL,
 CONSTRAINT [PK_InternalUserRole_AccessList] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
