/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_GetCurrentPassword]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_GetCurrentPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_GetCurrentPassword]
GO
/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_GetCurrentPassword]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   procedure [dbo].[usp_Maintenance_SQLSolicitor_GetCurrentPassword]
@SolicitorCode nvarchar(max) = null ,
@SolicitorCurrentPassword nvarchar(max) = null output,
@error nvarchar(max) = null output
as
begin
	set @error = ''

	select @SolicitorCurrentPassword = SolicitorPassword
	from sqlsolicitor 
	where SolicitorCode = @SolicitorCode
end 
GO
