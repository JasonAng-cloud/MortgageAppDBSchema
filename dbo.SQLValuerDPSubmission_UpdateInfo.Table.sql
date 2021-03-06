/****** Object:  Table [dbo].[SQLValuerDPSubmission_UpdateInfo]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuerDPSubmission_UpdateInfo]') AND type in (N'U'))
DROP TABLE [dbo].[SQLValuerDPSubmission_UpdateInfo]
GO
/****** Object:  Table [dbo].[SQLValuerDPSubmission_UpdateInfo]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLValuerDPSubmission_UpdateInfo](
	[ARN] [nvarchar](100) NOT NULL,
	[VUpdateInfoStatus] [nvarchar](max) NULL,
	[VUpdateInfoStatusOthers] [nvarchar](max) NULL,
	[Status] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_SQLValuerDPSubmission_UpdateInfo] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
