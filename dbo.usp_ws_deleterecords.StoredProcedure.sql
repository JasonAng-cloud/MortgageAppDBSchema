/****** Object:  StoredProcedure [dbo].[usp_ws_deleterecords]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_deleterecords]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_deleterecords]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_deleterecords]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--[usp_deleterecords] '',''

CREATE procedure [dbo].[usp_ws_deleterecords]
@arn nvarchar(100) = null,
@workflow nvarchar(100) = null,
@error nvarchar(max) = null output
as
begin
	set @error = ''
	delete from attachment_staging 
	where arn = @arn 
		and workflow = @workflow 

	
	
end 
GO
