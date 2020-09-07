/****** Object:  Table [dbo].[SolicitorLoginTrialSession_FailedAttemptLog]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitorLoginTrialSession_FailedAttemptLog]') AND type in (N'U'))
DROP TABLE [dbo].[SolicitorLoginTrialSession_FailedAttemptLog]
GO
/****** Object:  Table [dbo].[SolicitorLoginTrialSession_FailedAttemptLog]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitorLoginTrialSession_FailedAttemptLog](
	[SolicitorCode] [nvarchar](100) NOT NULL,
	[loginDatetime] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
