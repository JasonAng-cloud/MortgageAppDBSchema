/****** Object:  StoredProcedure [dbo].[aa_ws_SolDisbursementSubmission_GetPreviousDUMaker]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_SolDisbursementSubmission_GetPreviousDUMaker]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_SolDisbursementSubmission_GetPreviousDUMaker]
GO
/****** Object:  StoredProcedure [dbo].[aa_ws_SolDisbursementSubmission_GetPreviousDUMaker]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE          procedure [dbo].[aa_ws_SolDisbursementSubmission_GetPreviousDUMaker]
@arn nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin	
	set @Error = ''

	select arn,
		DisbursementMakerEmailAddress
	from aaSolDisbursementSubmission_DisMakerRejected
	where arn = @arn 

	
end 
GO
