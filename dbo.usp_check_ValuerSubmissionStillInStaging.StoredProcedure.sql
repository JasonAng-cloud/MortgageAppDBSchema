/****** Object:  StoredProcedure [dbo].[usp_check_ValuerSubmissionStillInStaging]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_check_ValuerSubmissionStillInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_check_ValuerSubmissionStillInStaging]
GO
/****** Object:  StoredProcedure [dbo].[usp_check_ValuerSubmissionStillInStaging]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_check_ValuerSubmissionStillInStaging]
@arn nvarchar(100) = null ,
@error nvarchar(100) = null output
as
begin
	set @error = ''
	if exists 
	(
		select 1
		from SQLValuerDPSubmissionRemark_Staging
		where arn = @arn 
	)
	begin
		set @error = '1'
	end 
end 
GO
