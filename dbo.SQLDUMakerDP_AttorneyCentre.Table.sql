/****** Object:  Table [dbo].[SQLDUMakerDP_AttorneyCentre]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_AttorneyCentre]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_AttorneyCentre]
GO
/****** Object:  Table [dbo].[SQLDUMakerDP_AttorneyCentre]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLDUMakerDP_AttorneyCentre](
	[AttorneyCentreID] [bigint] IDENTITY(1,1) NOT NULL,
	[AttorneyCentre] [nvarchar](100) NULL,
	[status] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL,
 CONSTRAINT [PK_SQLDUMakerDP_AttorneyCentre] PRIMARY KEY CLUSTERED 
(
	[AttorneyCentreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
