/****** Object:  StoredProcedure [dbo].[aa_ws_SolDisbursementSubmission_MoveToMain]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_SolDisbursementSubmission_MoveToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_SolDisbursementSubmission_MoveToMain]
GO
/****** Object:  StoredProcedure [dbo].[aa_ws_SolDisbursementSubmission_MoveToMain]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     procedure [dbo].[aa_ws_SolDisbursementSubmission_MoveToMain]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin
	
	/*
	update aaSolDisbursementSubmission_staging
	set CancelLoan_File = null		
	where arn = @arn 
	*/

	insert into SQLSolicitorDPSubmissionRemark
	select * from SQLSolicitorDPSubmissionRemark_staging
	where arn = @arn

	insert into aaSolDisbursementSubmission
	select * from aaSolDisbursementSubmission_staging
	where arn = @arn

	insert into aaSolDisbursementSubmission_PaymentDetail
	select * from aaSolDisbursementSubmission_PaymentDetail_staging 
	where arn = @arn

	delete from SQLSolicitorDPSubmissionRemark_staging
	where arn = @arn 

	delete from aaSolDisbursementSubmission_PaymentDetail_staging
	where arn = @arn 

	delete from aaSolDisbursementSubmission_staging
	where arn = @arn 

	declare @solicitorstatus nvarchar(max), @solcode nvarchar(max) 
	select @solicitorstatus = SolicitorSubmissionOption, @solcode = SolicitorCode
	from aaSolDisbursementSubmission
	where arn = @arn 

	if (@solicitorstatus = 'Submitted') 
	begin
		if exists (select 1 from aaSolDisbursementSubmission_DisMakerRejected where arn = @arn )
		begin
			insert into WorkflowHistory
			values ('Disbursement',@arn,'Disbursement Resubmitted',@solcode,null,getdate())
		end 
		else
		begin
			insert into WorkflowHistory
			values ('Disbursement',@arn,'Disbursement Submitted',@solcode,null,getdate())
		end 
		
	end 	
	
	/*
	if ( @solicitorstatus = 'Resubmitted') 
	begin
		insert into WorkflowHistory
		values ('Disbursement',@arn,'Disbursement Resubmitted',@solcode,null,getdate())
	end 
	*/

	if ( @solicitorstatus = 'UpdateInfo') 
	begin
		insert into WorkflowHistory
		values ('Disbursement',@arn,'Update Info Submitted',@solcode,null,getdate())
	end 

	if ( @solicitorstatus = 'Cancelled') 
	begin
		insert into WorkflowHistory
		values ('Disbursement',@arn,'Cancellation Submitted',@solcode,null,getdate())
	end 
end 
GO
