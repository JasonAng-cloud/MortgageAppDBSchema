/****** Object:  StoredProcedure [dbo].[usp_SolicitorLoginLog_List]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorLoginLog_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorLoginLog_List]
GO
/****** Object:  StoredProcedure [dbo].[usp_SolicitorLoginLog_List]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     procedure [dbo].[usp_SolicitorLoginLog_List]
as
begin

	with cte1([SolicitorCode], solicitoremail, UpdatedDate ) as (
	select [SolicitorCode], solicitoremail, UpdatedDate 
	from sqlloads 
	where solicitoremail is not null or solicitoremail <> ''
	),
	cte2 (SolicitorCode, UpdatedDate) as 
	(
		select SolicitorCode, max(UpdatedDate) as UpdatedDate
		from cte1 
		group by [SolicitorCode]		
	),	
	cte3 (SolicitorCode,SolicitorEmail) as (
	select cte1.SolicitorCode,max(cte1.SolicitorEmail)
		from cte1 
		inner join cte2 on cte2.SolicitorCode = cte1.SolicitorCode
			and cte2.UpdatedDate = cte1.UpdatedDate	
		group by cte1.SolicitorCode
	),
	cte4 ([Action],UserName,LogDatetime ) as
	(
		select 'Logout' as [Action],
		UserName, 
		logoutDatetime as LogDatetime
		from SolicitorLogoutLog
		union 
		select 'Login' as [Action],
			UserName, 
			loginDatetime as LogDatetime
		from SolicitorUserLoginLog
	)
	select action, 
		a.UserName as [SolicitorCode]
      ,a.LogDatetime as LogDatetime      
	   ,[Status]
      ,[SolicitorName]     
      ,[SolicitorLastLoginDatetime]
      ,[PasswordForceReset]
      ,[PasswordExpiryDate]
      ,[PasswordExpiryWarningDate]
      ,[IDLastLockedDatetime]
	  ,cte3.SolicitorEmail as SolicitorEmail
	from cte4 a 
	inner join SQLSolicitor s on s.SolicitorCode = a.UserName
	left join cte3 on cte3.SolicitorCode = s.SolicitorCode
	order by a.LogDatetime desc 

end 
GO
