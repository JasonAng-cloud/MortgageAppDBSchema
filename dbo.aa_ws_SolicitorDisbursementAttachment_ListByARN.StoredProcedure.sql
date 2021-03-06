/****** Object:  StoredProcedure [dbo].[aa_ws_SolicitorDisbursementAttachment_ListByARN]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_SolicitorDisbursementAttachment_ListByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_SolicitorDisbursementAttachment_ListByARN]
GO
/****** Object:  StoredProcedure [dbo].[aa_ws_SolicitorDisbursementAttachment_ListByARN]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[aa_ws_SolicitorDisbursementAttachment_ListByARN]
@arn nvarchar(max) = null ,
@SolicitorCode nvarchar(max) = null ,
@error nvarchar(max) = null output 
as
begin
	select [Attachment] as Attachment
	from [aaSolicitorDisbursementSubmissionAttachment]
	where ([Attachment] is not null or ltrim(rtrim([Attachment])) <> '' or [Attachment] = '<file><name>scnull</name><content>scnull</content></file>')
		and arn = @arn 
		and [SolicitorCode] = @SolicitorCode
	union 
	select CancelLoan_File as Attachment
	from aaSolDisbursementSubmission	
	where (CancelLoan_File is not null or ltrim(rtrim(CancelLoan_File)) <> '' or CancelLoan_File = '<file><name>scnull</name><content>scnull</content></file>')
		and arn = @arn 
		and [SolicitorCode] = @SolicitorCode 
end 
GO
