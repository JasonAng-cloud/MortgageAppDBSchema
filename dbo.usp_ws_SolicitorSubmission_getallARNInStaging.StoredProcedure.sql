/****** Object:  StoredProcedure [dbo].[usp_ws_SolicitorSubmission_getallARNInStaging]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SolicitorSubmission_getallARNInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SolicitorSubmission_getallARNInStaging]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_SolicitorSubmission_getallARNInStaging]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_ws_SolicitorSubmission_getallARNInStaging]
as
begin
	select arn from SQLSolicitorDPSubmission_staging 
	where OutputPDFID is not null and OutputPDFID <> 0
		and [status] <> 'UpdateInfo'
end 
GO
