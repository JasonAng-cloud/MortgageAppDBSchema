/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOMakerRejected]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_RCOMakerRejected]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_RCOMakerRejected]
GO
/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOMakerRejected]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aaIntDisbursementSubmission_RCOMakerRejected](
	[arn] [nvarchar](100) NOT NULL,
	[BalanceAdviceLetterApplicableFlag] [bit] NULL,
	[UrgentFlag] [bit] NULL,
	[LS_RedemptionDueDateFlag] [bit] NULL,
	[LS_RedemptionDueDate] [date] NULL,
	[LS_ExtendedCompletionDateFlag] [bit] NULL,
	[LS_CompletionDate] [date] NULL,
	[LS_ExtendedCompletionDate] [date] NULL,
	[PR_DeveloperBillingDueDateFlag] [bit] NULL,
	[PR_Stage2AFlag] [bit] NULL,
	[PR_Stage2BFlag] [bit] NULL,
	[PR_Stage2CFlag] [bit] NULL,
	[PR_Stage2DFlag] [bit] NULL,
	[PR_Stage2EFlag] [bit] NULL,
	[PR_Stage2FFlag] [bit] NULL,
	[PR_Stage2GFlag] [bit] NULL,
	[PR_Stage2HFlag] [bit] NULL,
	[PR_StageOthers] [nvarchar](max) NULL,
	[PR_EarliestBillingDueDate] [date] NULL,
	[PR_TotalBillingAmount] [money] NULL,
	[PR_AnyBridgingFinancierFlag] [bit] NULL,
	[PR_BridgingFinancier] [nvarchar](100) NULL,
	[PR_BridgingFinancierEmailAddress] [nvarchar](100) NULL,
	[PR_BridgingFinancierRedemptionSum] [money] NULL,
	[PR_RedemptionPaymentAccountNumber] [nvarchar](100) NULL,
	[PR_BeneficiaryBank] [nvarchar](100) NULL,
	[PR_BridgingFinancierRedemptionExpiryDate] [date] NULL,
	[PR_DeveloperName] [nvarchar](100) NULL,
	[PR_DeveloperEmailAddress] [nvarchar](100) NULL,
	[PR_DeveloperPIC] [nvarchar](100) NULL,
	[PR_DeveloperHDA] [nvarchar](100) NULL,
	[PR_DeveloperHDABank] [nvarchar](100) NULL,
	[PR_PurchasedPrice] [money] NULL,
	[LF_PayeeName] [nvarchar](100) NULL,
	[LF_BilledAmount] [money] NULL,
	[LF_AccountNumber] [nvarchar](100) NULL,
	[LF_Bank] [nvarchar](100) NULL,
	[LF_PaymentDescription] [nvarchar](100) NULL,
	[LF_PaymentMode] [nvarchar](100) NULL,
	[UpdateInfo_Reason] [nvarchar](300) NULL,
	[UpdateInfo_Others] [nvarchar](max) NULL,
	[CancelLoan_Remarks] [nvarchar](max) NULL,
	[CancelLoan_File] [nvarchar](max) NULL,
	[SolicitorSubmissionOption] [nvarchar](100) NULL,
	[SolicitorSubmissionCompleted] [bit] NULL,
	[SolicitorCode] [nvarchar](100) NULL,
	[SolicitorSubmissionDate] [datetime] NULL,
	[SolicitorSubmissionPDFID] [bigint] NULL,
	[DisbursementMakerEmailAddress] [nvarchar](100) NULL,
	[DisbursementMakerDecision] [nvarchar](100) NULL,
	[DisbursementMakerSubmissionCompleted] [bit] NULL,
	[DisbursementMakerRejectionReason] [nvarchar](max) NULL,
	[DisbursementMakerSubmissionDate] [datetime] NULL,
	[DisbursementMakerSubmissionPDFID] [bigint] NULL,
	[DisbursementCheckerEmailAddress] [nvarchar](100) NULL,
	[DisbursementCheckerDecision] [nvarchar](100) NULL,
	[DisbursementCheckerSubmissionCompleted] [bit] NULL,
	[DisbursementCheckerRejectionReason] [nvarchar](max) NULL,
	[DisbursementCheckerSubmissionDate] [datetime] NULL,
	[DisbursementCheckerPDFID] [bigint] NULL,
	[RCOMakerEmailAddress] [nvarchar](max) NULL,
	[RCOMakerDecision] [nvarchar](max) NULL,
	[RCOMakerSubmissionCompleted] [bit] NULL,
	[RCOMakerRejectionReason] [nvarchar](max) NULL,
	[RCOMakerSubmissionDate] [datetime] NULL,
	[RCOMakerPDFID] [bigint] NULL,
	[RCOCheckerEmailAddress] [nvarchar](max) NULL,
	[RCOCheckerDecision] [nvarchar](max) NULL,
	[RCOCheckerSubmissionCompleted] [bit] NULL,
	[RCOCheckerRejectionReason] [nvarchar](max) NULL,
	[RCOCheckerSubmissionDate] [datetime] NULL,
	[RCOCheckerPDFID] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[BillingRunningID] [bigint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
