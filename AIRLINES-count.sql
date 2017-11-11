/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : AIRLINES-count.sql

* Purpose :

* Creation Date : 11-11-2017

* Last Modified : Sat 11 Nov 2017 03:23:17 PM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use airlines
--- Q1
SELECT ap.Code, ap.Name
FROM airports ap
	JOIN flights fl
		ON ap.Code = fl.Source
GROUP BY ap.Code
HAVING COUNT(ap.Code) = 17
ORDER BY ap.Code;

--- Q2
SELECT COUNT(DISTINCT fl1.Source)
FROM flights fl1
	JOIN flights fl2
		ON fl1.Destination = fl2.Source
WHERE fl2.Destination = "ANP"
	AND fl1.Source != "ANP"
	AND fl1.Destination != "ANP"
	AND fl2.Source != "ANP";

--- Q3
SELECT COUNT(DISTINCT fl1.Source)
FROM flights fl1
   JOIN flights fl2
      ON fl1.Destination = fl2.Source
WHERE (fl2.Destination = "ATE"
   AND fl1.Source != "ATE"
   AND fl1.Destination != "ATE"
   AND fl2.Source != "ATE")
OR (fl1.Source != "ATE"
	AND fl1.Destination = "ATE");

--- Q4
SELECT al.Name, COUNT(DISTINCT fl.Source) AS numAirports
FROM flights fl
	JOIN airlines al
		ON al.Id = fl.Airline
GROUP BY al.Id
ORDER BY numAirports DESC;

