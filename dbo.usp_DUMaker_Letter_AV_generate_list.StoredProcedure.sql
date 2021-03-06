/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_generate_list]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_generate_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_generate_list]
GO
/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_generate_list]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_DUMaker_Letter_AV_generate_list]
as
begin		
			
	truncate table SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging2 		

	insert into SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging2
	select ROW_NUMBER() OVER(ORDER BY arn ASC) AS RowNumber, arn, receiveremail, senderemail, email_header, email_body
	from SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging
	where 		
		receiveremail is not null 
		and email_header is not null 
		and email_body is not null 			
		
	select RowNumber, arn, receiveremail, senderemail, email_header, email_body
	from SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging2
	order by RowNumber asc 	
		
end 
GO
