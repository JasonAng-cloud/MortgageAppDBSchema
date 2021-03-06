/****** Object:  StoredProcedure [dbo].[aa_K2Instance_billing_checkinstance]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_K2Instance_billing_checkinstance]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_K2Instance_billing_checkinstance]
GO
/****** Object:  StoredProcedure [dbo].[aa_K2Instance_billing_checkinstance]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE   procedure [dbo].[aa_K2Instance_billing_checkinstance]
  @folio nvarchar(100) = null,
  @output nvarchar(max) = null output 
  as
  begin
	declare @result nvarchar(100)
	if exists 
	(
		select 1 
		from aaK2Instance_billing
		where [K2Folio] = @folio
	)
	begin		
		set @result = '1'
	end 
	else
	begin		
		set @result = '0'
	end 

	select @result as result 
  end 
GO
