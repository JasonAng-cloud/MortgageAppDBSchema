/****** Object:  StoredProcedure [dbo].[usp_dynamicqueryExecution_GetResult]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dynamicqueryExecution_GetResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_dynamicqueryExecution_GetResult]
GO
/****** Object:  StoredProcedure [dbo].[usp_dynamicqueryExecution_GetResult]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_dynamicqueryExecution_GetResult]
as
begin
	select * from DynamicQueryResultTable
end
GO
