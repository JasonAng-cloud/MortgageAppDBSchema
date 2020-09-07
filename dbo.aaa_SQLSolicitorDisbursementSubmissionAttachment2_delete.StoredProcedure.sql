/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_delete]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_delete]
GO
/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_delete]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_delete]
@solicitoremail nvarchar(100) = null,
@arn nvarchar(100) = null
as
begin

	delete from dbo.aaSolicitorDisbursementSubmissionAttachment
	where arn = @arn 
		and solicitorcode = @solicitoremail

end 






GO
