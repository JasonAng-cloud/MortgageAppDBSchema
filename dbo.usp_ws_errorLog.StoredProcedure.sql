/****** Object:  StoredProcedure [dbo].[usp_ws_errorLog]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_errorLog]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_errorLog]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_errorLog]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_ws_errorLog]
@APIName nvarchar(max) = null ,
@errorType nvarchar(max) = null,
@errorMessage nvarchar(max) = null,
@errorDetail nvarchar(max) = null,
@APIErrorDt datetime  = null
as
begin

	insert into [errorLog] (APIName, errorType, errorMessage, errorDetail, APIErrorDt, DateInserted)
	values (@APIName, @errorType, @errorMessage, @errorDetail, @APIErrorDt, getdate())

end 
GO
