/****** Object:  Table [dbo].[MortgageAppTaskInstance_logs]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MortgageAppTaskInstance_logs]') AND type in (N'U'))
DROP TABLE [dbo].[MortgageAppTaskInstance_logs]
GO
/****** Object:  Table [dbo].[MortgageAppTaskInstance_logs]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MortgageAppTaskInstance_logs](
	[workflow] [nvarchar](100) NOT NULL,
	[arn] [nvarchar](100) NOT NULL,
	[TaskOwner] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[CreatedUser] [nvarchar](100) NOT NULL,
	[UpdatedUser] [nvarchar](100) NULL,
	[Unpicked] [bit] NULL,
	[Completed] [bit] NULL
) ON [PRIMARY]
GO
