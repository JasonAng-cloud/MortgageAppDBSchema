/****** Object:  StoredProcedure [dbo].[usp_InternalUserLoginTrial]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserLoginTrial]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserLoginTrial]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUserLoginTrial]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_InternalUserLoginTrial]
as
begin
	select *
	from 
	(
	select 'Login' as [Action],
		UserName, 
		logoutDatetime as LogDatetime
	from InternalUserLogoutLog
	union 
	select 'Login' as [Action],
		UserName, 
		loginDatetime as LogDatetime
	from InternalUserLoginLog
	) tbl
	order by LogDatetime desc
end 

GO
