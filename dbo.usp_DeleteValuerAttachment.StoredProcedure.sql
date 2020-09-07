/****** Object:  StoredProcedure [dbo].[usp_DeleteValuerAttachment]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteValuerAttachment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DeleteValuerAttachment]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteValuerAttachment]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_DeleteValuerAttachment]
@arn nvarchar(max) =null,
@output nvarchar(max) = null output
as
begin
	
	set @output = ''

	update SQLValuerDPSubmission
	set ValuerReportAttachment = null 
	where arn = @arn 

end 
GO
