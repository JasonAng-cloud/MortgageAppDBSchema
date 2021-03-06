/****** Object:  StoredProcedure [dbo].[usp_ws_SQLSolicitorDPSubmissionAttachment_add_withattachment]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SQLSolicitorDPSubmissionAttachment_add_withattachment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SQLSolicitorDPSubmissionAttachment_add_withattachment]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_SQLSolicitorDPSubmissionAttachment_add_withattachment]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   procedure [dbo].[usp_ws_SQLSolicitorDPSubmissionAttachment_add_withattachment]
@solicitoremail nvarchar(100),
@arn nvarchar(100) ,
@Attachment nvarchar(max) = null
as
begin

	declare @AttachmentID int , @proceed int 
	set @proceed = 1
	--set @AttachmentID = REPLACE(@ExeDocName, ' ', '')

	/*
	delete from dbo.SQLSolicitorDPSubmissionAttachment
	where arn = @arn 
		and solicitoremail = @solicitoremail
	*/
	if (@Attachment = '' or @Attachment <> '<file><name>scnull</name><content>scnull</content></file>' or @Attachment = null)
	begin
		set @proceed = 0
	end 

	if (@proceed = 1)
	begin 
		
		if not exists 
		(
			select 1 
			from dbo.SQLSolicitorDPSubmissionAttachment2
			where solicitorcode = @solicitoremail 
				and arn = @arn 
				--and Attachment = @Attachment				
		)
		begin
			set @AttachmentID = 1
			/*
			insert into dbo.SQLSolicitorDPSubmissionAttachment2 
				(arn, solicitorcode,AttachmentID, createddate , Attachment)
			values (@arn,@solicitoremail,@AttachmentID, @CreatedDate  , @Attachment)
			*/
			insert into dbo.SQLSolicitorDPSubmissionAttachment2 
				(arn, solicitorcode,AttachmentID, createddate ) 			
			values (@arn,@solicitoremail,@AttachmentID, getdate() )
		end 
		else
		begin 
			select @AttachmentID =  max(AttachmentID) 
			from SQLSolicitorDPSubmissionAttachment2
			where solicitorcode = @solicitoremail 
				and arn = @arn 

			set @AttachmentID = @AttachmentID + 1

			/*
			insert into dbo.SQLSolicitorDPSubmissionAttachment2 
				(arn, solicitorcode,AttachmentID, createddate,  Attachment)
			values (@arn,@solicitoremail,@AttachmentID, @CreatedDate,  @Attachment  )
			*/

			insert into dbo.SQLSolicitorDPSubmissionAttachment2 
				(arn, solicitorcode,AttachmentID, createddate)
			values (@arn,@solicitoremail,@AttachmentID, getdate()  )

		end 

		select @AttachmentID as AttachmentID
	end  
end 




GO
