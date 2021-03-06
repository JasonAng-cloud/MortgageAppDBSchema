/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionREFDoc_add]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmissionREFDoc_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmissionREFDoc_add]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionREFDoc_add]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_SQLSolicitorDPSubmissionREFDoc_add]
@solicitoremail nvarchar(100),
@arn nvarchar(100) ,
@RefDocNameDesc nvarchar(max),
@CreatedDate date = null
as
begin

	declare @RefDocName varchar(1000)
	set @RefDocName = REPLACE(@RefDocNameDesc, ' ', '')

	/*
	delete from dbo.SQLSolicitorDPSubmissionRefDocs
	where arn = @arn 
		and solicitoremail = @solicitoremail
	*/

	if (@RefDocName <> '')
	begin 
		
		if not exists 
		(
			select 1 
			from dbo.SQLSolicitorDPSubmissionRefDocs
			where solicitorcode = @solicitoremail 
				and arn = @arn 
				and RefDocNameID = @RefDocName				
		)
		begin
			insert into dbo.SQLSolicitorDPSubmissionRefDocs (arn, solicitorcode,RefDocNameID,RefDocNameDesc, createddate)
			values (@arn,@solicitoremail,@RefDocName,@RefDocNameDesc, @CreatedDate  )
		end 
	end  
end 




GO
