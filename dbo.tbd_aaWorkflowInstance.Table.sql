/****** Object:  Table [dbo].[tbd_aaWorkflowInstance]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_aaWorkflowInstance]') AND type in (N'U'))
DROP TABLE [dbo].[tbd_aaWorkflowInstance]
GO
/****** Object:  Table [dbo].[tbd_aaWorkflowInstance]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbd_aaWorkflowInstance](
	[SurrogateID] [bigint] IDENTITY(1,1) NOT NULL,
	[WorklistItemID] [nvarchar](max) NULL,
	[AllocatedUser] [nvarchar](max) NULL,
	[SerialNumber] [nvarchar](max) NULL,
	[EventInstanceName] [nvarchar](max) NULL,
	[ProcessInstanceFolio] [nvarchar](max) NULL,
	[EventInstanceStartDate] [date] NULL,
	[ProcessInstanceStatus] [nvarchar](max) NULL,
	[ARN] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[workflow] [nvarchar](max) NULL,
	[K2WorkflowName] [nvarchar](max) NULL,
	[ActInstDestID] [nvarchar](max) NULL,
	[ProcInstID] [nvarchar](max) NULL,
 CONSTRAINT [PK_aaWorkflowInstance] PRIMARY KEY CLUSTERED 
(
	[SurrogateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
