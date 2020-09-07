/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_Completed]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_ValuerSubmission_Select_Completed]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_Completed]
GO
/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_Completed]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_Completed]
as
begin

	SELECT LOADS.[ARN] as [ARN]
      --,[LendingType]
     -- ,[SalesPersonCode]
      ,[FinancingType]
      ,[ProjectName]
      ,[ProjectCode]
      --,[LegalFeePartOfLoan]
      ,[ValuationRequired]
      --,[MRTAFeePartOfLoan]
      ,[LoanAmount]
      ,[DisbursementManner]
      ,[ApplicantName]
     -- ,[DOB]
      ,[ApplicantEmail]
      ,[MortgateCenterCode]
     -- ,[ApplicantAccountType]
      --,[ApplicantContactNo]
      ,[SolicitorEmail]
      ,[ValuerEmail]
      ,LOADS.[Status] as [Status]
      ,[ClosingBranch]
     -- ,[BranchAddress]
      ,[BranchAddr1]
      ,[BranchAddr2]
      ,[BranchAddr3]
      ,[BranchAddrPostCode]
      ,[BranchAddrCity]
      ,[BranchAddrState]
      ,[BranchAddrCountry]
      --,[SalesPersonName]
      --,[SalesPersonEmailAddress]
      ,[BranchManagerName]
      ,[BranchManagerEmailAddress]
      ,LOADS.[SolicitorCode] as [SolicitorCode]
      ,[SolicitorName]
      --,[SolicitorEmail2]
      ,[SolicitorAddr1]
      ,[SolicitorAddr2]
      ,[SolicitorAddr3]
      ,[SolicitorAddrPostCode]
      ,[SolicitorAddrCity]
      ,[SolicitorAddrState]
      ,[SolicitorAddrCountry]
      ,[SolicitorAccountType]
      ,[SolicitorAccountNbr]
      ,[TopUpLoanIndicator]
	  ,FORMAT (DateOfLOAcceptance, 'dd/MM/yyyy') as DateOfLOAcceptance
      --,[DateOfLOAcceptance]
      ,[CustomerName]
      ,[CustomerID]
      ,[CustomerAddr1]
      ,[CustomerAddr2]
      ,[CustomerAddr3]
      ,[CustomerAddrPostCode]
      ,[CustomerAddrCity]
      ,[CustomerAddrState]
      ,[CustomerAddrCountry]
      ,[EStatementFlagIndicator]
      ,[ChargorName]
      ,[ChargorIDNumber]
      ,[GuarantorName]
      ,[GuarantorIDNumber]
      --,[RelationshipToApplication]
      --,[RelationshipToPrincipal]
      ,[PurposeCode]
     -- ,[MainProduct]
      ,[TotalFinancingAmount]
      ,[LegalFeesFinancedAmount]
      ,[ValuationFeesFinancedAmount]
      ,[MRTAFinancedAmount]
      ,[GracePeriod]
      ,[PropertyType]
      ,[PropertyAddress]
      ,[TitleDetailsLO]
      ,[DeveloperCode]
      ,[DeveloperName]
      ,[LandArea]
      ,[BuildUpArea]
      ,valuer.[ValuerCode] as [ValuerCode]
      ,[ValuerName]
      ,[ValuerAddr1]
      ,[ValuerAddr2]
      ,[ValuerAddr3]
      ,[ValuerAddrPostCode]
      ,[ValuerAddrCity]
      ,[ValuerAddrState]
      ,[ValuerAddrCountry]
      ,[ValuerAccountType]
      ,[ValuerAccountNBR]
      ,[VerbalIndicativeValue]
      ,[MortgateCenterEmail]
      --,[ValuationFeePartOfLoan]
      --,[AccountType]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION]
      --,[MortgageCentre]
      --,[TotalFinancialAmount]
      --,[SolicitorType]
      --,[FinancingPurpose]
      --,[BorrowersIDNumber]
      ,[PFCSalesName]
      ,[PFSalesEmailAddress]
	  , valuer.Status as ValuerStatus
	   , DATEDIFF(day, valuer.UpdatedDate, getdate()) as aging	
	  , dumaker.DUMakerEmail as lastmodifieduser 	
	  --, dumaker.UpdatedDate as lastmodifieddate 	
	  ,FORMAT (dumaker.UpdatedDate, 'dd/MM/yyyy') as lastmodifieddate	  
	  --, valuer.UpdatedDate as submissiondate 
	  ,FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') as submissiondate	  
	  FROM [dbo].[SQLLOADS] LOADS
	  INNER JOIN [dbo].SQLValuerDPSubmission valuer on valuer.arn = LOADS.arn
	   inner join SQLDUMakerDP_ValuerSubmission dumaker on dumaker.arn = valuer.arn 
	  where valuer.Status in ('Submitted', 'Cancelled', 'LowerOMV','Resubmitted')
		--and LOADS.ARN not in (select arn from K2Instance where Workflow = 'DPDUMakerValuerApproval') 
		and LOADS.ARN in (select arn from [dbo].SQLDUMakerDP_ValuerSubmission where Status in ('Completed'))
		

end 


GO
