/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_GetCurrentPassword]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLValuer_GetCurrentPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLValuer_GetCurrentPassword]
GO
/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_GetCurrentPassword]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_Maintenance_SQLValuer_GetCurrentPassword]
@ValuerCode nvarchar(max) = null ,
@ValuerCurrentPassword nvarchar(max) = null output,
@error nvarchar(max) = null output
as
begin
	set @error = ''

	select @ValuerCurrentPassword = ValuerPassword
	from sqlvaluer 
	where valuerCode = @ValuerCode
end 
GO
