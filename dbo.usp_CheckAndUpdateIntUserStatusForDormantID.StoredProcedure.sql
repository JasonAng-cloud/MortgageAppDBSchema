/****** Object:  StoredProcedure [dbo].[usp_CheckAndUpdateIntUserStatusForDormantID]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_CheckAndUpdateIntUserStatusForDormantID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_CheckAndUpdateIntUserStatusForDormantID]
GO
/****** Object:  StoredProcedure [dbo].[usp_CheckAndUpdateIntUserStatusForDormantID]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   procedure [dbo].[usp_CheckAndUpdateIntUserStatusForDormantID]
as
begin
	declare @InternalUserDormantIDReportPeriodInDays int 
	select @InternalUserDormantIDReportPeriodInDays = InternalUserDormantIDReportPeriodInDays
	from settings 
		

	update InternalUser
	set status = 'Inactive',
		IDLastLockedDatetime = getdate()
	--where DATEADD(DAY, @InternalUserDormantIDReportPeriodInDays, LastLoginDatetime) < getdate() 
	where CONVERT(DATETIME, CONVERT(DATETIME, DATEADD(DAY, @InternalUserDormantIDReportPeriodInDays, LastLoginDatetime))) < getdate() 
		and IDLastLockedDatetime is null 

end 

GO
