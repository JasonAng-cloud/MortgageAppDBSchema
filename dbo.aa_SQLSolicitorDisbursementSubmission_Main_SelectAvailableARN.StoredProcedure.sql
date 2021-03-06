/****** Object:  StoredProcedure [dbo].[aa_SQLSolicitorDisbursementSubmission_Main_SelectAvailableARN]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SQLSolicitorDisbursementSubmission_Main_SelectAvailableARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SQLSolicitorDisbursementSubmission_Main_SelectAvailableARN]
GO
/****** Object:  StoredProcedure [dbo].[aa_SQLSolicitorDisbursementSubmission_Main_SelectAvailableARN]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     procedure [dbo].[aa_SQLSolicitorDisbursementSubmission_Main_SelectAvailableARN]
@arn nvarchar(max) = null output ,
@DisbursementManner nvarchar(max) = null output ,
@ARNstatus nvarchar(max) = null output ,
@Output nvarchar(max) = null output 
as
begin	

	set @Output = 'No Record'

	select top 1 @arn = s.arn , @ARNstatus = SolicitorSubmissionOption , @DisbursementManner = DisbursementManner 
	from aaSolDisbursementSubmission_staging s 
	left join sqlloads on sqlloads.arn = s.arn 
	where s.SolicitorSubmissionPDFID is null 
	order by s.UpdatedDate desc 

	if (@arn is not null )
	begin
		update aaSolDisbursementSubmission_staging
		set SolicitorSubmissionPDFID = 0
		where arn = @arn 

		set @Output = ''
	end 	
	
end 
GO
