/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : KATZENJAMMER-count.sql

* Purpose :

* Creation Date : 12-11-2017

* Last Modified : Sun 12 Nov 2017 05:27:37 PM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use katzenjammer
--- Q1
SELECT bd.Firsname, COUNT(vc.VocalType)
FROM Vocals vc
	JOIN Band bd
		ON vc.Bandmate = bd.Id
WHERE vc.VocalType = "lead"
GROUP BY vc.Bandmate
ORDER BY COUNT(vc.VocalType) DESC;

--- Q2
SELECT bd.Firsname, COUNT(DISTINCT Instrument)
FROM Instruments it
	JOIN Tracklists tl
		ON it.Song = tl.Song
	JOIN Albums al
		ON tl.Album = al.AId
	JOIN Band bd
		ON it.Bandmate = bd.Id
WHERE al.Title = "Le Pop"
GROUP BY it.Bandmate;

--- Q3
SELECT pf.StagePosition, COUNT(pf.StagePosition) AS timesAtPosition
FROM Performance pf
	JOIN Band bd
		ON pf.Bandmate = bd.Id
WHERE bd.Firsname = "Turid"
GROUP BY pf.StagePosition
ORDER BY timesAtPosition ASC;


--- Q4
SELECT bd2.Firsname, COUNT(*)
FROM Performance pf
	JOIN Band bd
		ON pf.Bandmate = bd.Id
		AND bd.Firsname = "Anne-Marit"
		AND pf.StagePosition = "left"
	JOIN Instruments it
		ON pf.Song = it.Song
	JOIN Band bd2
		ON it.Bandmate = bd2.Id
		AND bd2.Firsname != "Anne-Marit"
WHERE it.Instrument = "bass balalaika"
GROUP BY bd2.Firsname
ORDER BY bd2.Firsname;

--- Q5
SELECT Instrument
FROM Instruments
GROUP BY Instrument
HAVING COUNT(DISTINCT Bandmate) > 2
ORDER BY Instrument;

--- Q6
SELECT bd.Firsname, COUNT(*)
FROM Instruments it1
	JOIN Instruments it2
		ON it1.Song = it2.Song
		AND it1.Bandmate = it2.Bandmate
		AND it1.Instrument != it2.Instrument
	JOIN Band bd
		ON it1.Bandmate = bd.Id
GROUP BY bd.Id
ORDER BY bd.Firsname;




