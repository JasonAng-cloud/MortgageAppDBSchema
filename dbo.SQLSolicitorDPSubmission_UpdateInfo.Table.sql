/****** Object:  Table [dbo].[SQLSolicitorDPSubmission_UpdateInfo]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitorDPSubmission_UpdateInfo]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitorDPSubmission_UpdateInfo]
GO
/****** Object:  Table [dbo].[SQLSolicitorDPSubmission_UpdateInfo]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLSolicitorDPSubmission_UpdateInfo](
	[ARN] [nvarchar](100) NOT NULL,
	[Status] [nvarchar](100) NULL,
	[SStatus] [nvarchar](100) NULL,
	[SStatusOthers] [nvarchar](max) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_SQLSolicitorDPSubmission_UpdateInfo] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
