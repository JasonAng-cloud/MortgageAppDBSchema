/****** Object:  StoredProcedure [dbo].[test_usercontexta]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test_usercontexta]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[test_usercontexta]
GO
/****** Object:  StoredProcedure [dbo].[test_usercontexta]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[test_usercontexta]
as
begin
	DECLARE @user nvarchar(128);
	SET @user = dbo.GetContextUser();

	insert into test_usercontext
	values (@user)

end 
GO
