
Drop Table IF Exists #dependentobjects
Drop Table IF Exists #not_dependent

SELECT FK.TABLE_NAME AS DependObject
    , PK.TABLE_NAME AS Depends
into #dependentobjects
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS C
INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS FK
    ON C.CONSTRAINT_NAME = FK.CONSTRAINT_NAME
INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS PK
    ON C.UNIQUE_CONSTRAINT_NAME = PK.CONSTRAINT_NAME
		
SELECT name AS Obj
into #not_dependent
FROM sys.objects
WHERE name NOT IN (SELECT DependObject FROM #dependentobjects) 
AND type = 'U' 

--Select * from #dependentobjects
--Select * from #not_dependent

;with recursiveQuery
AS (
    SELECT Obj AS [Table]
        , CAST('' AS VARCHAR(max)) AS hirarchy
        , 0 AS TableLevel -- Level 0 indicate tables with no dependencies
    FROM #not_dependent
 
    UNION ALL
 
    SELECT d.DependObject AS [Table]
        , CAST(IIF(TableLevel > 0, r.hirarchy + ' > ', '') + d.Depends AS VARCHAR(max)) 
        , r.TableLevel + 1 AS TableLevel
    FROM #dependentobjects d
    INNER JOIN recursiveQuery r
        ON d.Depends = r.[Table]
    )
SELECT SCHEMA_NAME(O.schema_id) AS [TableSchema]
    , R.[Table]
    , max(R.TableLevel) as Table_Level
FROM recursiveQuery R
INNER JOIN sys.objects O
    ON R.[Table] = O.name
GROUP BY O.schema_id, R.[Table]
ORDER BY Table_Level, R.[Table]
