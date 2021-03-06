/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_Main]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_Main]
GO
/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_Main]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE            procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_Main]
@arn nvarchar(max) = null ,
@billingid bigint = null, 
@DisbursementMakerEmailAddress  nvarchar(max) = null ,
@DisbursementMakerDecision nvarchar(max) = null ,
@DisbursementMakerSubmissionCompleted nvarchar(max) = null ,
@DisbursementMakerRejectionReason nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin	
	set @Error = ''

	if (@DisbursementMakerEmailAddress like 'K2:%')
	begin		
		set @DisbursementMakerEmailAddress = Stuff(@DisbursementMakerEmailAddress, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	if not exists 
	(
		select 1
		from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
		where arn = @arn 			
	)
	begin
		set @error = @error + 'Please enter at least 1 payment in the Payment tab<br>'
	end 

	if (@Error = '')
	begin						

		 update aaIntDisbursementSubmission
			set DisbursementMakerEmailAddress = @DisbursementMakerEmailAddress, 
				DisbursementMakerDecision = @DisbursementMakerDecision, 
				DisbursementMakerSubmissionCompleted = @DisbursementMakerSubmissionCompleted, 
				DisbursementMakerRejectionReason = @DisbursementMakerRejectionReason,	
				[DisbursementMakerSubmissionDate] = getdate(),
				[UpdatedDate] = getdate()
			where arn = @arn 			
			
		update aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
		set DisMakerEmail=@DisbursementMakerEmailAddress,
			DisMakerSubmissionDate= getdate()
		where arn = @arn 			
	end

end 
GO
