/****** Object:  StoredProcedure [dbo].[aa_K2Instance_billing_delete]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_K2Instance_billing_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_K2Instance_billing_delete]
GO
/****** Object:  StoredProcedure [dbo].[aa_K2Instance_billing_delete]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   procedure [dbo].[aa_K2Instance_billing_delete]
@serialnumber nvarchar(100)
as
begin

	delete from aaK2Instance_billing
	where K2SerialNumber = @serialnumber
end 


GO
