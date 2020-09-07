/****** Object:  Table [dbo].[UserRoleMetric_staging]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleMetric_staging]') AND type in (N'U'))
DROP TABLE [dbo].[UserRoleMetric_staging]
GO
/****** Object:  Table [dbo].[UserRoleMetric_staging]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleMetric_staging](
	[UserName] [nvarchar](100) NOT NULL,
	[UserRoleID] [bigint] NOT NULL
) ON [PRIMARY]
GO
