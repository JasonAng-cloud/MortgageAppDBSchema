/****** Object:  StoredProcedure [dbo].[usp_wf_ConvertFormToPDF_GetURL]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_wf_ConvertFormToPDF_GetURL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_wf_ConvertFormToPDF_GetURL]
GO
/****** Object:  StoredProcedure [dbo].[usp_wf_ConvertFormToPDF_GetURL]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE procedure [dbo].[usp_wf_ConvertFormToPDF_GetURL]
  @Type nvarchar(max) = null, 
  @URL nvarchar(max) = null output 
  as
  begin
	select @URL = URL
	from URL_Setting
	where type = @Type
  end 
GO
