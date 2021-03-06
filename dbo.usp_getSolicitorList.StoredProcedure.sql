/****** Object:  StoredProcedure [dbo].[usp_getSolicitorList]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getSolicitorList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getSolicitorList]
GO
/****** Object:  StoredProcedure [dbo].[usp_getSolicitorList]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/


CREATE procedure [dbo].[usp_getSolicitorList]
as
begin
	SELECT
		[SolicitorCode]
		,[SolicitorPassword]
		,[Status]
		,[SolicitorName]
		--,[CreatedDate]
		,FORMAT ([CreatedDate], 'dd/MM/yyyy') as [CreatedDate]
		--,[UpdatedDate]
		,FORMAT ([UpdatedDate], 'dd/MM/yyyy') as [UpdatedDate]
		,[CreatedUser]
		,[UpdatedUser]		
  FROM [dbo].[SQLSolicitor]
end 

   
GO
