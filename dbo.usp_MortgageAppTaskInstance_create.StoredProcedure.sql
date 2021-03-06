/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_create]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_create]
GO
/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_create]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_MortgageAppTaskInstance_create]
@workflow nvarchar(max) = null ,
@arn nvarchar(max) = null ,
@TaskOwner nvarchar(max) = null ,
@Error nvarchar(max) = null output  
as
begin
	
	set @Error = ''

	if (@TaskOwner like 'K2:%')
	begin		
		set @TaskOwner = Stuff(@TaskOwner, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	if exists
	(
		select 1
		from MortgageAppTaskInstance
		where workflow = @workflow
			and arn = @arn
	)
	begin
		set @Error = 'Task existed'
		
	end 
	
	if (@Error = '')
	begin
		insert into MortgageAppTaskInstance
		values (@workflow, @arn, @TaskOwner, getdate(), getdate(), @TaskOwner, @TaskOwner)

		if (@workflow = 'DPDUMakerValuerApproval')
		begin
			insert into WorkflowHistory
			values ('Valuation Report',@arn,'Case Accepted',@TaskOwner,null,getdate())
		end 
		if (@workflow = 'DPDUMakerSolicitorApproval')
		begin
			insert into WorkflowHistory
			values ('Documentation',@arn,'Case Accepted',@TaskOwner,null,getdate())
		end 
		if (@workflow = 'DisbDUMakerSolicitorApproval')
		begin
			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Case Accepted By Disbursement Maker',@TaskOwner,null,getdate())
		end 

		if (@workflow = 'DisbDUCheckerSolicitorApproval')
		begin
			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Case Accepted By Disbursement Checker',@TaskOwner,null,getdate())
		end 

		if (@workflow = 'DisbRCOMakerSolicitorApproval')
		begin
			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Case Accepted By RCO Maker',@TaskOwner,null,getdate())
		end 

		if (@workflow = 'DisbRCOCheckerSolicitorApproval')
		begin
			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Case Accepted By RCO Checker',@TaskOwner,null,getdate())
		end 
	end 
end 
GO
