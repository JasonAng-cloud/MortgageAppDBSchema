/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDPSubmissionExeDocs_SelectAll]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_SQLSolicitorDPSubmissionExeDocs_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_SQLSolicitorDPSubmissionExeDocs_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDPSubmissionExeDocs_SelectAll]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[aaa_SQLSolicitorDPSubmissionExeDocs_SelectAll]
as
begin

	select * 
	from SQLSolicitorDPSubmissionExeDocs

end 
GO
