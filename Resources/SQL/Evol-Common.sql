﻿/* **  www.evolutility.org - (c) 2009 Olivier Giulieri  ** */
/*    SQL script for generic pagin with Evolutility     */
/*    last updated 9/03/2008 for addition of dbcolumnpk (primary key name)  */
/*
	This file is part of Evolutility CRUD Framework.
	Source link <http://www.evolutility.org/download/download.aspx>

	Evolutility is free software: you can redistribute it and/or modify
	it under the terms of the GNU Affero General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	Evolutility is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU Affero General Public License
	along with Evolutility. If not, see <http://www.gnu.org/licenses/>.
*/

CREATE PROCEDURE EvoSP_PagedItem
	(
	@Select  varchar(1000),
	@Table varchar(200),
	@TableS varchar(800),
	@WhereClause  varchar(2000),
	@OrderBy  varchar(200),
	@pk varchar(50), 
	@Page int,
	@RecsPerPage int	
	)
AS

SET NOCOUNT ON
CREATE TABLE #TempItems ( IDt int IDENTITY, IDo int)
IF (@WhereClause='')
  	INSERT INTO #TempItems (IDo) EXEC('SELECT T.'+@pk+' FROM '+@TableS+'  ORDER BY ' +@OrderBy)
ELSE
	EXEC( 'INSERT INTO #TempItems (IDo) SELECT T.'+@pk+' FROM '+@TableS+'  WHERE ' + @WhereClause+ ' ORDER BY '+@OrderBy)
DECLARE @FirstRec int, @LastRec int
SELECT @FirstRec = (@Page - 1) * @RecsPerPage
SELECT @LastRec = (@Page * @RecsPerPage + 1)
IF (@WhereClause='')
	EXEC( 'SELECT '+@Select + ', MoreRecords = ( SELECT COUNT(*)  FROM #TempItems Temp  WHERE Temp.IDt >= ' 
+ @LastRec + ')  FROM #TempItems Temp,  ' + @TableS  
	+ ' WHERE T.'+@pk+' = Temp.IDo AND Temp.IDt > '+ @FirstRec + ' AND Temp.IDt < '+ @LastRec + '  ORDER BY '+  @OrderBy)
ELSE
	EXEC( 'SELECT '+@Select + ', MoreRecords = ( SELECT COUNT(*)  FROM #TempItems Temp  WHERE Temp.IDt >= ' 
+ @LastRec + ')  FROM #TempItems Temp,  ' + @TableS  
	+ ' WHERE T.'+@pk+' = Temp.IDo AND Temp.IDt > '+ @FirstRec + ' AND Temp.IDt < '+ @LastRec + ' AND ' + @WhereClause+ ' ORDER BY '+  @OrderBy)
SET NOCOUNT OFF

GO


