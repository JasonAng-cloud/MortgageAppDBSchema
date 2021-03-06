/****** Object:  Table [dbo].[UserRoleMetric]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleMetric]') AND type in (N'U'))
DROP TABLE [dbo].[UserRoleMetric]
GO
/****** Object:  Table [dbo].[UserRoleMetric]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleMetric](
	[UserName] [nvarchar](100) NOT NULL,
	[UserRoleID] [bigint] NOT NULL,
 CONSTRAINT [PK_UserRoleMetric] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
