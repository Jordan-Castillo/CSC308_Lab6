/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : WINE-count.sql

* Purpose :

* Creation Date : 11-11-2017

* Last Modified : Tue 14 Nov 2017 12:45:35 AM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use wine
--- Q1
SELECT Score, ROUND(AVG(Price), 2) AS avgPrice, MIN(Price), MAX(Price), COUNT(Score), SUM(Cases)
FROM wine 
WHERE Score > 88
GROUP BY Score 
ORDER BY Score;

--- Q2
SELECT wn.Vintage, COUNT(wn.Vintage)
FROM wine wn
	JOIN grapes gp
		ON wn.Grape = gp.Grape
WHERE gp.Color = "Red"
	AND (wn.Appellation = "Sonoma County")
	AND (wn.Score > 89)
GROUP BY wn.Vintage
ORDER BY wn.Vintage;

--- Q3
SELECT wn.Appellation, ap.County, COUNT(*),
		 ROUND(AVG(wn.Price), 2) AS avgPrice, SUM(wn.Cases * 12) AS totalBottles
FROM wine wn
	JOIN appellations ap
		ON wn.Appellation = ap.Appellation
WHERE wn.Vintage = 2007
	AND wn.Grape = "Cabernet Sauvingnon"
GROUP BY wn.Appellation
HAVING COUNT(*) >= 2;

--- Q4
SELECT wn.Appellation, SUM(wn.PRICE * wn.Cases * 12) AS totalPossibleRevenue
FROM wine wn
	JOIN appellations ap
		ON wn.Appellation = ap.Appellation
WHERE ap.Area = "Central Coast"
	AND wn.Vintage = 2008
GROUP BY wn.Appellation
ORDER BY totalPossibleRevenue DESC;

--- Q5
SELECT ap.County, MAX(wn.Score)
FROM wine wn
   JOIN appellations ap
      ON wn.Appellation = ap.Appellation
	JOIN grapes gp
		ON wn.Grape = gp.Grape
WHERE ap.County != "N/A"
	AND wn.Vintage = 2009
	AND gp.Color = "Red"
GROUP BY ap.County
ORDER BY MAX(wn.Score) DESC;



