/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : CSU-count.sql

* Purpose :

* Creation Date : 11-11-2017

* Last Modified : Tue 14 Nov 2017 12:49:18 AM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use csu
-- Q1
SELECT cp.Campus, SUM(fs.fee)
FROM campuses cp, fees fs
WHERE cp.Id = fs.CampusId
	AND fs.Year < 2006 
	AND fs.Year > 1999
GROUP BY cp.Id
HAVING AVG(fs.fee) > 2500 
ORDER BY SUM(fs.fee) ASC;

-- Q2
SELECT cp.Campus, ROUND(AVG(er.Enrolled), 0) AS averageEnrolled, MAX(er.Enrolled), MIN(er.Enrolled)
FROM campuses cp, enrollments er
WHERE cp.Id = er.CampusId
GROUP BY cp.Id
HAVING COUNT(DISTINCT er.Year) > 60
ORDER BY AVG(er.Enrolled);

-- Q3
SELECT cp.Campus, SUM(dg.degrees)
FROM campuses cp, degrees dg
WHERE cp.Id = dg.CampusId
	AND (dg.year > 1997)
	AND (dg.year < 2003)
	AND (cp.County = "Los Angeles" OR cp.County = "Orange")
GROUP BY cp.Id
ORDER BY SUM(dg.degrees) DESC;

-- Q4
SELECT cp.Campus, COUNT(de.Gr)
FROM campuses cp
	JOIN enrollments er
		ON cp.Id = er.CampusId
	JOIN discEnr de
		ON cp.Id = de.CampusId
WHERE er.Year = de.Year
	AND er.Year = 2004
	AND er.Enrolled > 20000
	AND de.Gr > 0
GROUP BY cp.Id
ORDER BY cp.Campus;


