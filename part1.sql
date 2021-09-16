#How many airplanes have listed speeds? What is the minimum listed speed and the maximum listed speed? 
SELECT COUNT(speed) FROM planes;
SELECT MAX(speed) FROM planes;
SELECT MIN(speed) FROM planes;

#What is the total distance flown by all of the planes in January 2013? 
SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance' FROM flights
	WHERE (year = 2013 AND month = 1);


#What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance' FROM flights
	WHERE (year = 2013 AND month = 1)
    AND tailnum IS NULL;


#What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare? 

SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance', manufacturer AS 'Manufacturer'
FROM flights
INNER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)
GROUP BY manufacturer;

SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance', manufacturer AS 'Manufacturer'
FROM flights
LEFT OUTER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)
GROUP BY manufacturer;

#Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database.
SELECT COUNT(*) AS 'Number of Flights', name AS 'Airport', manufacturer AS 'Manufacturer'
FROM flights
LEFT JOIN airports ON flights.dest = airports.faa
LEFT JOIN planes ON flights.tailnum = planes.tailnum
WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)
GROUP BY faa, manufacturer;
