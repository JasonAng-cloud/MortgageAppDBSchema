/****** Object:  StoredProcedure [dbo].[usp_WorkflowHistory_GetWorkflowHistoryByARN]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_WorkflowHistory_GetWorkflowHistoryByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_WorkflowHistory_GetWorkflowHistoryByARN]
GO
/****** Object:  StoredProcedure [dbo].[usp_WorkflowHistory_GetWorkflowHistoryByARN]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_WorkflowHistory_GetWorkflowHistoryByARN]
@arn nvarchar(max) = null , 
@workflow nvarchar(max) = null ,
@error nvarchar(max) = null output
as
begin
	
	
	SELECT [Workflow]
      ,[ARN]
      ,[Status]
      ,[WorkflowOwner]
      ,[AssignedBy]
      ,[CreatedDatetime]
	from WorkflowHistory
	where workflow = @workflow 
		and arn = @arn 			
	 

	
end 
GO
