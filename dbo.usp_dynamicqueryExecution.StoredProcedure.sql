/****** Object:  StoredProcedure [dbo].[usp_dynamicqueryExecution]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dynamicqueryExecution]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_dynamicqueryExecution]
GO
/****** Object:  StoredProcedure [dbo].[usp_dynamicqueryExecution]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[usp_dynamicqueryExecution]
@query nvarchar(max) = null 
as
begin	
	exec(@query)
end
GO
