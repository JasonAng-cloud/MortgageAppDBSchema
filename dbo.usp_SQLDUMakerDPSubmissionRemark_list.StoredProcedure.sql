/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmissionRemark_list]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmissionRemark_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmissionRemark_list]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmissionRemark_list]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   procedure [dbo].[usp_SQLDUMakerDPSubmissionRemark_list]
@arn nvarchar(100) null 
as
begin
	select *
	from SQLDUMakerDP_SolicitorSubmissionRemark
	where arn = @arn 

end 




GO
