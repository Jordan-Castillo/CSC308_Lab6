/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : STUDENTS-count.sql

* Purpose :

* Creation Date : 10-11-2017

* Last Modified : Fri 10 Nov 2017 09:03:05 PM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use students
--- Q1)
SELECT tc.Last, tc.First
FROM list ls
	JOIN teachers tc
		ON tc.classroom = ls.classroom
GROUP BY tc.classroom
HAVING COUNT(tc.classroom) = 7
UNION 
SELECT tc.Last, tc.First
FROM list ls
   JOIN teachers tc
      ON tc.classroom = ls.classroom
GROUP BY tc.classroom
HAVING COUNT(tc.classroom) = 8;

--- Q2)
SELECT grade, COUNT(DISTINCT classroom)
FROM list
GROUP BY grade;

--- Q3)
SELECT classroom, COUNT(classroom) 
FROM list
WHERE grade = 0
GROUP BY classroom
ORDER BY COUNT(classroom) DESC;

--- Q4)
SELECT classroom, MAX(LastName)
FROM list
WHERE grade = 4
GROUP BY classroom
ORDER BY classroom;

