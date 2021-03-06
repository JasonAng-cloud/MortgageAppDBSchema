/****** Object:  StoredProcedure [dbo].[usp_InternalUser_CheckClosed]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_CheckClosed]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_CheckClosed]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUser_CheckClosed]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE   procedure [dbo].[usp_InternalUser_CheckClosed]
  @username nvarchar(max) = null 
  as
  begin
	if exists
	(
		select 1
		from InternalUser
		where [Status] = 'Closed'
			and UserName = @username			
	)
	begin
		select '1' as result 
	end 
	else
	begin
		select '0' as result 
	end 
  end
GO
