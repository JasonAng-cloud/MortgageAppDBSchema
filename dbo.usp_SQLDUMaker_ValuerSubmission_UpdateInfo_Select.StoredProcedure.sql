/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_UpdateInfo_Select]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_ValuerSubmission_UpdateInfo_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_ValuerSubmission_UpdateInfo_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_UpdateInfo_Select]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[usp_SQLDUMaker_ValuerSubmission_UpdateInfo_Select]
as
begin

	SELECT 
		LOADS.[ARN] as [ARN]
      ,LOADS.[Status] as [Status]
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
      --,[DateOfLOAcceptance]
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
      ,LOADS.[ValuerCode]
      ,[ValuerEmail]
      ,[ValuerName]
      ,[VerbalIndicativeValue]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION]
	  , valuer.Status as ValuerStatus
	   , DATEDIFF(day, valuer.UpdatedDate, getdate()) as aging		   
	   --, DATEDIFF(day, dumaker.UpdatedDate, getdate()) as aging	
	  , case when dumaker.DUMakerEmail is null then dumaker_lowerOMV.dumakeremail else dumaker.DUMakerEmail end as lastmodifieduser 	
	  --, case when dumaker.DUMakerEmail is null then dumaker_lowerOMV.UpdatedDate else dumaker.UpdatedDate end as lastmodifieddate 		  
	  , case when dumaker.DUMakerEmail is null then FORMAT (dumaker_lowerOMV.UpdatedDate, 'dd/MM/yyyy') else FORMAT (dumaker.UpdatedDate, 'dd/MM/yyyy') end as lastmodifieddate 		  
	  --, valuer.UpdatedDate as submissiondate 
	  ,FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') as submissiondate
	  FROM [dbo].[SQLLOADS] LOADS
	  INNER JOIN [dbo].SQLValuerDPSubmission valuer on valuer.arn = LOADS.arn
	  INNER JOIN [dbo].SQLValuerDPSubmission_UpdateInfo vUpdateInfo on vUpdateInfo.arn = LOADS.arn
	   left join SQLDUMakerDP_ValuerSubmission dumaker on dumaker.arn = valuer.arn 
	  left join SQLDUMakerDP_ValuerSubmission_LoweredOMV dumaker_lowerOMV on dumaker_lowerOMV.arn = valuer.arn 
	  where valuer.Status in ('UpdateInfo')
		

end 


GO
