/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Password_Get]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_Update_Password_Get]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_Update_Password_Get]
GO
/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Password_Get]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_Admin_Solicitor_Update_Password_Get]
@SolicitorCode nvarchar(max)
as
begin

	select [Solicitorpassword] from sqlSolicitor
	where Solicitorcode = @SolicitorCode
	
end 


GO
