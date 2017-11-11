/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : MARATHON-count.sql

* Purpose :

* Creation Date : 11-11-2017

* Last Modified : Sat 11 Nov 2017 02:23:50 PM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use marathon
--- Q1
SELECT AgeGroup, Sex, COUNT(Sex) AS numMembers, MIN(Place) AS bestPlace, MAX(Place) AS worstPlace
FROM marathon
GROUP BY AgeGroup, Sex
ORDER BY AgeGroup, Sex;

--- Q2
SELECT COUNT(*)
FROM marathon m1
	JOIN marathon m2
		ON m1.AgeGroup = m2.AgeGroup
		AND m1.Sex = m2.Sex
WHERE m1.State = m2.State
	AND m1.GroupPlace = 1
	AND m2.GroupPlace = 2;

--- Q3
SELECT MINUTE(Pace), COUNT(Pace)
FROM marathon
GROUP BY MINUTE(Pace);

--- Q4) At first, I split the list by gender, but based on the prompt, I only deliver one tuple per state
SELECT State, COUNT(*) AS Total
FROM marathon
WHERE GroupPlace < 11
GROUP BY State
HAVING MIN(GroupPlace) < 11
ORDER BY Total DESC;

--- Q5
SELECT Town, ROUND(AVG(TIME_TO_SEC(RunTime)), 0) AS avgTime
FROM marathon
WHERE State = "CT"
GROUP BY Town
HAVING COUNT(Town) > 2
ORDER BY avgTime ASC;


