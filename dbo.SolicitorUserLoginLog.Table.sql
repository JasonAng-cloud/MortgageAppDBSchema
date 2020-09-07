/****** Object:  Table [dbo].[SolicitorUserLoginLog]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitorUserLoginLog]') AND type in (N'U'))
DROP TABLE [dbo].[SolicitorUserLoginLog]
GO
/****** Object:  Table [dbo].[SolicitorUserLoginLog]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitorUserLoginLog](
	[UserName] [nvarchar](100) NOT NULL,
	[loginDatetime] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
