/****** Object:  StoredProcedure [dbo].[aa_ws_SolicitorDisbursementSubmission_getallARNInStaging]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_SolicitorDisbursementSubmission_getallARNInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_SolicitorDisbursementSubmission_getallARNInStaging]
GO
/****** Object:  StoredProcedure [dbo].[aa_ws_SolicitorDisbursementSubmission_getallARNInStaging]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE     procedure [dbo].[aa_ws_SolicitorDisbursementSubmission_getallARNInStaging]
as
begin
	select arn from aaSolDisbursementSubmission_staging 
end 
GO
