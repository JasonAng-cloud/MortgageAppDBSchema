/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_GetPaymentTabVisibility]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmission_GetPaymentTabVisibility]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmission_GetPaymentTabVisibility]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_GetPaymentTabVisibility]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE       procedure [dbo].[usp_SQLValuerDPSubmission_GetPaymentTabVisibility]
@arn nvarchar(100),
@result nvarchar(max) = null OUTPUT 
as
begin
	
	set @result = ''
	
	select @result = case when isnull([ValuationFeesFinancedAmount],0.00) <> 0.00 then 1 else 0 end 
	from [SQLLOADS]
	  where arn = @arn
		
end 
GO
