/****** Object:  StoredProcedure [dbo].[aa_aaWorkflowInstance_billing_select]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_aaWorkflowInstance_billing_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_aaWorkflowInstance_billing_select]
GO
/****** Object:  StoredProcedure [dbo].[aa_aaWorkflowInstance_billing_select]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE     procedure [dbo].[aa_aaWorkflowInstance_billing_select]
@ID nvarchar(max) = null
as
begin
	
	select * from aaWorkflowInstance_billing
	where SurrogateID = @id 
	

	
end 
GO
