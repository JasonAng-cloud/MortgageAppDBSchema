/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmissionRemark_add]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmissionRemark_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmissionRemark_add]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmissionRemark_add]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   procedure [dbo].[usp_SQLDUMakerDPSubmissionRemark_add]
@DUMakerEmail nvarchar(100),
@arn nvarchar(100) ,
@Remark nvarchar(max) = null,
@CreatedDate datetime 
as
begin

	declare @RemarkID int 

	set @Remark = ltrim(rtrim(@Remark))

	if (@Remark <> '')
	begin 
		
		if not exists 
		(
			select 1 
			from dbo.SQLDUMakerDP_SolicitorSubmissionRemark
			where arn = @arn 				
		)
		begin
			insert into dbo.SQLDUMakerDP_SolicitorSubmissionRemark (arn, DUMakerEmail,remark,createddate, remarkid)
			values (@arn,@DUMakerEmail,@Remark,@CreatedDate, 1  )
		end 
		else
		begin
			if not exists 
			(
				select 1 
				from dbo.SQLDUMakerDP_SolicitorSubmissionRemark
				where 					
					arn = @arn 
					and remark = @Remark					
			)
			begin
				select @RemarkID =  max(RemarkID) 
				from SQLDUMakerDP_SolicitorSubmissionRemark
				where 					
					arn = @arn 

				set @RemarkID = @RemarkID + 1

				insert into dbo.SQLDUMakerDP_SolicitorSubmissionRemark (arn, DUMakerEmail,remark,createddate, remarkid)
				values (@arn,@DUMakerEmail,@Remark,@CreatedDate ,@RemarkID )
			end
		end
			
	end  





end 




GO
