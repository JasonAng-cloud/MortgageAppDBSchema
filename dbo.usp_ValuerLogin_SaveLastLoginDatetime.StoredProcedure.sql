/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_SaveLastLoginDatetime]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerLogin_SaveLastLoginDatetime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerLogin_SaveLastLoginDatetime]
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_SaveLastLoginDatetime]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_ValuerLogin_SaveLastLoginDatetime]
@valuercode nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	set @error = ''
	
	update SQLValuer
	set ValuerLastLoginDatetime = getdate()
	where ValuerCode = @valuercode

end 
GO
