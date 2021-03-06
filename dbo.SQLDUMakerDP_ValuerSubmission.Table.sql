/****** Object:  Table [dbo].[SQLDUMakerDP_ValuerSubmission]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_ValuerSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_ValuerSubmission]
GO
/****** Object:  Table [dbo].[SQLDUMakerDP_ValuerSubmission]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLDUMakerDP_ValuerSubmission](
	[ARN] [nvarchar](100) NOT NULL,
	[FormSubmissionDate] [date] NULL,
	[DocumentExecutionSubmissionDate] [date] NULL,
	[Decision] [nvarchar](max) NULL,
	[DUMakerEmail] [nvarchar](100) NULL,
	[Status] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_SQLDUMakerDP_ValuerSubmission] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
