/****** Object:  StoredProcedure [dbo].[usp_valuerinstance_remove]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_valuerinstance_remove]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_valuerinstance_remove]
GO
/****** Object:  StoredProcedure [dbo].[usp_valuerinstance_remove]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE procedure [dbo].[usp_valuerinstance_remove]
  @arn nvarchar(100) = null,
  @error nvarchar(max) = null output 
  as
  begin
	
	set @error = ''

	/*
	delete from [dbo].[K2Instance]
	where Workflow= 'DPDUMakerValuerApproval'
		and arn =  @arn	
	*/

	delete from MortgageAppTaskInstance
	where Workflow= 'DPDUMakerValuerApproval'
		and arn = @arn

	-- dumaker submission 
	delete from SQLDUMakerDP_ValuerSubmission
	where arn = @arn 
	
	-- dumaker submission (lower omv)
	delete from SQLDUMakerDP_ValuerSubmission_LoweredOMV
	where arn = @arn 

	-- valuer submission
	delete from SQLValuerDPSubmission
	where arn = @arn

	delete from SQLValuerDPSubmissionRemark
	where arn = @arn

	-- delete valuer in staging 
	delete from SQLValuerDPSubmission_Staging
	where arn = @arn

	delete from SQLValuerDPSubmissionRemark_Staging
	where arn = @arn	
	
	declare @NewValCode nvarchar(max) , @RequiredValuation bit 

	select @NewValCode = [ValuerCode], @RequiredValuation = ValuationRequired
	from [SQLLOADS]
	where arn = @arn 

	if (@RequiredValuation = 1)
	begin
		insert into WorkflowHistory
		values ('Valuation Report',@arn,'Change of Valuer',@NewValCode,null,getdate())
	end 
	
  end 
GO
