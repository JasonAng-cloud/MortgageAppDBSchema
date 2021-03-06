/****** Object:  StoredProcedure [dbo].[usp_solicitorpasswordhistorylist]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_solicitorpasswordhistorylist]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_solicitorpasswordhistorylist]
GO
/****** Object:  StoredProcedure [dbo].[usp_solicitorpasswordhistorylist]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_solicitorpasswordhistorylist]
@solicitorcode nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	declare @count int , @SolicitorLoginPasswordHistoryCount int 

	select @count = SolicitorLoginPasswordHistoryCount,
		@SolicitorLoginPasswordHistoryCount = SolicitorLoginPasswordHistoryCount
	from settings 

	select top (@count) * , @SolicitorLoginPasswordHistoryCount as SolicitorLoginPasswordHistoryCount
	from SolicitorPasswordHistory 
	where solicitorcode = @solicitorcode
	order by createddate desc 
end 
GO
