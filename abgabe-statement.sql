-- Abgabe Statement

-- Summe an Aufwänden pro OAP Level 1 pro User
SELECT 
	ap.LVL1ID as 'Oberarbeitspaket', 
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
GROUP BY ap.LVL1ID, ma.Name
ORDER BY ma.Name, ap.StringID ASC;

-- Summe an Aufwänden pro OAP Level 2 pro User
SELECT 
	CONCAT(ap.LVL1ID, '.', ap.LVL2ID) as 'Oberarbeitspaket', 
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
GROUP BY CONCAT(ap.LVL1ID, '.', ap.LVL2ID), ma.Name
ORDER BY ma.Name, ap.StringID ASC;

-- Summe pro AP pro User

SELECT 
	CONCAT(ap.StringID, ' ', ap.Name) as 'Arbeitspaket', 
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
GROUP BY ap.StringID, ma.Name
ORDER BY ma.Name ASC;

-- Summe pro Mitarbeiter pro woche
SELECT
	CONCAT( ma.Vorname, ' ', ma.Name ) as 'Mitarbeitername', 	
	WEEKOFYEAR(au.Datum) as 'Woche',
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
GROUP BY WEEKOFYEAR(au.Datum), ma.Name
ORDER BY ma.Name, au.Datum ASC;

-- Summe pro Woche
SELECT
	WEEKOFYEAR(au.Datum) as 'Woche',
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
GROUP BY WEEKOFYEAR(au.Datum)
ORDER BY au.Datum ASC;

-- Summe pro AP

SELECT 
	CONCAT(ap.StringID, ' ', ap.Name) as 'Arbeitspaket', 
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
GROUP BY ap.StringID
ORDER BY SUM(au.Aufwand) DESC;

-- Summe an Aufwänden pro OAP
SELECT 
	ap.LVL1ID as 'Oberarbeitspaket', 
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
GROUP BY ap.LVL1ID
ORDER BY SUM(au.Aufwand) DESC;