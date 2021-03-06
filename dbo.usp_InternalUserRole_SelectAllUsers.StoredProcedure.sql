/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectAllUsers]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SelectAllUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SelectAllUsers]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectAllUsers]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     procedure [dbo].[usp_InternalUserRole_SelectAllUsers]
as
begin

	SELECT r.[UserRoleID]
      ,r.[UserRoleName]
      ,r.[UserRoleDescription]
      ,r.[IsDUMakerDocumentation]
      ,r.[IsDUMakerValuation]
      ,r.[IsMortgageAdmin]
      ,r.[IsITAdminApplication]
      ,r.[IsITAdminSecurity]
      ,r.[IsDisbMaker]
      ,r.[IsDisbChecker]
      ,r.[IsRCOMaker]
      ,r.[IsRCOChecker]
      ,r.[IsTBOMaker]
      ,r.[IsTBOChecker]
	  , isnull(r.CreatedDate,'1900-01-01') as RoleCreatedDate
	  , isnull(r.UpdatedDate,'1900-01-01') as RoleUpdatedDate
	  , r.CreatedUser as RoleCreatedUser
	  , r.UpdatedUser as RoleUpdatedUser
	  ,u.[UserName]
      ,u.[UserEmail]
      ,u.[UserFullName]
      ,u.[Branch]
      ,isnull(u.[LastLoginDatetime],'1900-01-01') as LastLoginDatetime
      ,u.[Status]
      ,isnull(u.[CreatedDate],'1900-01-01') as CreatedDate
      ,isnull(u.[UpdatedDate],'1900-01-01') as UpdatedDate
      ,isnull(u.[IDLastLockedDatetime],'1900-01-01')  as IDLastLockedDatetime
  FROM [dbo].[InternalUserRole] r
	inner join UserRoleMetric m on m.userroleid = r.userroleid 
	inner join InternalUser u on u.username = m.username


end 
GO
