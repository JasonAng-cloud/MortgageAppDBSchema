/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM3]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_GenerateUAM3]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_GenerateUAM3]
GO
/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM3]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[usp_InternalUserRole_GenerateUAM3]
as
begin	
	with cte (Access)
	as
	(
		SELECT distinct Access
		FROM   
			(SELECT UserRoleName, IsDUMakerDocumentation, IsDUMakerValuation, IsDisbMaker,IsDisbChecker,  IsRCOMaker, IsRCOChecker, IsTBOMaker, IsTBOChecker, IsMortgageAdmin,IsITAdminApplication,  IsITAdminSecurity
			FROM InternalUserRole) p  
		UNPIVOT  
			(AccessValue FOR Access IN   
				(IsDUMakerDocumentation, IsDUMakerValuation, IsDisbMaker,IsDisbChecker,  IsRCOMaker, IsRCOChecker, IsTBOMaker, IsTBOChecker, IsMortgageAdmin,IsITAdminApplication,  IsITAdminSecurity)  
		)AS unpvt 
	),
	cte1(Access, UserRoleName)
	as
	(select tbl1.Access, UserRoleName
	from 
	(
	SELECT  Access, AccessValue,UserRoleName
	FROM   
		(SELECT UserRoleName, IsDUMakerDocumentation, IsDUMakerValuation, IsDisbMaker,IsDisbChecker,  IsRCOMaker, IsRCOChecker, IsTBOMaker, IsTBOChecker, IsMortgageAdmin,IsITAdminApplication,  IsITAdminSecurity
		FROM InternalUserRole) p  
	UNPIVOT  
		(AccessValue FOR Access IN   
			(IsDUMakerDocumentation, IsDUMakerValuation, IsDisbMaker,IsDisbChecker,  IsRCOMaker, IsRCOChecker, IsTBOMaker, IsTBOChecker, IsMortgageAdmin,IsITAdminApplication,  IsITAdminSecurity)  
	)AS unpvt 
	) tbl1 
	where tbl1.AccessValue = 1
	)  
	,
	cte2 (Access,UserName) as
	(		
		select tbl1.Access, UserName
		from 
		(
		SELECT  Access, AccessValue,UserName
		FROM   
			(SELECT UserName, IsDUMakerDocumentation, IsDUMakerValuation, IsDisbMaker,IsDisbChecker,  IsRCOMaker, IsRCOChecker, IsTBOMaker, IsTBOChecker, IsMortgageAdmin,IsITAdminApplication,  IsITAdminSecurity
			FROM InternalUserRole r
			inner join UserRoleMetric m on m.UserRoleID = r.UserRoleID
			) p  
		UNPIVOT  
			(AccessValue FOR Access IN   
				(IsDUMakerDocumentation, IsDUMakerValuation, IsDisbMaker,IsDisbChecker,  IsRCOMaker, IsRCOChecker, IsTBOMaker, IsTBOChecker, IsMortgageAdmin,IsITAdminApplication,  IsITAdminSecurity)  
		)AS unpvt  
		) tbl1 
		where tbl1.AccessValue = 1
		group by tbl1.Access, UserName
	)	
	select
		stuff(t1.Access,1,2,'') + 'Access' as NamedColumnName,
		--t1.Access,
		stuff((
			select ',' + t.UserRoleName
			from cte1 t
			where t.Access = t1.Access
			order by t.UserRoleName
			for xml path('')
		),1,1,'') as RoleList		
		,
		stuff((
			select ',' + t.UserName
			from cte2 t
			where t.Access = t1.Access
			order by t.UserName
			for xml path('')
		),1,1,'') as NameList		
	from cte t1
	left join cte2 t2 on t2.Access= t1.Access	
	left join cte2 t3 on t2.Access= t1.Access	
	group by t1.Access

end 





/*
select Access, 
		stuff((
		select ',' + t.UserName
		from cte3 t
		where t.Access = t1.Access
		order by t.UserName
		for xml path('')
	),1,1,'') as NameList
	from cte3 t1
--left join cte t2 on t2.Access= t1.Access	
--where t1.Access= t2.Access
group by t1.Access
*/

GO
