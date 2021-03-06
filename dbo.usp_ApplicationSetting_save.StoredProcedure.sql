/****** Object:  StoredProcedure [dbo].[usp_ApplicationSetting_save]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ApplicationSetting_save]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ApplicationSetting_save]
GO
/****** Object:  StoredProcedure [dbo].[usp_ApplicationSetting_save]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[usp_ApplicationSetting_save]
@CRA02_Documentation_ProfileName nvarchar(max) =null
,@CRA02_Documentation_LoginUser nvarchar(max) =null
,@CRA02_Documentation_DefaultFileName nvarchar(max) =null
,@CRA02_Documentation_EDMSUploadFolder nvarchar(max) =null
,@CRA02_Documentation_Category nvarchar(max) =null
,@CRA04_Valuation_ProfileName nvarchar(max) =null
,@CRA04_Valuation_LoginUser nvarchar(max) =null
,@CRA04_Valuation_DefaultFileName nvarchar(max) =null
,@CRA04_Valuation_EDMSUploadFolder nvarchar(max) =null
,@CRA04_Valuation_Category nvarchar(max) =null
,@CRA05_Disbursement_ProfileName nvarchar(max) =null
,@CRA05_Disbursement_LoginUser nvarchar(max) =null
,@CRA05_Disbursement_DefaultFileName nvarchar(max) =null
,@CRA05_Disbursement_EDMSUploadFolder nvarchar(max) =null
,@CRA05_Disbursement_Category nvarchar(max) =null
,@CRA06_Billings_ProfileName nvarchar(max) =null
,@CRA06_Billings_LoginUser nvarchar(max) =null
,@CRA06_Billings_DefaultFileName nvarchar(max) =null
,@CRA06_Billings_EDMSUploadFolder nvarchar(max) =null
,@CRA06_Billings_Category nvarchar(max) =null
,@DU1_Letter_URL nvarchar(max) =null
,@DU2_Letter_URL nvarchar(max) =null
,@LogoutURL_URL nvarchar(max) =null
,@SolicitorLogin_URL nvarchar(max) =null
,@ValuerLogin_URL nvarchar(max) =null
,@edms_letter_of_instruction_cdc_date datetime =null
,@edms_billing_cdc datetime =null
,@SolicitorDocSubPDF_Cancellation nvarchar(max) =null
,@SolicitorDocSubPDF_Submission nvarchar(max) =null
,@SolicitorDocSubPDF_UpdateInfo nvarchar(max) =null
,@ValuerVRSubPDF_UpdateInfo nvarchar(max) =null
,@ValuerVRSubPDF_Cancellation nvarchar(max) =null
,@ValuerVRSubPDF_LowerOMV nvarchar(max) =null
,@ValuerVRSubPDF_Submission nvarchar(max) =null
,@lastupdateduser nvarchar(max) =null
,@error nvarchar(max) = null output 
as
begin
	set @error = ''

	-- start get original fields value 		
	declare @ConcatenatedOriginalValue nvarchar(max)
	set @ConcatenatedOriginalValue = ''

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + 
		ProfileName +','+
		LoginUser +','+
		DefaultFileName +','+
		EDMSUploadFolder +','+
		Category 	
	from EDMS_Settings
	where EDMSDocType = 'CRA02 Documentation'	

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		ProfileName +','+
		LoginUser +','+
		DefaultFileName +','+
		EDMSUploadFolder +','+
		Category 	
	from EDMS_Settings
	where EDMSDocType = 'CRA04 Valuation'	

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		ProfileName +','+
		LoginUser +','+
		DefaultFileName +','+
		EDMSUploadFolder +','+
		Category 	
	from EDMS_Settings
	where EDMSDocType = 'CRA05 Disbursement'	

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		ProfileName +','+
		LoginUser +','+
		DefaultFileName +','+
		EDMSUploadFolder +','+
		Category 	
	from EDMS_Settings
	where EDMSDocType = 'CRA06 Billings'	

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'DU1'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'DU2'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'LogoutURL'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'SolicitorLogin'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'ValuerLogin'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'SolicitorDocSubPDF_Cancellation'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'SolicitorDocSubPDF_Submission'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'SolicitorDocSubPDF_UpdateInfo'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'ValuerVRSubPDF_UpdateInfo'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'ValuerVRSubPDF_Cancellation'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'ValuerVRSubPDF_LowerOMV'

		select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'ValuerVRSubPDF_Submission'

	--select @ConcatenatedOriginalValue
			
	-- end get original fields value 

	-- start get Concatenated field name 
	declare @fieldname nvarchar(max), 
		@ConcatenatedFieldsName nvarchar(max)
	
	--,CRA06_Billings_DefaultFileName ,CRA06_Billings_EDMSUploadFolder ,CRA06_Billings_Category ,DU1_Letter_URL ,DU2_Letter_URL ,LogoutURL_URL ,SolicitorLogin_URL ,ValuerLogin_URL ,edms_letter_of_instruction_cdc_date ,edms_billing_cdc  '
	SET @fieldname = ''
	SET @fieldname = 'CRA02_Documentation_ProfileName ,CRA02_Documentation_LoginUser ,CRA02_Documentation_DefaultFileName ,CRA02_Documentation_EDMSUploadFolder ,CRA02_Documentation_Category 		,CRA04_Valuation_ProfileName ,CRA04_Valuation_LoginUser ,CRA04_Valuation_DefaultFileName ,CRA04_Valuation_EDMSUploadFolder ,CRA04_Valuation_Category ,CRA05_Disbursement_ProfileName ,CRA05_Disbursement_LoginUser ,CRA05_Disbursement_DefaultFileName ,CRA05_Disbursement_EDMSUploadFolder ,CRA05_Disbursement_Category ,CRA06_Billings_ProfileName ,CRA06_Billings_LoginUser 		,CRA06_Billings_DefaultFileName ,CRA06_Billings_EDMSUploadFolder ,CRA06_Billings_Category ,DU1_Letter_URL ,DU2_Letter_URL ,LogoutURL_URL ,SolicitorLogin_URL ,ValuerLogin_URL,SolicitorDocSubPDF_Cancellation ,SolicitorDocSubPDF_Submission ,SolicitorDocSubPDF_UpdateInfo,ValuerVRSubPDF_UpdateInfo ,ValuerVRSubPDF_Cancellation ,ValuerVRSubPDF_LowerOMV ,ValuerVRSubPDF_Submission' 
			
	BEGIN TRY  
		update EDMS_Settings
		set ProfileName= @CRA02_Documentation_ProfileName,
			LoginUser= @CRA02_Documentation_LoginUser,
			DefaultFileName = @CRA02_Documentation_DefaultFileName,
			EDMSUploadFolder = @CRA02_Documentation_EDMSUploadFolder,
			Category = @CRA02_Documentation_Category
		where EDMSDocType = 'CRA02 Documentation'

		update EDMS_Settings
		set ProfileName= @CRA04_Valuation_ProfileName,
			LoginUser= @CRA04_Valuation_LoginUser,
			DefaultFileName = @CRA04_Valuation_DefaultFileName,
			EDMSUploadFolder = @CRA04_Valuation_EDMSUploadFolder,
			Category = @CRA04_Valuation_Category
		where EDMSDocType = 'CRA04 Valuation'

		update EDMS_Settings
		set ProfileName= @CRA05_Disbursement_ProfileName,
			LoginUser= @CRA05_Disbursement_LoginUser,
			DefaultFileName = @CRA05_Disbursement_DefaultFileName,
			EDMSUploadFolder = @CRA05_Disbursement_EDMSUploadFolder,
			Category = @CRA05_Disbursement_Category
		where EDMSDocType = 'CRA05 Disbursement'

		update EDMS_Settings
		set ProfileName= @CRA06_Billings_ProfileName,
			LoginUser= @CRA06_Billings_LoginUser,
			DefaultFileName = @CRA06_Billings_DefaultFileName,
			EDMSUploadFolder = @CRA06_Billings_EDMSUploadFolder,
			Category = @CRA06_Billings_Category
		where EDMSDocType = 'CRA06 Billings'

		update [URL_Setting]
		set [URL] = @DU1_Letter_URL
		where type = 'DU1' 

		update [URL_Setting]
		set [URL] = @DU2_Letter_URL
		where type = 'DU2' 

		update [URL_Setting]
		set [URL] = @LogoutURL_URL
		where type = 'LogoutURL'

		update [URL_Setting]
		set [URL] = @SolicitorLogin_URL
		where type = 'SolicitorLogin'

		update [URL_Setting]
		set [URL] = @SolicitorLogin_URL
		where type = 'SolicitorLALogin'

		update [URL_Setting]
		set [URL] = @ValuerLogin_URL
		where type = 'ValuerLogin'

		update [URL_Setting]
		set [URL] = @SolicitorDocSubPDF_Cancellation
		where type = 'SolicitorDocSubPDF_Cancellation'

		update [URL_Setting]
		set [URL] = @SolicitorDocSubPDF_Submission
		where type = 'SolicitorDocSubPDF_Submission'

		update [URL_Setting]
		set [URL] = @SolicitorDocSubPDF_UpdateInfo
		where type = 'SolicitorDocSubPDF_UpdateInfo'

		update [URL_Setting]
		set [URL] = @ValuerVRSubPDF_UpdateInfo
		where type = 'ValuerVRSubPDF_UpdateInfo'

		update [URL_Setting]
		set [URL] = @ValuerVRSubPDF_Cancellation
		where type = 'ValuerVRSubPDF_Cancellation'

		update [URL_Setting]
		set [URL] = @ValuerVRSubPDF_LowerOMV
		where type = 'ValuerVRSubPDF_LowerOMV'

		update [URL_Setting]
		set [URL] = @ValuerVRSubPDF_Submission
		where type = 'ValuerVRSubPDF_Submission'
		
		/*
		update [tblCDC]
		set [newLICDC] = @edms_letter_of_instruction_cdc_date, 
			[newBillingCDC] = @edms_billing_cdc
		*/
	END TRY  
	BEGIN CATCH  
		 set @error =  ERROR_NUMBER() +','+ ERROR_MESSAGE()
	END CATCH  
	
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

		set @tablename = 'IntUsr_Adm_ApplicationSetting' 
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
		set @ConcatenatedNewValue = @CRA02_Documentation_ProfileName +','+@CRA02_Documentation_LoginUser +','+@CRA02_Documentation_DefaultFileName +','+@CRA02_Documentation_EDMSUploadFolder +','+@CRA02_Documentation_Category 
			+','+@CRA04_Valuation_ProfileName +','+@CRA04_Valuation_LoginUser +','+@CRA04_Valuation_DefaultFileName +','+@CRA04_Valuation_EDMSUploadFolder +','+@CRA04_Valuation_Category 
			+','+@CRA05_Disbursement_ProfileName +','+@CRA05_Disbursement_LoginUser +','+@CRA05_Disbursement_DefaultFileName +','+@CRA05_Disbursement_EDMSUploadFolder +','+@CRA05_Disbursement_Category 
			+','+@CRA06_Billings_ProfileName +','+@CRA06_Billings_LoginUser +','+@CRA06_Billings_DefaultFileName +','+@CRA06_Billings_EDMSUploadFolder +','+@CRA06_Billings_Category +','+@DU1_Letter_URL 
			+','+@DU2_Letter_URL +','+@LogoutURL_URL +','+@SolicitorLogin_URL +','+@ValuerLogin_URL 			
			+','+@SolicitorDocSubPDF_Cancellation + ',' +@SolicitorDocSubPDF_Submission + ',' +@SolicitorDocSubPDF_UpdateInfo 
			+','+@ValuerVRSubPDF_UpdateInfo +',' +@ValuerVRSubPDF_Cancellation + ',' + @ValuerVRSubPDF_LowerOMV +',' + @ValuerVRSubPDF_Submission 
			--+','+isnull(cast(@edms_letter_of_instruction_cdc_date as nvarchar),'') +','+isnull(cast(@edms_billing_cdc  as nvarchar),'')			

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
