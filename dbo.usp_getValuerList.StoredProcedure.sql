/****** Object:  StoredProcedure [dbo].[usp_getValuerList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getValuerList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getValuerList]
GO
/****** Object:  StoredProcedure [dbo].[usp_getValuerList]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_getValuerList]
as
begin
	SELECT [ValuerCode]
		  ,[ValuerPassword]
		  ,[Status]
		  ,[ValuerName]
		  ,FORMAT ([CreatedDate], 'dd/MM/yyyy') as [CreatedDate]
		  ,FORMAT ([UpdatedDate], 'dd/MM/yyyy') as [UpdatedDate]
		  --,[CreatedDate]
		  --,[UpdatedDate]
		  ,[CreatedUser]
		  ,[UpdatedUser]
	  FROM [dbo].[SQLValuer]

end 


GO
