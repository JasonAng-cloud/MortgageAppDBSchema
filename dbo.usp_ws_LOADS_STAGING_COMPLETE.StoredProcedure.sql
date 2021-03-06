/****** Object:  StoredProcedure [dbo].[usp_ws_LOADS_STAGING_COMPLETE]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_LOADS_STAGING_COMPLETE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_LOADS_STAGING_COMPLETE]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_LOADS_STAGING_COMPLETE]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_ws_LOADS_STAGING_COMPLETE]	
as
begin
		
	delete from SQLLOADS_staging
	where arn in (select arn from sqlloads)

	if exists (
	select * FROM [dbo].SQLLOADS_staging
	)
	begin
		INSERT INTO [dbo].[SQLLOADS]
           ([ARN]
           ,[Status]
           ,[BranchAddr1]
           ,[BranchAddr2]
           ,[BranchAddr3]
           ,[BranchAddrCity]
           ,[BranchAddrCountry]
           ,[BranchAddrPostCode]
           ,[BranchAddrState]
           ,[BranchManagerEmailAddress]
           ,[BranchManagerName]
           ,[ClosingBranch]
           ,[DateOfLOAcceptance]
           ,[FinancingType]
           ,[MortgateCenterCode]
           ,[MortgateCenterEmail]
           ,[PFSalesEmailAddress]
           ,[PFCSalesName]
           ,[SolicitorAccountNbr]
           ,[SolicitorAccountType]
           ,[SolicitorAddr1]
           ,[SolicitorAddr2]
           ,[SolicitorAddr3]
           ,[SolicitorAddrCity]
           ,[SolicitorAddrCountry]
           ,[SolicitorAddrPostCode]
           ,[SolicitorAddrState]
           ,[SolicitorEmail]
           ,[SolInternalStatus]
           ,[SolicitorName]
           ,[SolicitorCode]
           ,[TopUpLoanIndicator]
           ,[ChargorIDNumber]
           ,[ChargorName]
           ,[CustomerAddr1]
           ,[CustomerAddr2]
           ,[CustomerAddr3]
           ,[CustomerAddrCity]
           ,[CustomerAddrCountry]
           ,[CustomerAddrPostCode]
           ,[CustomerAddrState]
           ,[ApplicantEmail]
           ,[CustomerID]
           ,[ApplicantName]
           ,[CustomerName]
           ,[EStatementFlagIndicator]
           ,[GuarantorIDNumber]
           ,[GuarantorName]
           ,[DisbursementManner]
           ,[LoanAmount]
           ,[FacilityAmount1]
           ,[FacilityAmount2]
           ,[FacilityAmount3]
           ,[FacilityAmount4]
           ,[FinancingProductName1]
           ,[FinancingProductName2]
           ,[FinancingProductName3]
           ,[FinancingProductName4]
           ,[GracePeriod]
           ,[LegalFeesFinancedAmount]
           ,[MRTAFinancedAmount]
           ,[PurposeCode]
           ,[TotalFinancingAmount]
           ,[ValuationFeesFinancedAmount]
           ,[BuildUpArea]
           ,[DeveloperCode]
           ,[DeveloperName]
           ,[CollateralPurpose]
           ,[LandArea]
           ,[ProjectCode]
           ,[ProjectName]
           ,[PropertyAddress]
           ,[PropertyType]
           ,[ValuationRequired]
           ,[TitleDetailsLO]
           ,[ValuerAccountNBR]
           ,[ValuerAccountType]
           ,[ValuerAddr1]
           ,[ValuerAddr2]
           ,[ValuerAddr3]
           ,[ValuerAddrCity]
           ,[ValuerAddrCountry]
           ,[ValuerAddrPostCode]
           ,[ValuerAddrState]
           ,[ValuerCode]
           ,[ValuerEmail]
           ,[ValuerName]
           ,[VerbalIndicativeValue]
           ,[RESPONSECODE]
           ,[RESPONSEDESCRIPTION]           
           ,[CreatedDate]
           ,[UpdatedDate]
		     , PrimaryCustomerID
			   , SolTelNbr	   
			   , SolFaxNbr
			   , ValTelNbr
			   , ValFaxNbr
			   )	
		SELECT [ARN]
			,[Status]
			,[BranchAddr1]
			,[BranchAddr2]
			,[BranchAddr3]
			,[BranchAddrCity]
			,[BranchAddrCountry]
			,[BranchAddrPostCode]
			,[BranchAddrState]
			,[BranchManagerEmailAddress]
			,[BranchManagerName]
			,[ClosingBranch]
			,[DateOfLOAcceptance]
			,[FinancingType]
			,[MortgateCenterCode]
			,[MortgateCenterEmail]
			,[PFSalesEmailAddress]
			,[PFCSalesName]
			,[SolicitorAccountNbr]
			,[SolicitorAccountType]
			,[SolicitorAddr1]
			,[SolicitorAddr2]
			,[SolicitorAddr3]
			,[SolicitorAddrCity]
			,[SolicitorAddrCountry]
			,[SolicitorAddrPostCode]
			,[SolicitorAddrState]
			,[SolicitorEmail]
			,[SolInternalStatus]
			,[SolicitorName]
			,[SolicitorCode]
			,[TopUpLoanIndicator]
			,[ChargorIDNumber]
			,[ChargorName]
			,[CustomerAddr1]
			,[CustomerAddr2]
			,[CustomerAddr3]
			,[CustomerAddrCity]
			,[CustomerAddrCountry]
			,[CustomerAddrPostCode]
			,[CustomerAddrState]
			,[ApplicantEmail]
			,[CustomerID]
			,[ApplicantName]
			,[CustomerName]
			,[EStatementFlagIndicator]
			,[GuarantorIDNumber]
			,[GuarantorName]
			,[DisbursementManner]
			,[LoanAmount]
			,[FacilityAmount1]
			,[FacilityAmount2]
			,[FacilityAmount3]
			,[FacilityAmount4]
			,[FinancingProductName1]
			,[FinancingProductName2]
			,[FinancingProductName3]
			,[FinancingProductName4]
			,[GracePeriod]
			,[LegalFeesFinancedAmount]
			,[MRTAFinancedAmount]
			,[PurposeCode]
			,[TotalFinancingAmount]
			,[ValuationFeesFinancedAmount]
			,[BuildUpArea]
			,[DeveloperCode]
			,[DeveloperName]
			,[CollateralPurpose]
			,[LandArea]
			,[ProjectCode]
			,[ProjectName]
			,[PropertyAddress]
			,[PropertyType]
			,[ValuationRequired]
			,[TitleDetailsLO]
			,[ValuerAccountNBR]
			,[ValuerAccountType]
			,[ValuerAddr1]
			,[ValuerAddr2]
			,[ValuerAddr3]
			,[ValuerAddrCity]
			,[ValuerAddrCountry]
			,[ValuerAddrPostCode]
			,[ValuerAddrState]
			,[ValuerCode]
			,[ValuerEmail]
			,[ValuerName]
			,[VerbalIndicativeValue]
			,[RESPONSECODE]
			,[RESPONSEDESCRIPTION]
			,[CreatedDate]
			,[UpdatedDate]
			, PrimaryCustomerID
			, SolTelNbr	   
			, SolFaxNbr
			, ValTelNbr
			, ValFaxNbr
		FROM [dbo].SQLLOADS_staging		
	end 	

	declare @RequiredValuation bit , @arn nvarchar(max), @ValCode nvarchar(max), @SolCode nvarchar(max)
	DECLARE cursor_LoadsStaging CURSOR
	FOR SELECT arn ,
			ValuationRequired,
			[ValuerCode],
			[SolicitorCode]
		FROM 
			SQLLOADS_staging

	OPEN cursor_LoadsStaging;

	FETCH NEXT FROM cursor_LoadsStaging INTO 
		@arn, 
		@RequiredValuation,
		@valcode,
		@SolCode
		;

	WHILE @@FETCH_STATUS = 0
	BEGIN
			
		if (@RequiredValuation = 1)
		begin
			insert into WorkflowHistory
			values ('Valuation Report',@arn,'Case Received By Valuer',@valcode,null,getdate())
		end 

		insert into WorkflowHistory
		values ('Documentation',@arn,'Case Received By Solicitor',@SolCode,null,getdate())

		FETCH NEXT FROM cursor_LoadsStaging INTO 
			@arn, 
			@RequiredValuation,
			@valcode,
			@SolCode;
	END;

	CLOSE cursor_LoadsStaging;

	DEALLOCATE cursor_LoadsStaging;		

	declare @newCDC datetime 
	select 	@newCDC = tempLICDC
	from tblCDC

	update tblCDC
	set newLICDC = @newCDC


end 

GO
