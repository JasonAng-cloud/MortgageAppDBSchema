/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_delete]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_delete]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_MortgageAppTaskInstance_delete]
@workflow nvarchar(max) = null ,
@arn nvarchar(max) = null 
as
begin

	if exists 
	(
		select 1
		from MortgageAppTaskInstance
		where workflow = @workflow
		and arn = @arn 
	)
	begin
		insert into MortgageAppTaskInstance_logs 
		select [workflow]
			,[arn]
			,[TaskOwner]
			,[CreatedDate]
			,getdate()
			,[CreatedUser]
			,[UpdatedUser]
			, 1
			, 0
		from MortgageAppTaskInstance
		where workflow = @workflow
		and arn = @arn 
	end 		

	declare @Owner nvarchar(max), @Operator nvarchar(max)

	select @Owner = [TaskOwner]
	from MortgageAppTaskInstance
	where workflow = @workflow
		and arn = @arn 

	if (@workflow = 'DPDUMakerValuerApproval')
	begin
		insert into WorkflowHistory
		values ('Valuation Report',@arn,'Case Unpicked',@Owner,null,getdate())
	end 
	if (@workflow = 'DPDUMakerSolicitorApproval')
	begin
		insert into WorkflowHistory
		values ('Documentation',@arn,'Case Unpicked',@Owner,null,getdate())
	end 

	if (@workflow = 'DisbDUMakerSolicitorApproval')
	begin
		insert into WorkflowHistory
		values ('Disbursement By Solicitor',@arn,'Case Unpicked By Disbursement Maker',@Owner,null,getdate())
	end 

	if (@workflow = 'DisbDUCheckerSolicitorApproval')
	begin
		insert into WorkflowHistory
		values ('Disbursement By Solicitor',@arn,'Case Unpicked By Disbursement Checker',@Owner,null,getdate())
	end 

	if (@workflow = 'DisbRCOMakerSolicitorApproval')
	begin
		insert into WorkflowHistory
		values ('Disbursement By Solicitor',@arn,'Case Unpicked By RCO Maker',@Owner,null,getdate())
	end 

	if (@workflow = 'DisbRCOCheckerSolicitorApproval')
	begin
		insert into WorkflowHistory
		values ('Disbursement By Solicitor',@arn,'Case Unpicked By RCO Checker',@Owner,null,getdate())
	end 

	delete from MortgageAppTaskInstance
	where workflow = @workflow
	and arn = @arn 

end 

GO
