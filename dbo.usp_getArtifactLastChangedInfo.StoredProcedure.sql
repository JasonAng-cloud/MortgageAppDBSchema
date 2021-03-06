/****** Object:  StoredProcedure [dbo].[usp_getArtifactLastChangedInfo]    Script Date: 7/9/2020 12:28:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getArtifactLastChangedInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getArtifactLastChangedInfo]
GO
/****** Object:  StoredProcedure [dbo].[usp_getArtifactLastChangedInfo]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_getArtifactLastChangedInfo]
as
begin
with cte (type, name, [modify_date],create_date )as (
sELECT 'TABLE' as type, name,  [modify_date],create_date FROM sys.tables
--order by modify_date desc 
union 
SELECT 'SP' as type,name,  modify_date ,create_date
FROM sys.objects
WHERE type = 'P'
--ORDER BY modify_date DESC
union 
SELECT 'FN' as type,name, modify_date ,create_date
FROM sys.objects
WHERE type = 'FN'
)
select * from cte order by modify_date desc 
end 
GO
