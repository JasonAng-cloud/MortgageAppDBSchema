/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmissionRemark_add]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmissionRemark_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmissionRemark_add]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmissionRemark_add]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   procedure [dbo].[usp_SQLValuerDPSubmissionRemark_add]
@valueremail nvarchar(100),
@arn nvarchar(100) ,
@Remark nvarchar(max) = null,
@CreatedDate datetime  = null
as
begin

	declare @RemarkID int 

	set @Remark = ltrim(rtrim(@Remark))

	if (@Remark <> '')
	begin 
		
		if not exists 
		(
			select 1 
			from dbo.SQLValuerDPSubmissionRemark
			where valuercode = @valueremail 
				and arn = @arn 
				--and remark = @Remark
				--and createddate = @CreatedDate
		)
		begin
			insert into dbo.SQLValuerDPSubmissionRemark (arn, valuercode,remark,createddate, remarkid)
			values (@arn,@valueremail,@Remark,@CreatedDate, 1  )
		end 
		else
		begin
			if not exists 
			(
				select 1 
				from dbo.SQLValuerDPSubmissionRemark
				where valuercode = @valueremail 
					and arn = @arn 
					and remark = @Remark
					--and createddate = @CreatedDate
			)
			begin
				select @RemarkID =  max(RemarkID) 
				from SQLValuerDPSubmissionRemark
				where valuercode = @valueremail 
					and arn = @arn 

				set @RemarkID = @RemarkID + 1

				insert into dbo.SQLValuerDPSubmissionRemark (arn, valuercode,remark,createddate, remarkid)
				values (@arn,@valueremail,@Remark,@CreatedDate ,@RemarkID )
			end
			end
			
	end  





end 




GO
