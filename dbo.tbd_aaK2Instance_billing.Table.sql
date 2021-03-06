/****** Object:  Table [dbo].[tbd_aaK2Instance_billing]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_aaK2Instance_billing]') AND type in (N'U'))
DROP TABLE [dbo].[tbd_aaK2Instance_billing]
GO
/****** Object:  Table [dbo].[tbd_aaK2Instance_billing]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbd_aaK2Instance_billing](
	[SurrogateID] [bigint] IDENTITY(1,1) NOT NULL,
	[K2SerialNumber] [nvarchar](100) NOT NULL,
	[K2Folio] [nvarchar](100) NOT NULL,
	[arn] [nvarchar](100) NOT NULL,
	[billingid] [bigint] NOT NULL
) ON [PRIMARY]
GO
