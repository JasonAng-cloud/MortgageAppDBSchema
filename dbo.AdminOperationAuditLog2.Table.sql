/****** Object:  Table [dbo].[AdminOperationAuditLog2]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminOperationAuditLog2]') AND type in (N'U'))
DROP TABLE [dbo].[AdminOperationAuditLog2]
GO
/****** Object:  Table [dbo].[AdminOperationAuditLog2]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminOperationAuditLog2](
	[TableName] [nvarchar](100) NULL,
	[Operation] [nvarchar](100) NULL,
	[OperationPrimaryKeys] [nvarchar](max) NULL,
	[OperationPrimaryKeysValue] [nvarchar](max) NULL,
	[ConcatenatedFieldsName] [nvarchar](max) NULL,
	[ConcatenatedOriginalValue] [nvarchar](max) NULL,
	[ConcatenatedNewValue] [nvarchar](max) NULL,
	[Operator] [nvarchar](100) NULL,
	[InsertedDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
