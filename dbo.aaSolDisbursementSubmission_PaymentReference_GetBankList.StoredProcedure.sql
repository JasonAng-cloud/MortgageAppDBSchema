/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList]
GO
/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE      procedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList]
as
begin
	
	SELECT [PaymentReference]
      ,[SolicitorFlag]
      ,[BankFlag]
      ,[createddate]
      ,[updateddate]
      ,[createduser]
      ,[updateduser]
  FROM [dbo].[aaSolDisbursementSubmission_PaymentReference]
	where [BankFlag] = 1
	  
end 
GO
