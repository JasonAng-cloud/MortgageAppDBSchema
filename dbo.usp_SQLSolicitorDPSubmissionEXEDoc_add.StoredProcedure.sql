/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_add]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_add]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_add]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_add]
@solicitoremail nvarchar(100),
@arn nvarchar(100) ,
@ExeDocNameDesc nvarchar(max),
@CreatedDate date = null
as
begin

	declare @ExeDocName varchar(1000)
	set @ExeDocName = REPLACE(@ExeDocNameDesc, ' ', '')

	/*
	delete from dbo.SQLSolicitorDPSubmissionExeDocs
	where arn = @arn 
		and solicitoremail = @solicitoremail
	*/

	if (@ExeDocName <> '')
	begin 
		
		if not exists 
		(
			select 1 
			from dbo.SQLSolicitorDPSubmissionExeDocs
			where solicitorcode = @solicitoremail 
				and arn = @arn 
				and ExeDocNameID = @ExeDocName				
		)
		begin
			insert into dbo.SQLSolicitorDPSubmissionExeDocs (arn, solicitorcode,ExeDocNameID,ExeDocNameDesc, createddate)
			values (@arn,@solicitoremail,@ExeDocName,@ExeDocNameDesc, @CreatedDate  )
		end 
	end  
end 




GO
