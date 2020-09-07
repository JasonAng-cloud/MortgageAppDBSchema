/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionExeDocs_select]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionExeDocs_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionExeDocs_select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionExeDocs_select]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionExeDocs_select]
@ARN varchar(100)
as
begin

SELECT [ARN]
      ,[SolicitorCode]
      ,[ExeDocNameID]
      ,[ExeDocNameDesc]
      ,[CreatedDate]
	from SQLSolicitorDPSubmissionExeDocs
	where arn = @arn

end


GO
