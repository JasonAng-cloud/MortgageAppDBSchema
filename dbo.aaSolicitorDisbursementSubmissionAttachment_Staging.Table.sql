/****** Object:  Table [dbo].[aaSolicitorDisbursementSubmissionAttachment_Staging]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolicitorDisbursementSubmissionAttachment_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolicitorDisbursementSubmissionAttachment_Staging]
GO
/****** Object:  Table [dbo].[aaSolicitorDisbursementSubmissionAttachment_Staging]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aaSolicitorDisbursementSubmissionAttachment_Staging](
	[ARN] [nvarchar](100) NOT NULL,
	[SolicitorCode] [nvarchar](100) NOT NULL,
	[AttachmentID] [int] NOT NULL,
	[Attachment] [nvarchar](max) NULL,
	[CreatedDate] [date] NULL,
	[AttachmentName] [nvarchar](max) NULL,
 CONSTRAINT [PK_aaSolicitorDisbursementSubmissionAttachment_Staging] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC,
	[SolicitorCode] ASC,
	[AttachmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
