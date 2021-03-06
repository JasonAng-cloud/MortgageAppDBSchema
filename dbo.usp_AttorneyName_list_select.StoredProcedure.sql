/****** Object:  StoredProcedure [dbo].[usp_AttorneyName_list_select]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AttorneyName_list_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AttorneyName_list_select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AttorneyName_list_select]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_AttorneyName_list_select]
as
begin
	select an.AttorneyNameID as [AttorneyNameID], 
		an.AttorneyName as [AttorneyName],
		ac.AttorneyCentre as [AttorneyCentre],
		ac.AttorneyCentreID as [AttorneyCentreID],
		an.[status] as [AttorneyStatus],
		an.updateddate as updateddate
	from SQLDUMakerDP_AttorneyName an
		inner join SQLDUMakerDP_AttorneyCentre ac on ac.AttorneyCentreID = an.AttorneyCentreID
	where ac.[status] = 'Active'
end 


GO
