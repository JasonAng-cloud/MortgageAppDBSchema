/****** Object:  Table [dbo].[SQLSolicitor_DocumentAdminFeeCreditedToOption]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitor_DocumentAdminFeeCreditedToOption]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitor_DocumentAdminFeeCreditedToOption]
GO
/****** Object:  Table [dbo].[SQLSolicitor_DocumentAdminFeeCreditedToOption]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLSolicitor_DocumentAdminFeeCreditedToOption](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Options] [nvarchar](max) NULL,
 CONSTRAINT [PK_SQLSolicitor_DocumentAdminFeeCreditedToOption] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
