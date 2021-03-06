/****** Object:  Table [dbo].[SQLValuerDPSubmissionRemark_Staging]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuerDPSubmissionRemark_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLValuerDPSubmissionRemark_Staging]
GO
/****** Object:  Table [dbo].[SQLValuerDPSubmissionRemark_Staging]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLValuerDPSubmissionRemark_Staging](
	[ARN] [nvarchar](100) NOT NULL,
	[ValuerCode] [nvarchar](100) NOT NULL,
	[RemarkID] [bigint] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_SQLValuerDPSubmissionRemark_Staging] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC,
	[ValuerCode] ASC,
	[RemarkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
