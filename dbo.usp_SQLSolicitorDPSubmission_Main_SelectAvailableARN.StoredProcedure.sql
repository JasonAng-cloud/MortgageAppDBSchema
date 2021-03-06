/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_Main_SelectAvailableARN]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmission_Main_SelectAvailableARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmission_Main_SelectAvailableARN]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_Main_SelectAvailableARN]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[usp_SQLSolicitorDPSubmission_Main_SelectAvailableARN]
@arn nvarchar(max) = null output ,
@ARNstatus nvarchar(max) = null output ,
@Output nvarchar(max) = null output 
as
begin	

	set @Output = 'No Record'

	select top 1 @arn = arn, @ARNstatus = [status] 
	from SQLSolicitorDPSubmission_Staging
	where OutputPDFID is null 
	order by UpdatedDate desc 

	if (@arn is not null )
	begin
		update SQLSolicitorDPSubmission_Staging
		set OutputPDFID = 0
		where arn = @arn 

		set @Output = ''
	end 	
	
end 
GO
