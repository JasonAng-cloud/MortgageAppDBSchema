/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_LOADSdata_Update]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_LOADSdata_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_LOADSdata_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_LOADSdata_Update]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_SQLDUMaker_LOADSdata_Update]
@ARN nvarchar(100),
@DisbursementManner nvarchar(max) =NULL,
@LandArea decimal = null,
@BuildUpArea decimal = null 
as
begin

	update SQLLOADS
	set DisbursementManner = @DisbursementManner,
		LandArea = @LandArea,
		BuildUpArea = @BuildUpArea		
	where arn = @arn 
	
end 


GO
