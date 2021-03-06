/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_Main_MoveToStaging]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmission_Main_MoveToStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmission_Main_MoveToStaging]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_Main_MoveToStaging]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_SQLValuerDPSubmission_Main_MoveToStaging]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin

	insert into SQLValuerDPSubmissionRemark_Staging
	select * from SQLValuerDPSubmissionRemark
	where arn = @arn

	insert into SQLValuerDPSubmission_Staging
	select * from SQLValuerDPSubmission
	where arn = @arn


	delete from SQLValuerDPSubmission
	where arn = @arn 

	delete from SQLValuerDPSubmissionRemark
	where arn = @arn 

end 
GO
