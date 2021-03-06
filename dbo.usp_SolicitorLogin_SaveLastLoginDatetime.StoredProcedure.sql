/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_SaveLastLoginDatetime]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorLogin_SaveLastLoginDatetime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorLogin_SaveLastLoginDatetime]
GO
/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_SaveLastLoginDatetime]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_SolicitorLogin_SaveLastLoginDatetime]
@solicitorcode nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	set @error = ''
	
	update SQLSolicitor
	set SolicitorLastLoginDatetime = getdate()
	where SolicitorCode = @solicitorcode

end 
GO
