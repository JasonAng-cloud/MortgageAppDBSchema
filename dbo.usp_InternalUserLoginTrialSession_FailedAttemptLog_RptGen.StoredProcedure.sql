/****** Object:  StoredProcedure [dbo].[usp_InternalUserLoginTrialSession_FailedAttemptLog_RptGen]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserLoginTrialSession_FailedAttemptLog_RptGen]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserLoginTrialSession_FailedAttemptLog_RptGen]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUserLoginTrialSession_FailedAttemptLog_RptGen]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     procedure [dbo].[usp_InternalUserLoginTrialSession_FailedAttemptLog_RptGen]
as
begin
	select a.username as username
      ,a.[loginDatetime] as [loginDatetime]
      ,a.[CreatedDate] as [CreatedDate]
	  ,[UserEmail]
      ,[UserFullName]
      ,[Branch]
      ,[LastLoginDatetime]
      ,[Status]     
      ,[IDLastLockedDatetime]
	from InternalUserLoginTrialSession_FailedAttemptLog a 
	inner join InternalUser u on u.UserName = a.username 
	order by loginDatetime desc 
end 

GO
