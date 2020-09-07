/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetRentasList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_BankInfo_GetRentasList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_BankInfo_GetRentasList]
GO
/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetRentasList]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE      procedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetRentasList]
as
begin
	
	SELECT [Bank]
		,[RentasFlag]
		,[IBGFlag]
		,[HLBFlag]
		  ,[createddate]
      ,[updateddate]
      ,[createduser]
      ,[updateduser]
	FROM [dbo].[aaSolDisbursementSubmission_BankInfo]
	where [RentasFlag] = 1
	  
end 
GO
