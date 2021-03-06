/****** Object:  Table [dbo].[Settings]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Settings]') AND type in (N'U'))
DROP TABLE [dbo].[Settings]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[SenderEmail] [nvarchar](100) NULL,
	[EncryptionKey] [nvarchar](100) NULL,
	[SolicitorLoginTrialsNumberOfLoginAllowed] [int] NULL,
	[SolicitorLoginTrialsExpiryPeroidInMinutes] [int] NULL,
	[ValuerLoginTrialsNumberOfLoginAllowed] [int] NULL,
	[ValuerLoginTrialsExpiryPeroidInMinutes] [int] NULL,
	[SolicitorDormantIDReportPeriodInDays] [int] NULL,
	[ValuerDormantIDReportPeriodInDays] [int] NULL,
	[SolicitorLoginPasswordHistoryCount] [int] NULL,
	[ValuerLoginPasswordHistoryCount] [int] NULL,
	[SolicitorLoginPasswordMaxExpiryDays] [int] NULL,
	[ValuerLoginPasswordMaxExpiryDays] [int] NULL,
	[SolicitorLoginPasswordMaxExpiryWarningDays] [int] NULL,
	[ValuerLoginPasswordMaxExpiryWarningDays] [int] NULL,
	[SolicitorPasswordMinCharacters] [int] NULL,
	[ValuerPasswordMinCharacters] [int] NULL,
	[SolicitorSessionInMinutes] [int] NULL,
	[ValuerSessionInMinutes] [int] NULL,
	[InternalUserSessionInMinutes] [int] NULL,
	[fireeye_flag] [int] NULL,
	[InternalUserDormantIDReportPeriodInDays] [int] NULL,
	[InternalUserLoginTrialsExpiryPeroidInMinutes] [int] NULL,
	[InternalUserLoginTrialsNumberOfLoginAllowed] [int] NULL,
	[pdfmasterpassword] [nvarchar](100) NULL,
	[lastupdateddate] [datetime] NULL,
	[lastupdateduser] [nvarchar](100) NULL
) ON [PRIMARY]
GO
