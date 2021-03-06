/****** Object:  StoredProcedure [dbo].[usp_Admin_GenerateDU1_Check]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_GenerateDU1_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_GenerateDU1_Check]
GO
/****** Object:  StoredProcedure [dbo].[usp_Admin_GenerateDU1_Check]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE procedure [dbo].[usp_Admin_GenerateDU1_Check]
  @arn nvarchar(max)=NULL ,
  @output nvarchar(max) = NULL OUTPUT 
  as
  begin

	set @output = ''

	
	if (ltrim(rtrim(@arn)) = '' or @arn is null)
	begin
		set @output = 'Please fill in ARN'
	end 
	else
	begin
		
		if not exists
		(
			select 1 
			from SQLLOADS
			where arn = @arn 
		)
		begin
			set @output = 'ARN does not exists in the system'
		end 
		else
		begin
			if not exists
			(
				select 1 
				from SQLDUMakerDP_SolicitorSubmission
				where status = 'Completed'
					and Decision = 'Document in order for execution'
					and arn = @arn 
			)
			begin
				set @output = 'Cannot generate DU1 letter for this case at this moment'
			end 
		end 
	end 

	
	
  end 
GO
