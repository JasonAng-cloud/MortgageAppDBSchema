/****** Object:  StoredProcedure [dbo].[usp_ws_getNewLI]    Script Date: 7/9/2020 12:28:38 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_getNewLI]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_getNewLI]
GO
/****** Object:  StoredProcedure [dbo].[usp_ws_getNewLI]    Script Date: 7/9/2020 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[usp_ws_getNewLI]

as

begin

       declare @CDC nvarchar(max), @sql nvarchar(max), @NewCDC datetime 

       --declare @CurentDt nvarchar(max)


       --set @CurentDt = getdate()        

		--update tblCDC
		--set tempLICDC = @CurentDt		
 
		--select @CDC='2019-03-10'

       select @CDC= newLICDC

       from tblCDC

 

       declare @VersionTblName nvarchar(max)

 

       select @VersionTblName= [VersionTblName]	   	   
       FROM [EDMSDBSERVER].[HLBB_DMS].[dbo].[TblDocProfile]
       where ProfileName = 'MG-Mortgage'

	   
set @sql = '
	select top 1 @NewCDC = DateModified
		from [EDMSDBSERVER].[HLBB_DMS].[dbo].' + @VersionTblName + ' tbl
		inner join (
					select RecID, max(version) as version
					from [EDMSDBSERVER].[HLBB_DMS].[dbo].'+ @VersionTblName +'
					where field6=  ''CRA01 Lttr of Instruction''
					group by RecID
					) temp on temp.RecID = tbl.RecID and tbl.Version = temp.version
		where tbl.DateCreated > @CDC 			
				
		order by DateModified desc'
		
	--and tbl.field3 COLLATE Latin1_General_CI_AS not in (select arn COLLATE Latin1_General_CI_AS from SQLLOADS) 
    EXECUTE sp_executesql @SQL, N'@CDC NVARCHAR(max),@NewCDC datetime OUTPUT' , @CDC  , @NewCDC OUTPUT
 

	TRUNCATE TABLE LOADS_NEW_LI_STAGING

       set @sql = '
	   insert into LOADS_NEW_LI_STAGING (RowNumber,ARN)
	   select ROW_NUMBER() OVER(ORDER BY tbl100.arn ASC) AS RowNumber,tbl100.arn
       from (
		   select distinct tbl.field3 as [ARN]
		   from [EDMSDBSERVER].[HLBB_DMS].[dbo].' + @VersionTblName + ' tbl
		   inner join (
					 select RecID, max(version) as version
					 from [EDMSDBSERVER].[HLBB_DMS].[dbo].'+ @VersionTblName +'
					 where field6=  ''CRA01 Lttr of Instruction''
					 group by RecID
					 ) temp on temp.RecID = tbl.RecID and tbl.Version = temp.version
		   where tbl.DateCreated > @CDC 
				  
			) tbl100' 
	--and tbl.field3 COLLATE Latin1_General_CI_AS not in (select arn COLLATE Latin1_General_CI_AS from SQLLOADS) 
       EXECUTE sp_executesql @SQL, N'@CDC NVARCHAR(max)', @CDC  
		
		if (@NewCDC	<> '' or @NewCDC is not null)
		begin
			update tblCDC
			set tempLICDC = @NewCDC	
		end 
		/*
		if exists 
		(
			select 1 
			from LOADS_NEW_LI_STAGING
		)
		begin
			
			select top 1 @NewCDC = edms_lastmodifieddate			
			from LOADS_NEW_LI_STAGING
			order by edms_lastmodifieddate desc 
			

			update tblCDC
			set tempLICDC = @NewCDC		
		end 
		*/
		select RowNumber,ARN from LOADS_NEW_LI_STAGING

end



GO
