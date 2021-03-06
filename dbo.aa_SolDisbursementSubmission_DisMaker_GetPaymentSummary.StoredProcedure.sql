/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentSummary]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentSummary]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentSummary]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--[aa_SolDisbursementSubmission_DisMaker_GetPaymentSummary] 'TAI/RB/2019/Z0009998'

CREATE       procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentSummary]
@arn nvarchar(100) = null 
as
begin
	
	select sqlloads.arn,
		null as purchasedprice ,		
		TotalFinancingAmount,
		isnull(phistory.AmountDisburseTotal,0.00) as AmountDisburseTotal,
		isnull((TotalFinancingAmount - isnull(phistory.AmountDisburseTotal,0.00)),0.00) as balance 
	from sqlloads 
		left join
		(
		select arn,
			sum([AmountDisburse]) as AmountDisburseTotal
		from vw_aaDisbursementPaymentHistory
		where arn = @arn 
		group by arn 
		) phistory on phistory.arn = sqlloads.arn 
	where sqlloads.arn = @arn 
	
end 
GO
