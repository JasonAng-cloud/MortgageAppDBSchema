/****** Object:  Table [dbo].[LOADS_NEW_LI_STAGING]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOADS_NEW_LI_STAGING]') AND type in (N'U'))
DROP TABLE [dbo].[LOADS_NEW_LI_STAGING]
GO
/****** Object:  Table [dbo].[LOADS_NEW_LI_STAGING]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOADS_NEW_LI_STAGING](
	[RowNumber] [int] NULL,
	[ARN] [nvarchar](100) NULL,
	[edms_lastmodifieddate] [datetime] NULL
) ON [PRIMARY]
GO
