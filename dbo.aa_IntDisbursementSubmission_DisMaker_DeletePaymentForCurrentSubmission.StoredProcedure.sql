/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]
GO
/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE           procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]
@arn nvarchar(max) = null ,
@billingid nvarchar(max) = null  ,
@RunningIDForCurrentSubmission nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	
	set @Error = ''

	if exists 
	(
		select 1
		from aaIntDisbursementSubmission
		where DisbursementMakerSubmissionCompleted = 1
			and arn = @arn 			
	)
	begin
		set @Error = 'The record is submitted. You are not allowed to add/delete further payment until bank approve/reject the current submission'
	end 

	if (@Error ='')
	begin
		delete from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
		where arn = @arn 
			and RunningIDForCurrentSubmission = @RunningIDForCurrentSubmission			
		
	end 
	

end 
GO
