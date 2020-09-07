/****** Object:  StoredProcedure [dbo].[usp_ws_DeleteK2File]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_DeleteK2File]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_DeleteK2File]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_DeleteK2File]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--[usp_deleterecords] '',''

CREATE   procedure [dbo].[usp_ws_DeleteK2File]
@pdfid bigint= null,
@error nvarchar(max) = null output
as
begin
	delete from K2DBSERVER.K2.dbo.PdfFile
	where id = @pdfid
	
end 
GO
