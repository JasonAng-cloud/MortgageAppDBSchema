/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_ForcePasswordChangeCheck]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorLogin_ForcePasswordChangeCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorLogin_ForcePasswordChangeCheck]
GO
/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_ForcePasswordChangeCheck]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_SolicitorLogin_ForcePasswordChangeCheck]
@scode nvarchar(100) = null,
@error nvarchar(max) = null output 
as
begin
	set @error = ''
	if exists 
	(
		select 1 from sqlsolicitor
		where solicitorcode = @scode
			and passwordforcereset = 'Yes'
	)
	begin
		set @error = '1'
	end	

end 
GO
