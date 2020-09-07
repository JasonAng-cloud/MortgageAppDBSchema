/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_Add]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_BankInfo_Add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_BankInfo_Add]
GO
/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_Add]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE      procedure [dbo].[aaSolDisbursementSubmission_BankInfo_Add]
@bank nvarchar(200) = null,
@RentasFlag bit = null,
@IBGFlag bit = null,
@HLBFlag bit = null,
@LoginUserEmail nvarchar(max) = null, 	
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	if (@bank is null or ltrim(rtrim(@bank)) = '')
	begin
		set @error = 'Please fill in bank'
	end 

	if exists 
	(
		select 1
		from [aaSolDisbursementSubmission_BankInfo]
		where [Bank] = @bank 
	)
	begin
		set @error = @bank + ' existed'
	end 

	if (@error='')	
	begin
		insert into [aaSolDisbursementSubmission_BankInfo]
		values (@bank, isnull(@RentasFlag,0), isnull(@IBGFlag,0), isnull(@HLBFlag,0), getdate(), getdate(),@LoginUserEmail, @LoginUserEmail )

		IF (@@ROWCOUNT <> 0) 
		BEGIN
			-- start get new inserted primary key value 
			declare @OperationPrimaryKeysValue nvarchar(max)

			select @OperationPrimaryKeysValue = bank
			from [aaSolDisbursementSubmission_BankInfo]
			where bank = @bank
			-- end get new inserted primary key value

			-- start get table name, primary keys and operation 
			declare @tablename nvarchar(100),
				@operation nvarchar(100),
				@OperationPrimaryKeys nvarchar(max)

			set @tablename = 'aaSolDisbursementSubmission_BankInfo' 
			set @operation = 'ADD'
			set @OperationPrimaryKeys = 'Bank'
			-- end get table name, primary keys and operation 		
			
			-- start get operator 
			declare @operator nvarchar(100)
			set @operator = @LoginUserEmail
			-- start get operator 

			-- start get original fields value 		
			declare @ConcatenatedOriginalValue nvarchar(max)
			set @ConcatenatedOriginalValue = ''
			-- end get original fields value 

			-- start get Concatenated field name 
			declare @fieldname nvarchar(max), 
				@ConcatenatedFieldsName nvarchar(max)
			
			SET @fieldname = ''
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
			
			select @ConcatenatedFieldsNamePlus = @ConcatenatedFieldsNamePlus + 'cast(' + COLUMN_NAME + ' as varchar(max)) + '','' +' 
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @tablename
				and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
			
			declare @queryResult nvarchar(max)
	
			declare @query nvarchar(max)
			set @query = ''
			set @query = @query + ' select @tempqueryResult=' + SUBSTRING(@ConcatenatedFieldsNamePlus, 0, LEN(@ConcatenatedFieldsNamePlus)) 
			set @query = @query + ' from ' + @tablename
			--set @query = @query + ' where '+ @OperationPrimaryKeys +'= ' + @OperationPrimaryKeysValue
			set @query = @query + ' where '+@OperationPrimaryKeys+' = ''' + @OperationPrimaryKeysValue + ''' '
			--select @query

			EXECUTE sp_executesql @query, N'@tempqueryResult nvarchar(max) OUTPUT', @tempqueryResult=@queryResult OUTPUT
			set @queryResult = ltrim(rtrim(@queryResult))

			set @ConcatenatedNewValue = SUBSTRING(@queryResult,1, LEN(@queryResult)-1)
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
			values (@tablename, @operation, @OperationPrimaryKeys, @OperationPrimaryKeysValue, @ConcatenatedFieldsName, @ConcatenatedOriginalValue,@ConcatenatedNewValue, @operator, getdate() )


		END 
	end 
	
	  
end 
GO
