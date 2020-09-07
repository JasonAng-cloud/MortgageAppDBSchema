/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_UpdateInfo_Select]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_SolicitorSubmission_UpdateInfo_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_SolicitorSubmission_UpdateInfo_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_UpdateInfo_Select]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_UpdateInfo_Select]
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
      --,[DateOfLOAcceptance]
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
      ,LOADS.[SolicitorCode] as [SolicitorCode]
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
	  , solicitor.Status as SolicitorStatus
	  , DATEDIFF(day, solicitor.UpdatedDate, getdate()) as aging	
	  , case when dumaker.DUMakerEmail is null then dumaker_reject.dumakeremail else dumaker.DUMakerEmail end as lastmodifieduser 	
	  --, case when dumaker.DUMakerEmail is null then dumaker_reject.UpdatedDate else dumaker.UpdatedDate end as lastmodifieddate 		  
	  , case when dumaker.DUMakerEmail is null then FORMAT (dumaker_reject.UpdatedDate, 'dd/MM/yyyy') else FORMAT (dumaker.UpdatedDate, 'dd/MM/yyyy') end as lastmodifieddate 		  
	  --, solicitor.UpdatedDate as submissiondate 
	  , FORMAT (solicitor.UpdatedDate, 'dd/MM/yyyy') as submissiondate
	  FROM [dbo].[SQLLOADS] LOADS
	  INNER JOIN [dbo].[SQLSolicitorDPSubmission] solicitor on solicitor.arn = LOADS.arn
	  INNER JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] ui on ui.arn = LOADS.arn
	   left join SQLDUMakerDP_SolicitorSubmission dumaker on dumaker.arn = solicitor.arn 
	  left join SQLDUMakerDP_SolicitorSubmission_Rejected dumaker_reject on dumaker_reject.arn = solicitor.arn 
	  --where 			
		--solicitor.Status in ('UpdateInfo')

end 


GO
