/****** Object:  StoredProcedure [dbo].[usp_ws_SQLValuerDPSubmission_ListUploadedARN]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SQLValuerDPSubmission_ListUploadedARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SQLValuerDPSubmission_ListUploadedARN]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_SQLValuerDPSubmission_ListUploadedARN]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[usp_ws_SQLValuerDPSubmission_ListUploadedARN]
as
begin

	select arn 	
	from SQLValuerDPSubmission_Staging 
	where arn not in (select arn from SQLValuerDPSubmission)	
		and OutputPDFID is not null and OutputPDFID <> 0
		and [status] <> 'UpdateInfo' and [status] <> 'LowerOMV' and [status] <> 'Cancelled'
	--group by arn
	
end 
GO
