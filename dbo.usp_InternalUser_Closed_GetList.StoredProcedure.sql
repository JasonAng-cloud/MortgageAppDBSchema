/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Closed_GetList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_Closed_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_Closed_GetList]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Closed_GetList]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE   procedure [dbo].[usp_InternalUser_Closed_GetList]
  as
  begin
		select [UserName]
      ,[UserEmail]
      ,[UserFullName]
      ,[Branch]
      ,[LastLoginDatetime]
     -- ,[Status]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[IDLastLockedDatetime]
	 -- ,case when [IDLastLockedDatetime] is not null then 'True' else '' end as [DormantAccount]
	 -- ,case when [IDLastLockedDatetime] is null then 'True' else '' end as [FailedLoginAccount]
	 ,remarks
	from InternalUser
	where status = 'Closed'
  end
GO
