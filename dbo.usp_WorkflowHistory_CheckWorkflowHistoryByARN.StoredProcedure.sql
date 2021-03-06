/****** Object:  StoredProcedure [dbo].[usp_WorkflowHistory_CheckWorkflowHistoryByARN]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_WorkflowHistory_CheckWorkflowHistoryByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_WorkflowHistory_CheckWorkflowHistoryByARN]
GO
/****** Object:  StoredProcedure [dbo].[usp_WorkflowHistory_CheckWorkflowHistoryByARN]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_WorkflowHistory_CheckWorkflowHistoryByARN]
@arn nvarchar(max) = null , 
@workflow nvarchar(max) = null ,
@error nvarchar(max) = null output
as
begin
	set @error = ''

	if (ltrim(rtrim(@arn)) = '' or @arn is null)
	begin
		set @error = 'Please enter CRA'
	end 

	if (@error = '')
	begin
		if not exists 
		(
			select 1
			from WorkflowHistory
			where workflow = @workflow 
				and arn = @arn 
		)
		begin
			set @error = 'No Record(s) found'
		end 		
	end 

	
end 
GO
