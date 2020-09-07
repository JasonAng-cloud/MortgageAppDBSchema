/****** Object:  Table [dbo].[tblCDC]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCDC]') AND type in (N'U'))
DROP TABLE [dbo].[tblCDC]
GO
/****** Object:  Table [dbo].[tblCDC]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCDC](
	[newLICDC] [datetime] NULL,
	[tempLICDC] [datetime] NULL,
	[newBillingCDC] [datetime] NULL,
	[tempBillingCDC] [datetime] NULL
) ON [PRIMARY]
GO
