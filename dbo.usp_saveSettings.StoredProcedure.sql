/****** Object:  StoredProcedure [dbo].[usp_saveSettings]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_saveSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_saveSettings]
GO
/****** Object:  StoredProcedure [dbo].[usp_saveSettings]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     procedure [dbo].[usp_saveSettings]
@SolicitorLoginTrialsNumberOfLoginAllowed nvarchar(max) = null
,@SolicitorLoginTrialsExpiryPeroidInMinutes nvarchar(max) = null
,@ValuerLoginTrialsNumberOfLoginAllowed nvarchar(max) = null
,@ValuerLoginTrialsExpiryPeroidInMinutes nvarchar(max) = null
,@SolicitorDormantIDReportPeriodInDays nvarchar(max) = null
,@ValuerDormantIDReportPeriodInDays nvarchar(max) = null
,@SolicitorLoginPasswordHistoryCount nvarchar(max) = null
,@ValuerLoginPasswordHistoryCount nvarchar(max) = null
,@SolicitorLoginPasswordMaxExpiryDays nvarchar(max) = null
,@ValuerLoginPasswordMaxExpiryDays nvarchar(max) = null
,@SolicitorLoginPasswordMaxExpiryWarningDays nvarchar(max) = null
,@ValuerLoginPasswordMaxExpiryWarningDays nvarchar(max) = null
,@SolicitorPasswordMinCharacters nvarchar(max) = null
,@ValuerPasswordMinCharacters nvarchar(max) = null
,@SolicitorSessionInMinutes nvarchar(max) = null
,@ValuerSessionInMinutes nvarchar(max) = null
,@InternalUserSessionInMinutes       nvarchar(max) = null
,@InternalUserDormantIDReportPeriodInDays   nvarchar(max) = null
,@InternalUserLoginTrialsExpiryPeroidInMinutes   nvarchar(max) = null
,@InternalUserLoginTrialsNumberOfLoginAllowed   nvarchar(max) = null
,@solicitor_password nvarchar(max) =null
,@valuer_password nvarchar(max) =null
,@lastupdateduser nvarchar(max) =null
,@error nvarchar(max) = null output 
as
begin
	
	set @error = ''

	if (@solicitor_password is null or ltrim(rtrim(@solicitor_password)) = '')
	begin
		set @error = @error + 'Please fill in Solicitor Default Password <br>'
	end 

	if (@valuer_password is null or ltrim(rtrim(@valuer_password)) = '')
	begin
		set @error = @error + 'Please fill in Valuer Default Password <br>'
	end 

	if (@SolicitorLoginTrialsNumberOfLoginAllowed is null or ltrim(rtrim(@SolicitorLoginTrialsNumberOfLoginAllowed)) = '')
	begin
		set @error = @error + 'Please fill in Solicitor Login Trials Number Of Login Allowed Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@SolicitorLoginTrialsNumberOfLoginAllowed)=0)
		begin
			set @error = @error + 'Solicitor Login Trials Number Of Login Allowed Field must be a number <br>'
		end 
	end 

	/*
	if (@SolicitorLoginTrialsExpiryPeroidInMinutes is null or ltrim(rtrim(@SolicitorLoginTrialsExpiryPeroidInMinutes)) = '')
	begin
		set @error = @error + 'Please fill in Solicitor Login Trials Expiry Peroid In Minutes Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@SolicitorLoginTrialsExpiryPeroidInMinutes)=0)
		begin
			set @error = @error + 'Solicitor Login Trials Expiry Peroid In Minutes Field must be a number <br>'
		end 
	end
	*/

	if (@ValuerLoginTrialsNumberOfLoginAllowed is null or ltrim(rtrim(@ValuerLoginTrialsNumberOfLoginAllowed)) = '')
	begin
		set @error = @error + 'Please fill in Valuer Login Trials Number Of Login Allowed Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@ValuerLoginTrialsNumberOfLoginAllowed)=0)
		begin
			set @error = @error + 'Valuer Login Trials Number Of Login Allowed Field must be a number <br>'
		end 
	end

	/*
	if (@ValuerLoginTrialsExpiryPeroidInMinutes is null or ltrim(rtrim(@ValuerLoginTrialsExpiryPeroidInMinutes)) = '')
	begin
		set @error = @error + 'Please fill in Valuer Login Trials Expiry Peroid In Minutes Field <br>'
	end 	
	else
	begin
		if (ISNUMERIC (@ValuerLoginTrialsExpiryPeroidInMinutes)=0)
		begin
			set @error = @error + 'Valuer Login Trials Expiry Peroid In Minutes Field must be a number <br>'
		end 
	end
	*/

	if (@SolicitorDormantIDReportPeriodInDays is null or ltrim(rtrim(@SolicitorDormantIDReportPeriodInDays)) = '')
	begin
		set @error = @error + 'Please fill in Solicitor Dormant ID Report Period In Days Field <br>'
	end 		
	else
	begin
		if (ISNUMERIC (@SolicitorDormantIDReportPeriodInDays)=0)
		begin
			set @error = @error + 'Solicitor Dormant ID Report Period In Days Field must be a number <br>'
		end 
	end

	if (@ValuerDormantIDReportPeriodInDays is null or ltrim(rtrim(@ValuerDormantIDReportPeriodInDays)) = '')
	begin
		set @error = @error + 'Please fill in Valuer Dormant ID Report Period In Days Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@ValuerDormantIDReportPeriodInDays)=0)
		begin
			set @error = @error + 'Valuer Dormant ID Report Period In Days Field must be a number <br>'
		end 
	end

	if (@SolicitorLoginPasswordHistoryCount is null or ltrim(rtrim(@SolicitorLoginPasswordHistoryCount)) = '')
	begin
		set @error = @error + 'Please fill in Solicitor Login Password History Count Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@SolicitorLoginPasswordHistoryCount)=0)
		begin
			set @error = @error + 'Solicitor Login Password History Count Field must be a number <br>'
		end 
	end

	if (@ValuerLoginPasswordHistoryCount is null or ltrim(rtrim(@ValuerLoginPasswordHistoryCount)) = '')
	begin
		set @error = @error + 'Please fill in Valuer Login Password History Count Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@ValuerLoginPasswordHistoryCount)=0)
		begin
			set @error = @error + 'Valuer Login Password History Count Field must be a number <br>'
		end 
	end

	if (@SolicitorLoginPasswordMaxExpiryDays is null or ltrim(rtrim(@SolicitorLoginPasswordMaxExpiryDays)) = '')
	begin
		set @error = @error + 'Please fill in Solicitor Login Password Max Expiry Days Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@SolicitorLoginPasswordMaxExpiryDays)=0)
		begin
			set @error = @error + 'Solicitor Login Password Max Expiry Days Field must be a number <br>'
		end 
	end

	if (@ValuerLoginPasswordMaxExpiryDays is null or ltrim(rtrim(@ValuerLoginPasswordMaxExpiryDays)) = '')
	begin
		set @error = @error + 'Please fill in Valuer Login Password Max Expiry Days Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@ValuerLoginPasswordMaxExpiryDays)=0)
		begin
			set @error = @error + 'Valuer Login Password Max Expiry Days Field must be a number <br>'
		end 
	end

	if (@SolicitorLoginPasswordMaxExpiryWarningDays is null or ltrim(rtrim(@SolicitorLoginPasswordMaxExpiryWarningDays)) = '')
	begin
		set @error = @error + 'Please fill in Solicitor Login Password Max Expiry Warning Days Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@SolicitorLoginPasswordMaxExpiryWarningDays)=0)
		begin
			set @error = @error + 'Solicitor Login Password Max Expiry Warning Days Field must be a number <br>'
		end 
	end

	if (@ValuerLoginPasswordMaxExpiryWarningDays is null or ltrim(rtrim(@ValuerLoginPasswordMaxExpiryWarningDays)) = '')
	begin
		set @error = @error + 'Please fill in Valuer Login Password Max Expiry Warning Days Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@ValuerLoginPasswordMaxExpiryWarningDays)=0)
		begin
			set @error = @error + 'Valuer Login Password Max Expiry Warning Days Field must be a number <br>'
		end 
	end

	declare @SolFlag bit 
	set @SolFlag = 1

	if (@SolicitorPasswordMinCharacters is null or ltrim(rtrim(@SolicitorPasswordMinCharacters)) = '')
	begin
		set @error = @error + 'Please fill in Solicitor Password Min Characters Field <br>'
		set @SolFlag = 0
	end 
	else
	begin
		if (ISNUMERIC (@SolicitorPasswordMinCharacters)=0)
		begin
			set @error = @error + 'Solicitor Password Min Characters Field must be a number <br>'
			set @SolFlag = 0
		end 
	end

	declare @ValFlag bit 
	set @ValFlag = 1

	if (@ValuerPasswordMinCharacters is null or ltrim(rtrim(@ValuerPasswordMinCharacters)) = '')
	begin
		set @error = @error + 'Please fill in Valuer Password Min Characters Field <br>'
		set @ValFlag = 0
	end 
	else
	begin
		if (ISNUMERIC (@ValuerPasswordMinCharacters)=0)
		begin
			set @error = @error + 'Valuer Password Min Characters Field must be a number <br>'
			set @ValFlag = 0
		end 
	end

	if (@ValuerSessionInMinutes is null or ltrim(rtrim(@ValuerSessionInMinutes)) = '')
	begin
		set @error = @error + 'Please fill in Valuer Session In Minutes Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@ValuerSessionInMinutes)=0)
		begin
			set @error = @error + 'Valuer Session In Minutes Field must be a number<br>'
		end 
	end

	if (@SolicitorSessionInMinutes is null or ltrim(rtrim(@SolicitorSessionInMinutes)) = '')
	begin
		set @error = @error + 'Please fill in Solicitor Session In Minutes Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@SolicitorSessionInMinutes)=0)
		begin
			set @error = @error + 'Solicitor Session In Minutes Field must be a number<br>'
		end 
	end

	if (@InternalUserSessionInMinutes is null or ltrim(rtrim(@InternalUserSessionInMinutes)) = '')
	begin
		set @error = @error + 'Please fill in Internal User Session In Minutes Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@InternalUserSessionInMinutes)=0)
		begin
			set @error = @error + 'Internal User Session In Minutes Field must be a number<br>'
		end 
	end

	if (@InternalUserDormantIDReportPeriodInDays is null or ltrim(rtrim(@InternalUserDormantIDReportPeriodInDays)) = '')
	begin
		set @error = @error + 'Please fill in Internal User Dormant ID Report Period In Days Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@InternalUserDormantIDReportPeriodInDays)=0)
		begin
			set @error = @error + 'Internal User Dormant ID Report Period In Days Field must be a number<br>'
		end 
	end

	/*
	-- expiry minute 
	if (@InternalUserLoginTrialsExpiryPeroidInMinutes is null or ltrim(rtrim(@InternalUserLoginTrialsExpiryPeroidInMinutes)) = '')
	begin
		set @error = @error + 'Please fill in Internal User Login Trials Expiry Period In Minutes Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@InternalUserLoginTrialsExpiryPeroidInMinutes)=0)
		begin
			set @error = @error + 'Internal User Login Trials Expiry Period In Minutes Field must be a number<br>'
		end 
	end
	*/

	-- trials
	if (@InternalUserLoginTrialsNumberOfLoginAllowed is null or ltrim(rtrim(@InternalUserLoginTrialsNumberOfLoginAllowed)) = '')
	begin
		set @error = @error + 'Please fill in Internal User Login Trials Number Of Login Allowed Field <br>'
	end 
	else
	begin
		if (ISNUMERIC (@InternalUserLoginTrialsNumberOfLoginAllowed)=0)
		begin
			set @error = @error + 'Internal User Login Trials Number Of Login Allowed Field must be a number<br>'
		end 
	end

	-- password requirement check for valuer default password
	if (@ValFlag = 1)
	begin		
		declare @valuerpasswordminlength int 
		set @valuerpasswordminlength = cast(@ValuerPasswordMinCharacters as int)

		if (len(@valuer_password)<@valuerpasswordminlength)
		BEGIN
			--set @Error = 'Password must have at least 12 characters<br>'
			set @Error = 'Valuer Default Password must have at least ' + str(@valuerpasswordminlength)+ ' characters<br>'
		END 

		if ( PATINDEX('%[abcdefghijklmnopqrstuvwxyz]%', @valuer_password COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
		begin 		
			set @Error = @Error + 'Valuer Default Password must have at least 1 lowercase character<br>'
		end

		if ( PATINDEX('%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%', @valuer_password COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
		begin 		
			set @Error =  @Error +'Valuer Default Password must have at least 1 uppercase character<br>'
		end
	
		if ( PATINDEX('%[0-9]%', @valuer_password) = 0)	
		begin 
			set @Error =  @Error +'Valuer Default Password must have at least 1 number<br>'
		end 	

		if ( PATINDEX('%[^A-Za-z0-9, ]%', @valuer_password) = 0)	
		begin 
			set @Error =  @Error +'Valuer Default Password must have at least 1 special character<br>'
		end 	
	end 

	-- password requirement check for solicitor default password
	if (@SolFlag = 1)
	begin
		declare @solicitorpasswordminlength int 
		set @solicitorpasswordminlength = cast(@SolicitorPasswordMinCharacters as int)		

		if (len(@solicitor_password)<@solicitorpasswordminlength)
		BEGIN
			--set @Error = 'Password must have at least 12 characters<br>'
			set @Error = 'Solicitor Default Password must have at least ' + str(@solicitorpasswordminlength)+ ' characters<br>'
		END 

		if ( PATINDEX('%[abcdefghijklmnopqrstuvwxyz]%', @solicitor_password COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
		begin 		
			set @Error = @Error + 'Solicitor Default Password must have at least 1 lowercase character<br>'
		end

		if ( PATINDEX('%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%', @solicitor_password COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
		begin 		
			set @Error =  @Error +'Solicitor Default Password must have at least 1 uppercase character<br>'
		end
	
		if ( PATINDEX('%[0-9]%', @solicitor_password) = 0)	
		begin 
			set @Error =  @Error +'Solicitor Default Password must have at least 1 number<br>'
		end 	

		if ( PATINDEX('%[^A-Za-z0-9, ]%', @solicitor_password) = 0)	
		begin 
			set @Error =  @Error +'Solicitor Default Password must have at least 1 special character<br>'
		end 
	end 

	-- start get original fields value 		
	declare @ConcatenatedOriginalValue nvarchar(max)
	set @ConcatenatedOriginalValue = ''
	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue  +
		cast(SolicitorLoginTrialsNumberOfLoginAllowed as varchar(max)) +','+
		--cast(SolicitorLoginTrialsExpiryPeroidInMinutes as varchar(max))+','+
		cast(ValuerLoginTrialsNumberOfLoginAllowed as varchar(max))+','+
		--cast(ValuerLoginTrialsExpiryPeroidInMinutes as varchar(max)) +','+
		cast(SolicitorDormantIDReportPeriodInDays as varchar(max))+','+
		cast(ValuerDormantIDReportPeriodInDays as varchar(max))+','+
		cast(SolicitorLoginPasswordHistoryCount as varchar(max))+','+
		cast(ValuerLoginPasswordHistoryCount as varchar(max))+','+
		cast(SolicitorLoginPasswordMaxExpiryDays as varchar(max))+','+
		cast(ValuerLoginPasswordMaxExpiryDays as varchar(max))+','+
		cast(SolicitorLoginPasswordMaxExpiryWarningDays as varchar(max))+','+
		cast(ValuerLoginPasswordMaxExpiryWarningDays as varchar(max))+','+
		cast(SolicitorPasswordMinCharacters as varchar(max))+','+
		cast(ValuerPasswordMinCharacters as varchar(max))+','+
		cast(SolicitorSessionInMinutes as varchar(max))+','+
		cast(ValuerSessionInMinutes as varchar(max))+','+
		cast(InternalUserSessionInMinutes as varchar(max))+','+
		cast(InternalUserDormantIDReportPeriodInDays  as varchar(max)) +','+
		--cast(InternalUserLoginTrialsExpiryPeroidInMinutes  as varchar(max)) +','+
		cast(InternalUserLoginTrialsNumberOfLoginAllowed as varchar(max))
	from [Settings]

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue  + ',' + 
		[password]
	from DefaultPassword_Setting
	where [type] = 'SolicitorLogin'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue  + ',' + 
		[password]
	from DefaultPassword_Setting
	where [type] = 'ValuerLogin'

	--select @ConcatenatedOriginalValue
	-- end get original fields value 

	-- start get Concatenated field name 
	declare @fieldname nvarchar(max), 
		@ConcatenatedFieldsName nvarchar(max)
			
	SET @fieldname = ''
	--SET @fieldname = 'SolicitorLoginTrialsNumberOfLoginAllowed ,SolicitorLoginTrialsExpiryPeroidInMinutes ,ValuerLoginTrialsNumberOfLoginAllowed ,ValuerLoginTrialsExpiryPeroidInMinutes ,SolicitorDormantIDReportPeriodInDays,ValuerDormantIDReportPeriodInDays ,SolicitorLoginPasswordHistoryCount ,ValuerLoginPasswordHistoryCount ,SolicitorLoginPasswordMaxExpiryDays ,ValuerLoginPasswordMaxExpiryDays ,SolicitorLoginPasswordMaxExpiryWarningDays ,ValuerLoginPasswordMaxExpiryWarningDays ,SolicitorPasswordMinCharacters ,ValuerPasswordMinCharacters ,SolicitorSessionInMinutes ,ValuerSessionInMinutes ,InternalUserSessionInMinutes       ,InternalUserDormantIDReportPeriodInDays   
	--SET @fieldname = 'SolicitorLoginTrialsNumberOfLoginAllowed ,SolicitorLoginTrialsExpiryPeroidInMinutes ,ValuerLoginTrialsNumberOfLoginAllowed ,ValuerLoginTrialsExpiryPeroidInMinutes ,SolicitorDormantIDReportPeriodInDays,ValuerDormantIDReportPeriodInDays ,SolicitorLoginPasswordHistoryCount ,ValuerLoginPasswordHistoryCount ,SolicitorLoginPasswordMaxExpiryDays ,ValuerLoginPasswordMaxExpiryDays ,SolicitorLoginPasswordMaxExpiryWarningDays ,ValuerLoginPasswordMaxExpiryWarningDays ,SolicitorPasswordMinCharacters ,ValuerPasswordMinCharacters ,SolicitorSessionInMinutes ,ValuerSessionInMinutes ,InternalUserSessionInMinutes       ,InternalUserDormantIDReportPeriodInDays    ,InternalUserLoginTrialsNumberOfLoginAllowed   ,solicitor_password ,valuer_password '
	SET @fieldname = 'SolicitorLoginTrialsNumberOfLoginAllowed ,ValuerLoginTrialsNumberOfLoginAllowed ,SolicitorDormantIDReportPeriodInDays,ValuerDormantIDReportPeriodInDays ,SolicitorLoginPasswordHistoryCount ,ValuerLoginPasswordHistoryCount ,SolicitorLoginPasswordMaxExpiryDays ,ValuerLoginPasswordMaxExpiryDays ,SolicitorLoginPasswordMaxExpiryWarningDays ,ValuerLoginPasswordMaxExpiryWarningDays ,SolicitorPasswordMinCharacters ,ValuerPasswordMinCharacters ,SolicitorSessionInMinutes ,ValuerSessionInMinutes ,InternalUserSessionInMinutes       ,InternalUserDormantIDReportPeriodInDays    ,InternalUserLoginTrialsNumberOfLoginAllowed   ,solicitor_password ,valuer_password '
			

	if (@error = '')
	begin
		update [Settings]
		 SET SolicitorLoginTrialsNumberOfLoginAllowed = @SolicitorLoginTrialsNumberOfLoginAllowed
			--,SolicitorLoginTrialsExpiryPeroidInMinutes=@SolicitorLoginTrialsExpiryPeroidInMinutes
			,ValuerLoginTrialsNumberOfLoginAllowed=@ValuerLoginTrialsNumberOfLoginAllowed
			--,ValuerLoginTrialsExpiryPeroidInMinutes=@ValuerLoginTrialsExpiryPeroidInMinutes
			,SolicitorDormantIDReportPeriodInDays=@SolicitorDormantIDReportPeriodInDays
			,ValuerDormantIDReportPeriodInDays=@ValuerDormantIDReportPeriodInDays
			,SolicitorLoginPasswordHistoryCount=@SolicitorLoginPasswordHistoryCount
			,ValuerLoginPasswordHistoryCount=@ValuerLoginPasswordHistoryCount
			,SolicitorLoginPasswordMaxExpiryDays=@SolicitorLoginPasswordMaxExpiryDays
			,ValuerLoginPasswordMaxExpiryDays=@ValuerLoginPasswordMaxExpiryDays
			,SolicitorLoginPasswordMaxExpiryWarningDays=@SolicitorLoginPasswordMaxExpiryWarningDays
			,ValuerLoginPasswordMaxExpiryWarningDays=@ValuerLoginPasswordMaxExpiryWarningDays
			,SolicitorPasswordMinCharacters=@SolicitorPasswordMinCharacters
			,ValuerPasswordMinCharacters=@ValuerPasswordMinCharacters
			,SolicitorSessionInMinutes=@SolicitorSessionInMinutes
			,ValuerSessionInMinutes=@ValuerSessionInMinutes
			,InternalUserSessionInMinutes      =@InternalUserSessionInMinutes
			,InternalUserDormantIDReportPeriodInDays  =@InternalUserDormantIDReportPeriodInDays
			--,InternalUserLoginTrialsExpiryPeroidInMinutes  =@InternalUserLoginTrialsExpiryPeroidInMinutes
			,InternalUserLoginTrialsNumberOfLoginAllowed  =@InternalUserLoginTrialsNumberOfLoginAllowed
			, lastupdateduser = @lastupdateduser
			, lastupdateddate = getdate()
		
		update DefaultPassword_Setting
		set [password]= @solicitor_password
		where [type] = 'SolicitorLogin'

		update DefaultPassword_Setting
		set [password]= @valuer_password
		where [type] = 'ValuerLogin'

	end 	

	if (@error = '')
	begin
		-- start get new inserted primary key value 
		--declare @OperationPrimaryKeysValue nvarchar(max)

		--select @OperationPrimaryKeysValue = AttorneyNameID
		--from SQLDUMakerDP_AttorneyName
		--where AttorneyName = @AttorneyName
		-- end get new inserted primary key value

		-- start get table name, primary keys and operation 
		declare @tablename nvarchar(100),
			@operation nvarchar(100),
			@OperationPrimaryKeys nvarchar(max)

		set @tablename = 'IntUsr_Adm_SecuritySetting ' 
		set @operation = 'EDIT'
		--set @OperationPrimaryKeys = 'AttorneyNameID'
		-- end get table name, primary keys and operation 		
			
		-- start get operator 
		declare @operator nvarchar(100)
		set @operator = @lastupdateduser
		-- start get operator 
		
		/*
		select @fieldname = @fieldname + COLUMN_NAME + ', ' 
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @tablename
			and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
		

		set @ConcatenatedFieldsName = SUBSTRING(@fieldname, 0, LEN(@fieldname))
		-- end get Concatenated field name 

		-- end get Concatenated fields new values 
		declare @ConcatenatedFieldsNamePlus nvarchar(max), 															
			@ConcatenatedNewValue nvarchar(max)
						
		SET @ConcatenatedFieldsNamePlus = ''						
			
		select @ConcatenatedFieldsNamePlus = @ConcatenatedFieldsNamePlus + 'isnull(cast(' + COLUMN_NAME + ' as varchar(max)),'''') + '','' +' 
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @tablename
			and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
			
		declare @queryResult nvarchar(max)
	
		declare @query nvarchar(max)
		set @query = ''
		set @query = @query + ' select @tempqueryResult=' + SUBSTRING(@ConcatenatedFieldsNamePlus, 0, LEN(@ConcatenatedFieldsNamePlus)) 
		set @query = @query + ' from ' + @tablename
		set @query = @query + ' where AttorneyNameID = ' + @OperationPrimaryKeysValue

		select @query

		EXECUTE sp_executesql @query, N'@tempqueryResult nvarchar(max) OUTPUT', @tempqueryResult=@queryResult OUTPUT
		set @queryResult = ltrim(rtrim(@queryResult))
		*/
		declare @ConcatenatedFieldsNamePlus nvarchar(max), 															
			@ConcatenatedNewValue nvarchar(max)

		--set @ConcatenatedNewValue = SUBSTRING(@queryResult,1, LEN(@queryResult)-1)
		--set @ConcatenatedNewValue = @SolicitorLoginTrialsNumberOfLoginAllowed +','+@SolicitorLoginTrialsExpiryPeroidInMinutes +','+@ValuerLoginTrialsNumberOfLoginAllowed +','+@ValuerLoginTrialsExpiryPeroidInMinutes +
		set @ConcatenatedNewValue = @SolicitorLoginTrialsNumberOfLoginAllowed +','+@ValuerLoginTrialsNumberOfLoginAllowed +
				','+@SolicitorDormantIDReportPeriodInDays +','+@ValuerDormantIDReportPeriodInDays +','+@SolicitorLoginPasswordHistoryCount +','+@ValuerLoginPasswordHistoryCount +','+@SolicitorLoginPasswordMaxExpiryDays +
				','+@ValuerLoginPasswordMaxExpiryDays +','+@SolicitorLoginPasswordMaxExpiryWarningDays +','+@ValuerLoginPasswordMaxExpiryWarningDays +','+@SolicitorPasswordMinCharacters +','+@ValuerPasswordMinCharacters +
				--','+@SolicitorSessionInMinutes +','+@ValuerSessionInMinutes +','+@InternalUserSessionInMinutes       +','+@InternalUserDormantIDReportPeriodInDays   +','+@InternalUserLoginTrialsExpiryPeroidInMinutes   +
				','+@SolicitorSessionInMinutes +','+@ValuerSessionInMinutes +','+@InternalUserSessionInMinutes       +','+@InternalUserDormantIDReportPeriodInDays   +
				','+@InternalUserLoginTrialsNumberOfLoginAllowed   +','+@solicitor_password +','+@valuer_password 
			

		-- end get Concatenated fields new values
		-- insert into admin log
		INSERT INTO [dbo].[AdminOperationAuditLog]
			([TableName]
			,[Operation]
			,[OperationPrimaryKeys]
			,[OperationPrimaryKeysValue]
			,[ConcatenatedFieldsName]
			,[ConcatenatedOriginalValue]
			,[ConcatenatedNewValue]
			,[Operator]
			,[InsertedDateTime])
		values (@tablename, @operation, @OperationPrimaryKeys, NULL, @fieldname, @ConcatenatedOriginalValue,@ConcatenatedNewValue, @operator, getdate() )

	end 
	
end 
GO
