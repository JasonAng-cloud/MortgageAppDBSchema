/****** Object:  Table [dbo].[MortgageAppTaskInstance]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MortgageAppTaskInstance]') AND type in (N'U'))
DROP TABLE [dbo].[MortgageAppTaskInstance]
GO
/****** Object:  Table [dbo].[MortgageAppTaskInstance]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MortgageAppTaskInstance](
	[workflow] [nvarchar](100) NOT NULL,
	[arn] [nvarchar](100) NOT NULL,
	[TaskOwner] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[CreatedUser] [nvarchar](100) NOT NULL,
	[UpdatedUser] [nvarchar](100) NULL
) ON [PRIMARY]
GO
