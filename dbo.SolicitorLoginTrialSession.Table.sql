/****** Object:  Table [dbo].[SolicitorLoginTrialSession]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitorLoginTrialSession]') AND type in (N'U'))
DROP TABLE [dbo].[SolicitorLoginTrialSession]
GO
/****** Object:  Table [dbo].[SolicitorLoginTrialSession]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitorLoginTrialSession](
	[SolicitorCode] [nvarchar](100) NOT NULL,
	[TrialLeft] [int] NOT NULL,
	[LoginTrialDatetime] [datetime] NOT NULL,
	[Expired] [datetime] NOT NULL
) ON [PRIMARY]
GO
