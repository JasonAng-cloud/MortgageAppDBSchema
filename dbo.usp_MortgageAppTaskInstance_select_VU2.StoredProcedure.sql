/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_VU2]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_VU2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_VU2]
GO
/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_VU2]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_MortgageAppTaskInstance_select_VU2]
as
begin

	SELECT 
		case when workflow = 'DPDUMakerSolicitorApproval' then 'Document Unit' 
			when  workflow = 'DPDUMakerValuerApproval' then 'Valuation Unit' end as [WorkflowName],
		[workflow]
      ,[arn]
      ,[TaskOwner]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[CreatedUser]
      ,[UpdatedUser]
  FROM [dbo].[MortgageAppTaskInstance]
  where [workflow] in ('DPDUMakerValuerApproval')

end 
GO
