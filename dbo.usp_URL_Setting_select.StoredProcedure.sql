/****** Object:  StoredProcedure [dbo].[usp_URL_Setting_select]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_URL_Setting_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_URL_Setting_select]
GO
/****** Object:  StoredProcedure [dbo].[usp_URL_Setting_select]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE procedure [dbo].[usp_URL_Setting_select] 
  @Type nvarchar(max) = null
  as
  begin
	select Type, URL
	from URL_Setting
	where type = @Type
  end 
GO
