/****** Object:  StoredProcedure [dbo].[aa_K2Instance_billing_insert]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_K2Instance_billing_insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_K2Instance_billing_insert]
GO
/****** Object:  StoredProcedure [dbo].[aa_K2Instance_billing_insert]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[aa_K2Instance_billing_insert]
@K2SerialNumber [nvarchar](100),
@K2Folio [nvarchar](100),
@arn [nvarchar](100),
@billingid bigint
as
begin
	if not exists
	(
		select 1
		from aaK2Instance_billing
		where [K2Folio] = @K2Folio
	)
	begin 
		if not exists
		(
			select 1
			from aaK2Instance_billing
			where K2SerialNumber = @K2SerialNumber
		)
		begin
			insert into aaK2Instance_billing ([K2SerialNumber], [K2Folio], [arn])
			values (@K2SerialNumber, @K2Folio, @arn)
		end 
	end 
	
end 
GO
