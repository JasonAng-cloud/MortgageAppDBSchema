/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_ExeDocs_Select_ARN_Rejected]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_SolicitorSubmission_ExeDocs_Select_ARN_Rejected]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_SolicitorSubmission_ExeDocs_Select_ARN_Rejected]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_ExeDocs_Select_ARN_Rejected]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_ExeDocs_Select_ARN_Rejected]
@arn nvarchar(max)
as
begin

SELECT [ARN]
      ,[SolicitorCode]
      ,[ExeDocNameID]
      ,[ExeDocNameDesc]
      ,[CreatedDate]
      ,[UpdatedDate]
  FROM [dbo].[SQLDUMakerDP_SolicitorSubmission_ExeDocs_Rejected]
  where arn = @arn 

end 


GO
