/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_GetRecordByARN]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmission_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmission_GetRecordByARN]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_GetRecordByARN]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE   PROCEDURE [dbo].[usp_SQLValuerDPSubmission_GetRecordByARN]
@arn varchar(100) = null
as
begin
			  
	SELECT LOADS.[ARN] as [ARN]
		  ,LOADS.[Status] as [LOADS_Status]
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
		  ,FORMAT (DateOfLOAcceptance, 'dd/MM/yyyy') as DateOfLOAcceptance		  
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
		  ,isnull([CustomerID],'N/A') as [CustomerID]
		  ,isnull([ApplicantName],'N/A') as [ApplicantName]
		  ,isnull([CustomerName],'N/A') as [CustomerName]
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
		  ,LOADS.[ValuerCode]
		  ,[ValuerEmail]
		  ,[ValuerName]
		  ,[VerbalIndicativeValue]
		  ,[RESPONSECODE]
		  ,[RESPONSEDESCRIPTION]     		  
		   --,FORMAT (LOADS.[CreatedDate], 'dd/MM/yyyy') as [CreatedDate]
			--,FORMAT (LOADS.[UpdatedDate], 'dd/MM/yyyy') as UpdatedDate		  
		  ,case when loweredOMV.arn is not null then 'LowerOMV' else isnull(VALUER.[Status],'New') end as ValuerStatus
		  , DATEDIFF(day, [DateOfLOAcceptance], getdate()) as aging				 		  
		  ,VALUER.[ValuerReportAttachmentURL]
		  ,VALUER.[ValuerReportAttachment]
		  ,VALUER.[ValuerReportAttachmentDate]
		  ,VALUER.[VRInstructionDate]
		  ,VALUER.[ValuerReference]
		  ,VALUER.[PersonInChargeName]
		  ,VALUER.[VUpdateInfoStatus]
		  ,VALUER.[VLowerOMVStatus]
		  ,VALUER.[VUpdateInfoStatusOthers]
		  ,VALUER.[VLowerOMVReasons]
		  ,VALUER.[DateOfValuation]
		  ,VALUER.[MarketValue]
		  ,VALUER.[FireInsuranceValue]
		  ,VALUER.[InvoiceNumber]
		  ,VALUER.[ShortfallAmount]
		  ,VALUER.[Declaration]		  
		  ,VALUER.[ValuationFeeFinancedByBankFlag]		  
		  ,isnull([LF_PayeeName],[ValuerName]) as [LF_PayeeName]
		  ,[LF_BilledAmount]
		  ,isnull([LF_AccountNumber],ValuerAccountNBR) as [LF_AccountNumber]
		  ,'HLBB/ HLISB' as [LF_Bank]
		  ,[LF_PaymentDescription]
		  ,'HLBB/ HLISB' as [LF_PaymentMode]
		  ,VALUER.[OutputPDFID]
		  ,FORMAT (VALUER.[CreatedDate], 'dd/MM/yyyy') as [CreatedDate]
		  ,FORMAT (VALUER.[UpdatedDate], 'dd/MM/yyyy') as UpdatedDate	
		  ,completed
	  FROM [SQLLOADS] LOADS
		left join [dbo].[SQLValuerDPSubmission] VALUER	on loads.arn = VALUER.arn			
		LEFT OUTER JOIN [DBO].SQLDUMakerDP_ValuerSubmission_LoweredOMV loweredOMV ON loweredOMV.ARN = LOADS.ARN 
	  WHERE 
		--LOADS.ValuationRequired = 1  		
		--AND LOADS.ARN NOT IN (SELECT LOADS.ARN FROM [dbo].[SQLLOADS] LOADS INNER JOIN [DBO].[SQLValuerDPSubmission] VALUER ON VALUER.ARN = LOADS.ARN and VALUER.Status IN ('Submitted', 'LowerOMV','Cancelled','Resubmitted' ) )
		--and loads.arn not in (select arn from [SQLValuerDPSubmission_staging] )
		--and 
		LOADS.arn = @arn 		
end 



GO
