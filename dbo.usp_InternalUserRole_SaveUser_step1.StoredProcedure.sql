/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SaveUser_step1]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SaveUser_step1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SaveUser_step1]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SaveUser_step1]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     procedure [dbo].[usp_InternalUserRole_SaveUser_step1]
@UserName nvarchar(max) = null ,
@LoginUserEmail nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	set @Error = ''

	delete from UserRoleMetric
	where username = @username 
end 
GO
