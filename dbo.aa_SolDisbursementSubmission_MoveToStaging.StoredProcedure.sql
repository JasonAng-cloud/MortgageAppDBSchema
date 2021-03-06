/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_MoveToStaging]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_MoveToStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_MoveToStaging]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_MoveToStaging]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[aa_SolDisbursementSubmission_MoveToStaging]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin
	
	/*
	insert into aaSolicitorDisbursementSubmissionAttachment_Staging
	select * from aaSolicitorDisbursementSubmissionAttachment
	where arn = @arn

	insert into aaSolDisbursementSubmission_PaymentDetail_staging
	select * from aaSolDisbursementSubmission_PaymentDetail
	where arn = @arn
		
	insert into SQLSolicitorDPSubmissionRemark_staging
	select * from [SQLSolicitorDPSubmissionRemark]
	where arn = @arn
	*/	
	
	insert into aaSolDisbursementSubmission_staging
	select * from aaSolDisbursementSubmission
	where arn = @arn

	delete from aaSolDisbursementSubmission
	where arn = @arn 

	/*
	delete from aaSolicitorDisbursementSubmissionAttachment
	where arn = @arn 

	delete from aaSolDisbursementSubmission_PaymentDetail
	where arn = @arn 

	delete from [SQLSolicitorDPSubmissionRemark]
	where arn = @arn
	*/
end 
GO
