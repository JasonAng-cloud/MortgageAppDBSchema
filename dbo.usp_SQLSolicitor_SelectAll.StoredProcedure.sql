/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitor_SelectAll]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitor_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitor_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitor_SelectAll]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_SQLSolicitor_SelectAll]
as
begin

	select *
	from SQLSolicitor

end 
GO
