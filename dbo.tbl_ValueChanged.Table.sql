/****** Object:  Table [dbo].[tbl_ValueChanged]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ValueChanged]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ValueChanged]
GO
/****** Object:  Table [dbo].[tbl_ValueChanged]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ValueChanged](
	[ColID] [int] NOT NULL,
	[ColumnName] [nvarchar](max) NULL,
	[OriginalValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ValueChanged] [varchar](4) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
