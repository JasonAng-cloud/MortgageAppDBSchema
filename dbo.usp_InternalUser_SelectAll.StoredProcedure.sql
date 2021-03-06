/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SelectAll]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SelectAll]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_InternalUser_SelectAll]
as
begin
	SELECT [UserName]
      ,[UserEmail]
      ,[UserFullName]
      ,[Branch]
      ,[LastLoginDatetime]
      ,[Status]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[IDLastLockedDatetime]
  FROM [dbo].[InternalUser]

end 

GO
