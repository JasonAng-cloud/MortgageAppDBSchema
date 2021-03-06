/****** Object:  StoredProcedure [dbo].[usp_CIF_Number_Check]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_CIF_Number_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_CIF_Number_Check]
GO
/****** Object:  StoredProcedure [dbo].[usp_CIF_Number_Check]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_CIF_Number_Check]
@cif nvarchar(max) = NULL,
@error nvarchar(max) = NULL OUTPUT 
as
begin	

	set @error = ''

	if (ltrim(rtrim(@cif)) = '')
	begin
		set @cif = '100'
	end 

	if (isnumeric(@cif) <> 1)
	begin
		set @error = 'Solicitor CIF Number field must be a number'
	end 
	
end 
GO
