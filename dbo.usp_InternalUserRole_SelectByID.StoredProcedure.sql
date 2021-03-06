/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectByID]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SelectByID]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectByID]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_InternalUserRole_SelectByID]
@UserRoleID int =null ,
@Output nvarchar(max) =null output 
as
begin

	SELECT [UserRoleID]
      ,[UserRoleName]
      ,[UserRoleDescription]
      ,[IsDUMakerDocumentation]
      ,[IsDUMakerValuation]
      ,[IsMortgageAdmin]
      ,[IsITAdminApplication]
      ,[IsITAdminSecurity]
      ,[IsDisbMaker]
      ,[IsDisbChecker]
      ,[IsRCOMaker]
      ,[IsRCOChecker]
      ,[IsTBOMaker]
      ,[IsTBOChecker]
  FROM [dbo].[InternalUserRole]
  where [UserRoleID] = @UserRoleID
end 
GO
