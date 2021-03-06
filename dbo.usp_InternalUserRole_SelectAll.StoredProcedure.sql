/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectAll]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectAll]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_InternalUserRole_SelectAll]
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
	  , CreatedDate
	  , UpdatedDate
	  , CreatedUser
	  , UpdatedUser
  FROM [dbo].[InternalUserRole]
end 
GO
