/****** Object:  StoredProcedure [dbo].[aa_updatePDFID_billing]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_updatePDFID_billing]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_updatePDFID_billing]
GO
/****** Object:  StoredProcedure [dbo].[aa_updatePDFID_billing]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     procedure [dbo].[aa_updatePDFID_billing]
@arn nvarchar(100),
@billingid bigint,
@pdfID bigint,
@WorkflowOperation nvarchar(1000)
as
begin	
	if (@WorkflowOperation = 'Billing_DisbursementChecker_Submission')
	begin
		update aaIntDisbursementSubmission
		set DisbursementCheckerPDFID = @pdfID
		where arn = @arn 				
	end 
	if (@WorkflowOperation = 'Billing_DisbursementMaker_Submission')
	begin
		update aaIntDisbursementSubmission
		set DisbursementMakerSubmissionPDFID = @pdfID
		where arn = @arn 				
	end 

	if (@WorkflowOperation = 'Billing_RCOMaker_Submission')
	begin
		update aaIntDisbursementSubmission
		set RCOMakerPDFID = @pdfID
		where arn = @arn 	
	end 
	if (@WorkflowOperation = 'Billing_RCOChecker_Submission')
	begin
		update aaIntDisbursementSubmission
		set RCOCheckerPDFID = @pdfID
		where arn = @arn 				
	end 
end 
GO
