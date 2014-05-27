-- Selects effort in hours per team member per work package.
SELECT 
	CONCAT(ap.string_id, ' ', ap.name) as 'Arbeitspaket', 
	CONCAT( ma.first_name, ' ', ma.last_name ) as 'Mitarbeitername', 	
	ROUND(SUM(au.effort) * 8, 2) as 'Aufwand in Stunden', 
	GROUP_CONCAT(DISTINCT au.description SEPARATOR '; ') as Beschreibung
FROM 
	work_effort as au 
		left outer join employees ma on ( au.fid_emp = ma.id ) 
		left outer join workpackage ap on ( au.fid_wp = ap.id )
-- Uncomment to restrict output to a certain week.
-- Dateformat: 'YYYY-MM-DD'
-- WHERE 
	-- DATE(au.rec_date) BETWEEN DATE('2014-02-23') AND DATE('2014-03-01')
	
GROUP BY ap.string_id, ma.id
ORDER BY ma.last_name ASC;

-- Selects all work efforts per user per week.

SELECT 
	CONCAT( ma.first_name, ' ', ma.last_name ) as 'Mitarbeitername', 	
	ROUND(SUM( au.effort ) * 8, 2) as 'Aufwand in Stunden' 
FROM 
	work_effort as au 
		left outer join employees ma on ( au.fid_emp = ma.id ) 
		left outer join workpackage ap on ( au.fid_wp = ap.id )

-- Uncomment to restrict output to a certain week.
-- Dateformat: 'YYYY-MM-DD'
-- WHERE 
	-- DATE(au.rec_date) BETWEEN DATE('2014-02-23') AND DATE('2014-03-01')
GROUP BY ma.id
ORDER BY ma.last_name ASC;

-- Selects all work effort for the whole project duration per member.

SELECT 
	CONCAT( ma.first_name, ' ', ma.last_name ) as 'Mitarbeitername', 	
	ROUND(SUM(au.effort) * 8, 2) as 'Aufwand in Stunden' 
FROM 
	work_effort as au 
		left outer join employees ma on ( au.fid_emp = ma.id ) 
		left outer join workpackage ap on ( au.fid_wp = ap.id )
GROUP BY ma.id
ORDER BY ma.last_name ASC;
