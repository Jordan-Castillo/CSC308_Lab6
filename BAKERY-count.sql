/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : BAKERY-count.sql

* Purpose :

* Creation Date : 10-11-2017

* Last Modified : Fri 10 Nov 2017 10:50:51 PM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use bakery
-- Q1
SELECT Flavor, ROUND(AVG(PRICE), 2) AS avgPrice, COUNT(DISTINCT Food)
FROM goods
GROUP BY Flavor
HAVING COUNT(Food) > 3 
ORDER BY avgPrice ASC;

-- Q2
SELECT ROUND(SUM(gd.PRICE * it.Ordinal), 2)
FROM goods gd, items it, receipts rc
WHERE (rc.RNumber = it.Receipt)
	AND (it.Item = gd.GId)
	AND (MONTHNAME(rc.SaleDate) = 'October')
	AND (YEAR(rc.SaleDate) = 2007)
	AND (gd.Food = 'Eclair');

-- Q3
SELECT rc.RNumber, rc.SaleDate, SUM(it.Ordinal), ROUND(SUM(gd.PRICE * it.Ordinal), 2) AS Total
FROM customers cs, goods gd, items it, receipts rc
WHERE (rc.RNumber = it.Receipt)
	AND (rc.Customer = cs.CId)
	AND (it.Item = gd.GId)
	AND (cs.LastName = "STENZ" AND cs.FirstName = "NATACHA")
GROUP BY rc.RNumber
ORDER BY Total DESC;

-- Q4
SELECT rc.SaleDate, COUNT(rc.RNumber), SUM(it.Ordinal), 
			ROUND(SUM(gd.PRICE * it.Ordinal), 2) AS Revenue, DAYNAME(rc.SaleDate)
FROM goods gd, items it, receipts rc
WHERE (rc.RNumber = it.Receipt)
	AND (it.Item = gd.GId)
	AND (DATEDIFF(rc.SaleDate, "2007-10-08") < 7 AND DATEDIFF(rc.SaleDate, "2007-10-08") > -1)
GROUP BY rc.SaleDate
ORDER BY rc.SaleDate;


-- Q5
SELECT rc.SaleDate
FROM items it
	JOIN receipts rc
		ON it.Receipt = rc.RNumber
	JOIN goods gd
		ON it.Item = gd.GId
WHERE (gd.Food = "Tart")
GROUP BY rc.SaleDate
HAVING SUM(it.Ordinal) > 10
ORDER BY rc.SaleDate;
