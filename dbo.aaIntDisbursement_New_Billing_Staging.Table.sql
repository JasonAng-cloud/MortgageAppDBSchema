/****** Object:  Table [dbo].[aaIntDisbursement_New_Billing_Staging]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursement_New_Billing_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursement_New_Billing_Staging]
GO
/****** Object:  Table [dbo].[aaIntDisbursement_New_Billing_Staging]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aaIntDisbursement_New_Billing_Staging](
	[RowNumber] [int] NULL,
	[ARN] [nvarchar](100) NULL,
	[edms_lastmodifieddate] [datetime] NULL
) ON [PRIMARY]
GO
