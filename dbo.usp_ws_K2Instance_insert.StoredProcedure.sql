/****** Object:  StoredProcedure [dbo].[usp_ws_K2Instance_insert]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_K2Instance_insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_K2Instance_insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_K2Instance_insert]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_ws_K2Instance_insert]
@K2SerialNumber [nvarchar](100),
@K2Folio [nvarchar](100),
@arn [nvarchar](100),
@Workflow [nvarchar](100)
as
begin
	if not exists
	(
		select 1
		from [K2Instance]
		where [K2Folio] = @K2Folio
	)
	begin 
		if not exists
		(
			select 1
			from [K2Instance]
			where K2SerialNumber = @K2SerialNumber
		)
		begin
			insert into [K2Instance] ([K2SerialNumber], [K2Folio], [arn], [Workflow])
			values (@K2SerialNumber, @K2Folio, @arn, @Workflow)
		end 
	end 
	
end 
GO
