/****** Object:  StoredProcedure [dbo].[usp_CheckAndUpdateExtUserStatusForExpiredPassword]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_CheckAndUpdateExtUserStatusForExpiredPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_CheckAndUpdateExtUserStatusForExpiredPassword]
GO
/****** Object:  StoredProcedure [dbo].[usp_CheckAndUpdateExtUserStatusForExpiredPassword]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_CheckAndUpdateExtUserStatusForExpiredPassword]
as
begin
	update SQLSolicitor
	set PasswordForceReset = 'Yes'
	where CONVERT(DATETIME, CONVERT(DATE, PasswordExpiryDate)) < getdate()

	update SQLValuer 
	set PasswordForceReset = 'Yes'
	where CONVERT(DATETIME, CONVERT(DATE, PasswordExpiryDate)) < getdate()
end 
GO
