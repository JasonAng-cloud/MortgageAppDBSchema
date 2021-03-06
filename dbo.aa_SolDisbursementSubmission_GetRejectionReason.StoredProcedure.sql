/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetRejectionReason]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetRejectionReason]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetRejectionReason]
GO
/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetRejectionReason]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE   procedure [dbo].[aa_SolDisbursementSubmission_GetRejectionReason]
  @arn nvarchar(max) = null ,
  @RejectionReason nvarchar(max) output 
  as
  begin
	set @RejectionReason =''
	select @RejectionReason= [DisbursementMakerRejectionReason]
	from [aaSolDisbursementSubmission_DisMakerRejected]
	where arn = @arn 
  end

GO
