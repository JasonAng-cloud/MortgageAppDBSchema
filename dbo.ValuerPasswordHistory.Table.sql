/****** Object:  Table [dbo].[ValuerPasswordHistory]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValuerPasswordHistory]') AND type in (N'U'))
DROP TABLE [dbo].[ValuerPasswordHistory]
GO
/****** Object:  Table [dbo].[ValuerPasswordHistory]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValuerPasswordHistory](
	[ValuerCode] [nvarchar](100) NOT NULL,
	[ValuerPassword] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[encryptionkey] [nvarchar](100) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
