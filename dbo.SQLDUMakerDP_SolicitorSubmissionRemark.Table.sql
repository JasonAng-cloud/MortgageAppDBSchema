/****** Object:  Table [dbo].[SQLDUMakerDP_SolicitorSubmissionRemark]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_SolicitorSubmissionRemark]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_SolicitorSubmissionRemark]
GO
/****** Object:  Table [dbo].[SQLDUMakerDP_SolicitorSubmissionRemark]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLDUMakerDP_SolicitorSubmissionRemark](
	[ARN] [nvarchar](100) NOT NULL,
	[DUMakerEmail] [nvarchar](100) NOT NULL,
	[RemarkID] [bigint] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_SQLDUMakerDPSubmissionRemark_1] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC,
	[DUMakerEmail] ASC,
	[RemarkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
