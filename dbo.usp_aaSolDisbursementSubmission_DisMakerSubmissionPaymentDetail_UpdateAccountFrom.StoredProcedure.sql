/****** Object:  StoredProcedure [dbo].[usp_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_UpdateAccountFrom]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_UpdateAccountFrom]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_UpdateAccountFrom]
GO
/****** Object:  StoredProcedure [dbo].[usp_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_UpdateAccountFrom]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--select * from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail

CREATE   procedure [dbo].[usp_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_UpdateAccountFrom]
@arn nvarchar(max) =null,
@RunningIDForCurrentSubmission nvarchar(max) =null,
@AccountFrom nvarchar(max) =null,
@error nvarchar(max) =null output 
as
begin
	set @error = ''

	update aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
	set AccountFrom= @AccountFrom
	where arn = @arn 
		and RunningIDForCurrentSubmission = @RunningIDForCurrentSubmission
end 
GO
