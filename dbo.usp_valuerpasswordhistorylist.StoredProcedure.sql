/****** Object:  StoredProcedure [dbo].[usp_valuerpasswordhistorylist]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_valuerpasswordhistorylist]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_valuerpasswordhistorylist]
GO
/****** Object:  StoredProcedure [dbo].[usp_valuerpasswordhistorylist]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_valuerpasswordhistorylist]
@valuercode nvarchar(100) = null, 
@error nvarchar(max) = null output
as
begin
	declare @count int , @ValuerLoginPasswordHistoryCount int 

	select @count = ValuerLoginPasswordHistoryCount,
		@ValuerLoginPasswordHistoryCount = ValuerLoginPasswordHistoryCount
	from settings 

	select top (@count) * , @ValuerLoginPasswordHistoryCount as ValuerLoginPasswordHistoryCount
	from ValuerPasswordHistory 
	where valuercode = @valuercode
	order by createddate desc 
end 

GO
