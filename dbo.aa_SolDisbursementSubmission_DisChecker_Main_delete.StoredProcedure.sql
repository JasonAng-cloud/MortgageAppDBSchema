/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_Main_delete]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisChecker_Main_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisChecker_Main_delete]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_Main_delete]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[aa_SolDisbursementSubmission_DisChecker_Main_delete]
@arn nvarchar(100) = null 
as
begin
	update aaSolDisbursementSubmission
	set DisbursementCheckerEmailAddress = null,
		DisbursementCheckerDecision = null, 
		DisbursementCheckerSubmissionCompleted = null, 
		DisbursementCheckerRejectionReason = null, 
		DisbursementCheckerSubmissionDate = null,
		DisbursementCheckerPDFID = null
	where arn = @arn 
end 
GO
