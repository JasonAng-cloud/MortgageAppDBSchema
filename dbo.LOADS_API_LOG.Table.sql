IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LOADS_API_LOG_InsertedDatatime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LOADS_API_LOG] DROP CONSTRAINT [DF_LOADS_API_LOG_InsertedDatatime]
END
GO
/****** Object:  Table [dbo].[LOADS_API_LOG]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOADS_API_LOG]') AND type in (N'U'))
DROP TABLE [dbo].[LOADS_API_LOG]
GO
/****** Object:  Table [dbo].[LOADS_API_LOG]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOADS_API_LOG](
	[ARN] [nvarchar](100) NULL,
	[STATUSCODE] [nvarchar](100) NULL,
	[STATUSDESC] [nvarchar](100) NULL,
	[InsertedDatatime] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LOADS_API_LOG] ADD  CONSTRAINT [DF_LOADS_API_LOG_InsertedDatatime]  DEFAULT (getdate()) FOR [InsertedDatatime]
GO
