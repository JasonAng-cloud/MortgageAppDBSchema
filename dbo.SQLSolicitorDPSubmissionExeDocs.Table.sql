/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionExeDocs]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitorDPSubmissionExeDocs]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitorDPSubmissionExeDocs]
GO
/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionExeDocs]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLSolicitorDPSubmissionExeDocs](
	[ARN] [nvarchar](100) NOT NULL,
	[SolicitorCode] [nvarchar](100) NOT NULL,
	[ExeDocNameID] [nvarchar](100) NOT NULL,
	[ExeDocNameDesc] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_SQLSolicitorDPSubmissionExeDocs] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC,
	[SolicitorCode] ASC,
	[ExeDocNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
