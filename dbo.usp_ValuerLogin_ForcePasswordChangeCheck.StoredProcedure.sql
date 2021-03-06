/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_ForcePasswordChangeCheck]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerLogin_ForcePasswordChangeCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerLogin_ForcePasswordChangeCheck]
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_ForcePasswordChangeCheck]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_ValuerLogin_ForcePasswordChangeCheck]
@vcode nvarchar(100) = null,
@error nvarchar(max) = null output 
as
begin
	set @error = ''
	if exists 
	(
		select 1 from sqlvaluer
		where valuercode = @vcode
			and passwordforcereset = 'Yes'
	)
	begin
		set @error = '1'
	end	

end 
GO
