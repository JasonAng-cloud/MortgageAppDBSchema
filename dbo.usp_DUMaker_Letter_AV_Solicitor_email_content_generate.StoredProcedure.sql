/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_Solicitor_email_content_generate]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_Solicitor_email_content_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_Solicitor_email_content_generate]
GO
/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_Solicitor_email_content_generate]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_DUMaker_Letter_AV_Solicitor_email_content_generate]
as
begin		
	
	select * from SQLJOB_DUMaker_Letter_AV_Solicitor_email_content
		
end 
GO
