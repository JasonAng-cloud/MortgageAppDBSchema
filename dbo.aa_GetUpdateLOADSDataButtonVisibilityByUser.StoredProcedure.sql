/****** Object:  StoredProcedure [dbo].[aa_GetUpdateLOADSDataButtonVisibilityByUser]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetUpdateLOADSDataButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetUpdateLOADSDataButtonVisibilityByUser]
GO
/****** Object:  StoredProcedure [dbo].[aa_GetUpdateLOADSDataButtonVisibilityByUser]    Script Date: 7/9/2020 12:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     procedure [dbo].[aa_GetUpdateLOADSDataButtonVisibilityByUser]
@UserName nvarchar(max) = null,
@output nvarchar(max) = null output
as
begin
	set @output = 'No'
	
	declare @authorized bit 
	set @authorized = 1
	declare @index int 

	if (@UserName like 'K2:%')
	begin		
		set @UserName = Stuff(@UserName, 1, 3, '')
				
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 
	/*
	else
	begin
		if (@UserName like '%\%') 
		begin			
			select @index = CHARINDEX('\', @UserName)

			set @UserName = Stuff(@UserName, 1,@index, '')
		end 
		else
		begin
			set @UserName = @UserName
		end
	end 
	*/
	--IsMortgageAdmin
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsMortgageAdmin = 1
	)
	begin
		set @output = 'Yes'
	end 

	--IsDUMakerDocumentation
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsDUMakerDocumentation = 1
	)
	begin
		set @output = 'Yes'
	end 

	--IsDUMakerValuation
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsDUMakerValuation = 1
	)
	begin
		set @output = 'Yes'
	end 

	--IsDisbMaker
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsDisbMaker = 1
	)
	begin
		set @output = 'Yes'
	end 

	--IsDisbChecker
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsDisbChecker = 1
	)
	begin
		set @output = 'Yes'
	end 

	--IsRCOMaker
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsRCOMaker = 1
	)
	begin
		set @output = 'Yes'
	end 

	--IsRCOChecker
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsRCOChecker = 1
	)
	begin
		set @output = 'Yes'
	end 

	--IsTBOMaker
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsTBOMaker = 1
	)
	begin
		set @output = 'Yes'
	end 

	--IsTBOChecker
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsTBOChecker = 1
	)
	begin
		set @output = 'Yes'
	end 
	
end 
GO
