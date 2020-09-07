/****** Object:  Table [dbo].[SQLDUMakerDP_AttorneyName]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_AttorneyName]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_AttorneyName]
GO
/****** Object:  Table [dbo].[SQLDUMakerDP_AttorneyName]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLDUMakerDP_AttorneyName](
	[AttorneyNameID] [bigint] IDENTITY(1,1) NOT NULL,
	[AttorneyName] [nvarchar](100) NULL,
	[AttorneyCentreID] [bigint] NOT NULL,
	[status] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[CreatedUser] [nvarchar](100) NULL,
	[UpdatedUser] [nvarchar](100) NULL,
 CONSTRAINT [PK_SQLDUMakerDP_AttorneyName] PRIMARY KEY CLUSTERED 
(
	[AttorneyNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
