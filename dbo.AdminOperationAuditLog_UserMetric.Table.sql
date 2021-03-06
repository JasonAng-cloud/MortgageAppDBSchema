/****** Object:  Table [dbo].[AdminOperationAuditLog_UserMetric]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminOperationAuditLog_UserMetric]') AND type in (N'U'))
DROP TABLE [dbo].[AdminOperationAuditLog_UserMetric]
GO
/****** Object:  Table [dbo].[AdminOperationAuditLog_UserMetric]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminOperationAuditLog_UserMetric](
	[TableName] [nvarchar](100) NULL,
	[Operation] [nvarchar](100) NULL,
	[OperationPrimaryKeys] [nvarchar](max) NULL,
	[OperationPrimaryKeysValue] [nvarchar](max) NULL,
	[ConcatenatedFieldsName] [nvarchar](max) NULL,
	[ConcatenatedOriginalValue] [nvarchar](max) NULL,
	[ConcatenatedNewValue] [nvarchar](max) NULL,
	[Operator] [nvarchar](100) NULL,
	[InsertedDateTime] [datetime] NULL,
	[OperationPrimaryKeysView] [nvarchar](max) NULL,
	[OperationPrimaryKeysValueView] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
