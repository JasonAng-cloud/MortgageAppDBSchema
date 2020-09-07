/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmissionRemark_list]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmissionRemark_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmissionRemark_list]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmissionRemark_list]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



  CREATE   procedure [dbo].[usp_SQLValuerDPSubmissionRemark_list] 
  @arn nvarchar(max) = null
  as
  begin
	SELECT [ARN]
		,[ValuerCode]
		,[RemarkID]
		,[Remark]
		,[CreatedDate]
	FROM [dbo].[SQLValuerDPSubmissionRemark]
	where arn = @arn 
		--and valuercode = @valuercode 
  end 
GO
