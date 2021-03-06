/****** Object:  StoredProcedure [dbo].[usp_updatePDFID]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_updatePDFID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_updatePDFID]
GO
/****** Object:  StoredProcedure [dbo].[usp_updatePDFID]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_updatePDFID]
@arn nvarchar(100),
@pdfID bigint,
@WorkflowOperation nvarchar(1000)
as
begin
	if (@WorkflowOperation = 'DPValuerSubmission')
	begin
		update SQLValuerDPSubmission_staging
		set OutputPDFID = @pdfID
		where arn = @arn 
	end 

	if (@WorkflowOperation = 'DPSolicitorSubmission')
	begin
		update SQLSolicitorDPSubmission_staging
		set OutputPDFID = @pdfID
		where arn = @arn 
	end 

	if (@WorkflowOperation = 'DisbursementSolicitorSubmission')
	begin
		update aaSolDisbursementSubmission_staging
		set SolicitorSubmissionPDFID = @pdfID
		where arn = @arn 
	end 
	/* 20200813 pdf if update not required for internal users
	if (@WorkflowOperation = 'DisbursementDisMakerSubmission')
	begin
		update aaSolDisbursementSubmission
		set DisbursementMakerSubmissionPDFID = @pdfID
		where arn = @arn 
	end 

	if (@WorkflowOperation = 'DisbursementDisCheckerSubmission')
	begin
		update aaSolDisbursementSubmission
		set DisbursementCheckerPDFID = @pdfID
		where arn = @arn 
	end 

	if (@WorkflowOperation = 'DisbursementRCOMakerSubmission')
	begin
		update aaSolDisbursementSubmission
		set RCOMakerPDFID = @pdfID
		where arn = @arn 
	end 

	if (@WorkflowOperation = 'DisbursementRCOCheckerSubmission')
	begin
		update aaSolDisbursementSubmission
		set RCOCheckerPDFID = @pdfID
		where arn = @arn 
	end 
	*/
	
end 


GO
