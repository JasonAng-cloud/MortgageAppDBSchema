/****** Object:  StoredProcedure [dbo].[usp_ValuerLoginLog_List]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerLoginLog_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerLoginLog_List]
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuerLoginLog_List]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     procedure [dbo].[usp_ValuerLoginLog_List]
as
begin

	with cte1([ValuerCode], valueremail, UpdatedDate ) as (
	select [ValuerCode], valueremail, UpdatedDate 
	from sqlloads 
	where valueremail is not null or valueremail <> ''
	),
	cte2 (ValuerCode, UpdatedDate) as 
	(
		select ValuerCode, max(UpdatedDate) as UpdatedDate
		from cte1 
		group by ValuerCode		
	),	
	cte3 (ValuerCode,ValuerEmail) as (
	select cte1.ValuerCode,max(cte1.ValuerEmail)
		from cte1 
		inner join cte2 on cte2.ValuerCode = cte1.ValuerCode
			and cte2.UpdatedDate = cte1.UpdatedDate	
		group by cte1.ValuerCode
	),
	cte4 ([Action],UserName,LogDatetime ) as
	(
		select 'Logout' as [Action],
		UserName, 
		logoutDatetime as LogDatetime
		from ValuerLogoutLog
		union 
		select 'Login' as [Action],
			UserName, 
			loginDatetime as LogDatetime
		from ValuerUserLoginLog
	)
	select [Action]
		,a.UserName as [ValuerCode]
      ,a.LogDatetime as LogDatetime      
	   ,[Status]
      ,[ValuerName]     
      ,[ValuerLastLoginDatetime]
      ,[PasswordForceReset]
      ,[PasswordExpiryDate]
      ,[PasswordExpiryWarningDate]
      ,[IDLastLockedDatetime]
	  ,cte3.ValuerEmail as ValuerEmail
	from cte4 a 
	inner join SQLValuer s on s.[ValuerCode] = a.UserName
	left join cte3 on cte3.ValuerCode = s.ValuerCode
	order by a.LogDatetime desc 

end 
GO
