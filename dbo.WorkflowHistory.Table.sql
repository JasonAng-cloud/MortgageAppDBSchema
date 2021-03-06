/****** Object:  Table [dbo].[WorkflowHistory]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkflowHistory]') AND type in (N'U'))
DROP TABLE [dbo].[WorkflowHistory]
GO
/****** Object:  Table [dbo].[WorkflowHistory]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowHistory](
	[Workflow] [nvarchar](100) NULL,
	[ARN] [nvarchar](100) NULL,
	[Status] [nvarchar](max) NULL,
	[WorkflowOwner] [nvarchar](max) NULL,
	[AssignedBy] [nvarchar](max) NULL,
	[CreatedDatetime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
