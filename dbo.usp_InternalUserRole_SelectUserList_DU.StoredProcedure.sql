/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectUserList_DU]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SelectUserList_DU]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SelectUserList_DU]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectUserList_DU]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_InternalUserRole_SelectUserList_DU]
as
begin
	select distinct username 
	from UserRoleMetric 		
	where UserRoleID in 
	(select userroleid 
  FROM [dbo].[InternalUserRole]
  where IsDUMakerDocumentation = 1) 
end 

GO
