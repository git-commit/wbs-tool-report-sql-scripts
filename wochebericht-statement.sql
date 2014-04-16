SELECT 
	CONCAT(ap.StringID, ' ', ap.Name) as 'Arbeitspaket', 
	CONCAT( ma.Vorname, ' ', ma.Name ) as 'Mitarbeitername', 	
	ROUND(SUM(au.Aufwand) * 8, 2) as 'Aufwand in Stunden', 
	GROUP_CONCAT(DISTINCT au.Beschreibung SEPARATOR '; ') as Beschreibung
FROM 
	Aufwand as au 
		left outer join Mitarbeiter ma on ( au.FID_Ma = ma.Login ) 
		left outer join Arbeitspaket ap on ( 
			au.FID_Proj = ap.FID_Proj AND 
			au.LVL1ID = ap.LVL1ID AND 
			au.LVL2ID = ap.LVL2ID AND 
			au.LVL3ID = ap.LVL3ID AND 
			au.LVLxID = ap.LVLxID )
WHERE 
	DATE(au.Datum) BETWEEN DATE('2014-02-23') AND DATE('2014-03-01')
	-- Dateformat: 'YYYY-MM-DD'
GROUP BY ap.StringID, ma.Name
ORDER BY ma.Name ASC;

SELECT 
	CONCAT( ma.Vorname, ' ', ma.Name ) as 'Mitarbeitername', 	
	ROUND(SUM(au.Aufwand) * 8, 2) as 'Aufwand in Stunden' 
FROM 
	Aufwand as au 
		left outer join Mitarbeiter ma on ( au.FID_Ma = ma.Login ) 
		left outer join Arbeitspaket ap on ( 
			au.FID_Proj = ap.FID_Proj AND 
			au.LVL1ID = ap.LVL1ID AND 
			au.LVL2ID = ap.LVL2ID AND 
			au.LVL3ID = ap.LVL3ID AND 
			au.LVLxID = ap.LVLxID )
WHERE 
	DATE(au.Datum) BETWEEN DATE('2014-02-23') AND DATE('2014-03-01')
	-- Dateformat: 'YYYY-MM-DD'
GROUP BY ma.Name
ORDER BY ma.Name ASC;

SELECT 
	CONCAT( ma.Vorname, ' ', ma.Name ) as 'Mitarbeitername', 	
	ROUND(SUM(au.Aufwand) * 8, 2) as 'Aufwand in Stunden' 
FROM 
	Aufwand as au 
		left outer join Mitarbeiter ma on ( au.FID_Ma = ma.Login ) 
		left outer join Arbeitspaket ap on ( 
			au.FID_Proj = ap.FID_Proj AND 
			au.LVL1ID = ap.LVL1ID AND 
			au.LVL2ID = ap.LVL2ID AND 
			au.LVL3ID = ap.LVL3ID AND 
			au.LVLxID = ap.LVLxID )
GROUP BY ma.Name
ORDER BY ma.Name ASC;
