/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_generate_getrecord]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_generate_getrecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_generate_getrecord]
GO
/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_generate_getrecord]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_DUMaker_Letter_AV_generate_getrecord]
@index int ,
@RowNumber nvarchar(max) = null output ,
@arn nvarchar(max) = null output ,
@receiveremail nvarchar(max) = null output ,
@senderemail nvarchar(max) = null output ,
@email_header nvarchar(max) = null output ,
@email_body nvarchar(max) = null output 
as
begin		
			
		select 
			@RowNumber = RowNumber, 
			@arn = arn, 
			--@DateOfLOAcceptance = DateOfLOAcceptance, 
			@receiveremail = receiveremail, 
			@senderemail = senderemail, 
			@email_header = email_header, 
			@email_body = email_body
		from SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging2
		where 
			RowNumber = @index

		
end 

GO
