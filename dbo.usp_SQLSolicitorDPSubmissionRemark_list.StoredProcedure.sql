/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionRemark_list]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmissionRemark_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmissionRemark_list]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionRemark_list]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  CREATE   procedure [dbo].[usp_SQLSolicitorDPSubmissionRemark_list] 
  @arn nvarchar(max) = null    
  as
  begin
	SELECT [ARN]
		,[SolicitorCode]
		,[RemarkID]
		,[Remark]
		,[CreatedDate]
	FROM [dbo].[SQLSolicitorDPSubmissionRemark]
	where arn = @arn 
		--and [SolicitorCode] = @solcode 
  end 
GO
