/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_generate_list_delete_staging]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_generate_list_delete_staging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_generate_list_delete_staging]
GO
/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_generate_list_delete_staging]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_DUMaker_Letter_AV_generate_list_delete_staging]
as
begin		
			
	delete from SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging
	where arn in (select arn from SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging2)		

end 
GO
