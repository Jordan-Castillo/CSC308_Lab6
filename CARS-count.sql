/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : CARS-count.sql

* Purpose :

* Creation Date : 10-11-2017

* Last Modified : Sat 11 Nov 2017 01:03:28 AM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use cars
--- Q1
SELECT cm.Maker, MAX(cd.MPG), ROUND(AVG(Accelerate), 2) AS avgAcceleration
FROM cardata cd
	JOIN makes mk
		ON cd.Id = mk.Id
	JOIN carmakers cm
		ON mk.Model = cm.Maker
	JOIN countries cr
		ON cm.Country = cr.Id
WHERE cr.Name = "japan"
GROUP BY cm.Id
ORDER BY MAX(cd.MPG) ASC;

--- Q2
SELECT cm.Maker, COUNT(cm.Id)
FROM cardata cd
   JOIN makes mk
      ON cd.Id = mk.Id
   JOIN carmakers cm
      ON mk.Model = cm.Maker
   JOIN countries cr
      ON cm.Country = cr.Id
WHERE cr.Name = "usa"
	AND cd.Cylinders = 4
	AND cd.Weight < 4000
	AND cd.Accelerate < 14
GROUP BY cm.Id
ORDER BY COUNT(cm.Id) DESC;

--- Q3
SELECT cd2.Year, MAX(cd2.MPG), MIN(cd2.MPG), AVG(cd2.MPG)
FROM cardata cd1
   JOIN makes mk1
		ON cd1.Id = mk1.Id
		AND mk1.Model = "honda"
	JOIN cardata cd2
		ON cd1.Year = cd2.Year
	JOIN makes mk2
		ON cd2.Id = mk2.Id
		AND mk2.Model = "toyota"
GROUP BY cd1.Year
HAVING COUNT(DISTINCT mk1.Make) > 2
ORDER BY cd2.Year;

--- Q4
SELECT cd.Year, MAX(EDispl), MIN(EDispl)
FROM cardata cd
   JOIN makes mk
      ON cd.Id = mk.Id
   JOIN carmakers cm
      ON mk.Model = cm.Maker
   JOIN countries cr
      ON cm.Country = cr.Id
WHERE cr.Name = "usa"
GROUP BY cd.Year
HAVING AVG(cd.Horsepower) < 100
ORDER BY cd.Year;





