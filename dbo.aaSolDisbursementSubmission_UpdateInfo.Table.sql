/****** Object:  Table [dbo].[aaSolDisbursementSubmission_UpdateInfo]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_UpdateInfo]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_UpdateInfo]
GO
/****** Object:  Table [dbo].[aaSolDisbursementSubmission_UpdateInfo]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aaSolDisbursementSubmission_UpdateInfo](
	[arn] [nvarchar](100) NOT NULL,
	[UpdateInfo_Reason] [nvarchar](300) NULL,
	[UpdateInfo_Others] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_aaSolDisbursementSubmission_UpdateInfo] PRIMARY KEY CLUSTERED 
(
	[arn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
