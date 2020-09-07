/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_GetGeneralSessionInSecond]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_Session_GetGeneralSessionInSecond]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_Session_GetGeneralSessionInSecond]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_GetGeneralSessionInSecond]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_InternalUser_Session_GetGeneralSessionInSecond]
@TimeInSecond bigint = null output 
as
begin	
	declare @InternalUserSessionInMinutes int

	select @InternalUserSessionInMinutes = InternalUserSessionInMinutes		
	from settings 

	set @TimeInSecond = @InternalUserSessionInMinutes * 60000 

end 

GO
