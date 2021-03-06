/****** Object:  Table [dbo].[SQLDUMakerDP_SolicitorSubmission]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_SolicitorSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_SolicitorSubmission]
GO
/****** Object:  Table [dbo].[SQLDUMakerDP_SolicitorSubmission]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLDUMakerDP_SolicitorSubmission](
	[ARN] [nvarchar](100) NOT NULL,
	[a1] [bit] NULL,
	[a2] [bit] NULL,
	[a3] [bit] NULL,
	[a4] [bit] NULL,
	[a5] [bit] NULL,
	[a6] [bit] NULL,
	[a7] [bit] NULL,
	[a8_Remarks] [nvarchar](max) NULL,
	[a9] [bit] NULL,
	[aOthers] [nvarchar](max) NULL,
	[AttorneyCentreID] [bigint] NULL,
	[AttorneyNameID] [bigint] NULL,
	[b1] [bit] NULL,
	[b2] [bit] NULL,
	[b3] [bit] NULL,
	[b4] [bit] NULL,
	[b5] [bit] NULL,
	[b6] [bit] NULL,
	[bOthers] [nvarchar](max) NULL,
	[FacilityCancelledDate] [date] NULL,
	[DUMakerEmail] [nvarchar](100) NULL,
	[HardCopyReceivedDate] [date] NULL,
	[Decision] [nvarchar](max) NULL,
	[Status] [nvarchar](100) NULL,
	[AttorneyCentre] [nvarchar](max) NULL,
	[AttorneyName] [nvarchar](max) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_SQLDUMaker] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
