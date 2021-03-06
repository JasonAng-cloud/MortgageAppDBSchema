/****** Object:  StoredProcedure [dbo].[usp_EAM_ExternalUsers]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_EAM_ExternalUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_EAM_ExternalUsers]
GO
/****** Object:  StoredProcedure [dbo].[usp_EAM_ExternalUsers]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_EAM_ExternalUsers]
as
begin
	select 
		solicitorcode as LoginID, 
		SolicitorName as Name, 
		'true' as SolicitorAccess, 
		 'false' as ValuerAccess
	from sqlsolicitor 
	union all
	select
		valuercode as LoginID, 
		ValuerName as Name, 
		'false' as SolicitorAccess, 
		 'true' as ValuerAccess
	from sqlValuer 
end 
GO
