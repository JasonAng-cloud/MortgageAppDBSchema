/****** Object:  StoredProcedure [dbo].[aa_aaWorkflowInstance_billingid_step3_GetFinalList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_aaWorkflowInstance_billingid_step3_GetFinalList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_aaWorkflowInstance_billingid_step3_GetFinalList]
GO
/****** Object:  StoredProcedure [dbo].[aa_aaWorkflowInstance_billingid_step3_GetFinalList]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE             procedure [dbo].[aa_aaWorkflowInstance_billingid_step3_GetFinalList] 
as
begin
	
	select * from aaWorkflowInstance_billing
	
end 

GO
