/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 7/9/2020 12:28:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Split]
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[Split](@String varchar(8000), @Delimiter char(1))
returns @temptable
TABLE (nameIndex int identity(1,1),items varchar(8000))
as
begin
	declare @idx int
	declare
	@slice varchar(8000)

	select @idx = 1
	if len(@String)<1 or @String
	is null return

	while @idx!= 0
	begin
	set @idx =
	charindex(@Delimiter,@String)
	if @idx!=0
	set @slice = left(@String,@idx
	- 1)
	else
	set @slice = @String

	if(len(@slice)>0)
	insert
	into @temptable(Items) values(@slice)

	set @String =
	right(@String,len(@String) - @idx)
	if len(@String) = 0 break
	end

return
end
GO
