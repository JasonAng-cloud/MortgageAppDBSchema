/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionAttachment_delete]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmissionAttachment_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmissionAttachment_delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionAttachment_delete]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_SQLSolicitorDPSubmissionAttachment_delete]
@solicitoremail nvarchar(100),
@arn nvarchar(100) 
as
begin

	delete from dbo.SQLSolicitorDPSubmissionAttachment2
	where arn = @arn 
		and solicitorcode = @solicitoremail

end 






GO
