/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DU_ByARN]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_DU_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_DU_ByARN]
GO
/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DU_ByARN]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     procedure [dbo].[usp_MortgageAppTaskInstance_select_DU_ByARN]
@arn nvarchar(max) = null 
as
begin

	SELECT 		
		[workflow]
      ,[arn]
      ,[TaskOwner]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[CreatedUser]
      ,[UpdatedUser]
  FROM [dbo].[MortgageAppTaskInstance]
  where [workflow] in ('DPDUMakerSolicitorApproval')
	and  arn = @arn

end 
GO
