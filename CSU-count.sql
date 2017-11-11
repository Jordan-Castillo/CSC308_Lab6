/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : CSU-count.sql

* Purpose :

* Creation Date : 11-11-2017

* Last Modified : Sat 11 Nov 2017 01:21:42 AM STD

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
SELECT 
FROM 
WHERE 

-- Q3
SELECT 
FROM 
WHERE 

-- Q4
SELECT 
FROM 
WHERE 







