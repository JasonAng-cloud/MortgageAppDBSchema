/****** Object:  StoredProcedure [dbo].[usp_loadImage]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_loadImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_loadImage]
GO
/****** Object:  StoredProcedure [dbo].[usp_loadImage]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_loadImage]
@ImageType nvarchar(100)
as
begin

	declare @ImageSource xml
	declare @Image nvarchar(max)

	select @ImageSource= [image]
	from imagesettings 
	where imagetype = @ImageType 

	set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')

	select @Image as [Image]
end 


GO
