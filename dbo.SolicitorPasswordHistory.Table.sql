/****** Object:  Table [dbo].[SolicitorPasswordHistory]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitorPasswordHistory]') AND type in (N'U'))
DROP TABLE [dbo].[SolicitorPasswordHistory]
GO
/****** Object:  Table [dbo].[SolicitorPasswordHistory]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitorPasswordHistory](
	[SolicitorCode] [nvarchar](100) NOT NULL,
	[SolicitorPassword] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[encryptionkey] [nvarchar](100) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
