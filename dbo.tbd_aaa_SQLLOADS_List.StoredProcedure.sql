/****** Object:  StoredProcedure [dbo].[tbd_aaa_SQLLOADS_List]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_aaa_SQLLOADS_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_aaa_SQLLOADS_List]
GO
/****** Object:  StoredProcedure [dbo].[tbd_aaa_SQLLOADS_List]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

  CREATE procedure [dbo].[tbd_aaa_SQLLOADS_List]
  @arn nvarchar(max) = null
  as
  begin

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
      --,[CustomerID]
	   ,isnull(CustomerID,'N/A') as CustomerID
	   --,[ApplicantName]
      ,isnull([ApplicantName],'N/A') as [ApplicantName]
	   ,isnull(CustomerName,'N/A') as CustomerName
      --,[CustomerName]
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
      ,[PrimaryCustomerID]
      ,[SolTelNbr]
      ,[SolFaxNbr]
      ,[ValTelNbr]
      ,[ValFaxNbr]
	from SQLLOADS
	where arn = @arn 
  end 
GO
