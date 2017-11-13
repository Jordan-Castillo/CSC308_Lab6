/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

* File Name : INN-count.sql

* Purpose :

* Creation Date : 11-11-2017

* Last Modified : Sun 12 Nov 2017 12:42:12 PM STD

* Created By :  Jordan Castillo

* Email : jtcastil@calpoly.edu
_._._._._._._._._._._._._._._._._._._._._.*/
use inn
--- Q1
SELECT rm.RoomName, ROUND(SUM(DATEDIFF(Checkout, CheckIn) * Rate), 2) AS Total, 
		ROUND(AVG(DATEDIFF(Checkout, CheckIn) * Rate), 2) AS avgPerStay
FROM reservations rv
	JOIN rooms rm
		ON rv.Room = rm.RoomCode
WHERE (MONTHNAME(CheckIn) = "September"
	OR MONTHNAME(CheckIn) = "October"
	OR MONTHNAME(CheckIn) = "November")
GROUP BY rm.RoomName
ORDER BY Total DESC;

--- Q2
SELECT COUNT(*), ROUND(SUM(DATEDIFF(Checkout, CheckIn) * Rate), 2) AS Total
FROM reservations 
WHERE DAYNAME(CheckIn) = "Friday";



--- Q3
SELECT DAYNAME(CheckIn), COUNT(DAYNAME(CheckIn)) AS numReservations,
		ROUND(SUM(DATEDIFF(Checkout, CheckIn) * Rate), 2) AS Total
FROM reservations
GROUP BY DAYNAME(CheckIn)
ORDER BY DAYNAME(CheckIn) = "Sunday", DAYNAME(CheckIn) = "Saturday",
			DAYNAME(CheckIn) = "Friday", DAYNAME(CheckIn) = "Thursday",
			DAYNAME(CheckIn) = "Wednesday", DAYNAME(CheckIn) = "Tuesday",
			DAYNAME(CheckIn) = "Monday";

--- Q4
SELECT rm.RoomName, ROUND(MAX(rs.Rate - rm.basePrice), 2) AS highestMarkup,
		 ROUND(MAX(rm.basePrice - rs.Rate), 2) AS highestMarkdown
FROM reservations rs
	JOIN rooms rm
		ON rs.Room = rm.RoomCode
GROUP BY rs.Room
ORDER BY highestMarkup DESC;

--- Q5
SELECT rm.RoomCode, rm.RoomName,
		SUM(DATEDIFF(Checkout, CheckIn)) - (DATEDIFF(Checkout, "2011-01-01") * SIGN(YEAR(Checkout) - 2010)) AS totalDays2010
FROM reservations rs
   JOIN rooms rm
      ON rs.Room = rm.RoomCode
GROUP BY rs.Room;


