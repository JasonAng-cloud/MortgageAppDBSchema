/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Delete]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_ValuerSubmission_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_ValuerSubmission_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Delete]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Delete]
@ARN [nvarchar](100)
as 
begin

	delete SQLDUMakerDP_ValuerSubmission 
	where arn = @arn 

end 


GO
