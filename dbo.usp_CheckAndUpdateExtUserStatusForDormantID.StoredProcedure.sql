/****** Object:  StoredProcedure [dbo].[usp_CheckAndUpdateExtUserStatusForDormantID]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_CheckAndUpdateExtUserStatusForDormantID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_CheckAndUpdateExtUserStatusForDormantID]
GO
/****** Object:  StoredProcedure [dbo].[usp_CheckAndUpdateExtUserStatusForDormantID]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_CheckAndUpdateExtUserStatusForDormantID]
as
begin
	declare @SolicitorDormantIDReportPeriodInDays int 
	select @SolicitorDormantIDReportPeriodInDays = SolicitorDormantIDReportPeriodInDays
	from settings 
		
	update SQLSolicitor
	set status = 'Inactive',
		IDLastLockedDatetime = getdate()
	--where DATEADD(DAY, @SolicitorDormantIDReportPeriodInDays, SolicitorLastLoginDatetime) < getdate() 
	where CONVERT(DATETIME, CONVERT(DATETIME, DATEADD(DAY, @SolicitorDormantIDReportPeriodInDays, SolicitorLastLoginDatetime))) < getdate() 
		and IDLastLockedDatetime is null 

	declare @ValuerDormantIDReportPeriodInDays int 
	select @ValuerDormantIDReportPeriodInDays = ValuerDormantIDReportPeriodInDays
	from settings 

	update SQLValuer 
	set status = 'Inactive',
		IDLastLockedDatetime = getdate()
	--where DATEADD(DAY, @ValuerDormantIDReportPeriodInDays, ValuerLastLoginDatetime) < getdate() 
	where CONVERT(DATETIME, CONVERT(DATETIME, DATEADD(DAY, @ValuerDormantIDReportPeriodInDays, ValuerLastLoginDatetime))) < getdate()
		and IDLastLockedDatetime is null 
end 


GO
