/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM6]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_GenerateUAM6]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_GenerateUAM6]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM6]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_InternalUserRole_GenerateUAM6]
as
begin
	SELECT   UserRoleName,					
		case when [IsDUMakerDocumentation] = 1 then 'True'
			when [IsDUMakerValuation] = 1 then 'True' 
			when [IsMortgageAdmin] = 1 then 'True'  
			when [IsDisbMaker] = 1 then 'True'  
			when [IsDisbChecker] = 1 then 'True' 
			when [IsRCOMaker] = 1 then 'True'  
			when [IsRCOChecker] = 1 then 'True' 
			when [IsTBOMaker] = 1 then 'True'  
			when [IsTBOChecker] = 1 then 'True' 
			else '' 
		end as [Case Inquiry (Complete)],
		case when [IsDUMakerDocumentation] = 1 then 'True' 		
			when [IsMortgageAdmin] = 1 then 'True'  
			else '' 
		end as [Document Unit]	,
		case when [IsDUMakerValuation] = 1 then 'True' 		
			when [IsMortgageAdmin] = 1 then 'True'  
			else '' 
		end as [Valuation Unit]	,
		case when [IsDUMakerDocumentation] = 1 then 'True' 
			when [IsDUMakerValuation] = 1 then 'True' 
			when [IsMortgageAdmin] = 1 then 'True'  
			when [IsDisbMaker] = 1 then 'True'  
			when [IsDisbChecker] = 1 then 'True' 
			when [IsRCOMaker] = 1 then 'True'  
			when [IsRCOChecker] = 1 then 'True' 
			when [IsTBOMaker] = 1 then 'True'  
			when [IsTBOChecker] = 1 then 'True' 
			else '' 
		end as [Update LOADS data]	,
		case when [IsMortgageAdmin] = 1 then 'True' 				
			else '' 
		end as [Parameter Maintenance]	,
		case when [IsDUMakerDocumentation] = 1 then 'True' 
			when [IsDUMakerValuation] = 1 then 'True' 
			when [IsMortgageAdmin] = 1 then 'True'  
			when [IsDisbMaker] = 1 then 'True'  
			when [IsDisbChecker] = 1 then 'True' 
			when [IsRCOMaker] = 1 then 'True'  
			when [IsRCOChecker] = 1 then 'True' 
			when [IsTBOMaker] = 1 then 'True'  
			when [IsTBOChecker] = 1 then 'True' 
			else '' 
		end as [Manual Form Generator]	,
		case when [IsMortgageAdmin] = 1 then 'True' 		
			when [IsITAdminApplication] = 1 then 'True'  
			when [IsITAdminSecurity] = 1 then 'True'  
			else '' 
		end as [Security Report]	,
		case when [IsMortgageAdmin] = 1 then 'True' 		
			when [IsITAdminApplication] = 1 then 'True'  		
			else '' 
		end as [Dynamic Query Execution]	,
		case when [IsITAdminApplication] = 1 then 'True' 					
			else '' 
		end as [Application Settings],
		case when [IsITAdminSecurity] = 1 then 'True' 					
			else '' 
		end as [User Management]	,
		case when [IsITAdminSecurity] = 1 then 'True' 					
			else '' 
		end as [Activate Inactive Users]	,
		case when [IsITAdminSecurity] = 1 then 'True' 					
			else '' 
		end as [Security Feature Setting]	,
		case when [IsMortgageAdmin] = 1 then 'True' 					
			else '' 
		end as [Task Reassignment]	,
		case when [IsDUMakerDocumentation] = 1 then 'True'
			when [IsDUMakerValuation] = 1 then 'True' 
			when [IsMortgageAdmin] = 1 then 'True'  
			when [IsDisbMaker] = 1 then 'True'  
			when [IsDisbChecker] = 1 then 'True' 
			when [IsRCOMaker] = 1 then 'True'  
			when [IsRCOChecker] = 1 then 'True' 
			when [IsTBOMaker] = 1 then 'True'  
			when [IsTBOChecker] = 1 then 'True' 
			else '' 
		end as [Workflow History]
	FROM [dbo].[InternalUserRole]	
end 
	


GO
