/****** Object:  Table [dbo].[ValuerLoginTrialSession]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValuerLoginTrialSession]') AND type in (N'U'))
DROP TABLE [dbo].[ValuerLoginTrialSession]
GO
/****** Object:  Table [dbo].[ValuerLoginTrialSession]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValuerLoginTrialSession](
	[ValuerCode] [nvarchar](100) NOT NULL,
	[TrialLeft] [int] NOT NULL,
	[LoginTrialDatetime] [datetime] NOT NULL,
	[Expired] [datetime] NOT NULL
) ON [PRIMARY]
GO
