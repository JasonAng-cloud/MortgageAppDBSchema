/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A9_header_generate]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_A9_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_A9_header_generate]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A9_header_generate]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ufn_DUMaker_Letter_A9_header_generate]
(@param_arn nvarchar(100))
RETURNS nvarchar(max)
as
begin	
	
	declare @line1 nvarchar(max),
	@line2 nvarchar(max),
	@line3 nvarchar(max),
	@line4 nvarchar(max),
	@line5 nvarchar(max),
	@line6 nvarchar(max),
	@line7 nvarchar(max),
	@line8 nvarchar(max),
	@line9 nvarchar(max),
	@line10 nvarchar(max),
	@text nvarchar(max),
	@arn nvarchar(100),
	@dateofreject date,
	@url nvarchar(max),
	@line11 nvarchar(max)

	select @url = [url]
	from url_setting 
	where [type] = 'SolicitorLogin'

	select @arn = arn 		
	from sqlloads 
	where arn = @param_arn

	select @dateofreject = updateddate
	from SQLDUMakerDP_SolicitorSubmission_Rejected
	where arn = @arn 

	set @line1 = 'Pending receipt of original documents for ' + @arn 

	/*
	set @line2 = 'Dear Business Partner, <br>'  + CHAR(13)+CHAR(10)
		
	set @line3 = 'Reference is made to your update of the documentation status for the case above. <br>' + CHAR(13)+CHAR(10)

	set @line4 = 'Based on our records, the bank has yet to receive the original documents from your firm. Kindly look into the matter with immediate attention.   <br>' + CHAR(13)+CHAR(10)
	--set @line5 = 'You may follow up with the solicitor for the status of legal documentation.  <br>' + CHAR(13)+CHAR(10)

	--set @line6 = 'Kindly expedite on the documentation process and submit the documents for our execution. The bank shall not be liable for any delay in documentation.  <br>' + CHAR(13)+CHAR(10)
		
	set @line7 = 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal to update on the status and ensure the original documents are forwarded to the bank for our further action.   <br>' + CHAR(13)+CHAR(10)

	set @line8 = '<i>**This is an auto generated e-mail. Please do not respond to this e-mail.</i>  <br>' + CHAR(13)+CHAR(10)
	
	set @line9 = 'Regards <br>' 
	set @line10 = 'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>' 
	set @line11 = 'Mortgage Centre'

	set @text = @line2 + @line3 + @line4 + @line7 +  @line8 + @line9 + @line10 + @line11
	*/
	
	return @line1
end 


GO
