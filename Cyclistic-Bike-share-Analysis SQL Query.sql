
--STEP 1: IMPORT ALL THE DATA

SELECT *
FROM SQLTutorial..jan2022

SELECT *
FROM SQLTutorial..feb2022

SELECT *
FROM SQLTutorial..march2022

SELECT *
FROM SQLTutorial..april2022

SELECT *
FROM SQLTutorial..may2022

SELECT *
FROM SQLTutorial..june2022

SELECT *
FROM SQLTutorial..july2022

SELECT *
FROM SQLTutorial..aug2022

SELECT *
FROM SQLTutorial..sept2022

SELECT *
FROM SQLTutorial..oct2022

SELECT *
FROM SQLTutorial..nov2022

SELECT *
FROM SQLTutorial..dec2022

--STEP 2: CHECK THE DATATYPE OF ALL THE IMPORTED DATA 

--STEP 3: DATA CLEANING; CHANGE THE NECESSARY DATATYPE

ALTER TABLE april2022
ALTER COLUMN start_station_id NVARCHAR(255) NULL;

ALTER TABLE dec2022
ALTER COLUMN end_station_id NVARCHAR(255) NULL;

ALTER TABLE july2022
ALTER COLUMN start_station_id NVARCHAR(255) NULL;

ALTER TABLE nov2022
ALTER COLUMN start_station_id NVARCHAR(255) NULL;

ALTER TABLE nov2022
ALTER COLUMN end_station_id NVARCHAR(255) NULL;

ALTER TABLE oct2022
ALTER COLUMN start_station_id NVARCHAR(255) NULL;

ALTER TABLE sept2022
ALTER COLUMN end_station_id NVARCHAR(255) NULL;


-- STEP 4: JOIN ALL THE DATA USING "UNION ALL"

SELECT *
FROM PortfolioProject..jan2022
UNION ALL
SELECT *
FROM PortfolioProject..feb2022
UNION ALL
SELECT *
FROM PortfolioProject..march2022
UNION ALL
SELECT *
FROM PortfolioProject..april2022
UNION ALL
SELECT *
FROM PortfolioProject..may2022
UNION ALL
SELECT *
FROM PortfolioProject..june2022
UNION ALL
SELECT *
FROM PortfolioProject..july2022
UNION ALL
SELECT *
FROM PortfolioProject..aug2022
UNION ALL
SELECT *
FROM PortfolioProject..sept2022
UNION ALL
SELECT *
FROM PortfolioProject..oct2022
UNION ALL
SELECT *
FROM PortfolioProject..nov2022
UNION ALL
SELECT *
FROM PortfolioProject..dec2022;

-- STEP 5:CREATE AN EMPTY "bikedata2022" TABLE WITH THE SAME STRUCTURE AS "jan2022"
SELECT *
INTO bikedata2022
FROM PortfolioProject..jan2022
WHERE 1 = 0;

-- STEP 6: IMPORT ALL THE SEPERATE MONTHLY DATA INTO THE "bikedata2022" TABLE

INSERT INTO bikedata2022 SELECT * FROM PortfolioProject..jan2022;
INSERT INTO bikedata2022 SELECT * FROM PortfolioProject..feb2022;
INSERT INTO bikedata2022 SELECT * FROM PortfolioProject..march2022;
INSERT INTO bikedata2022 SELECT * FROM PortfolioProject..april2022;
INSERT INTO bikedata2022 SELECT * FROM PortfolioProject..may2022;
INSERT INTO bikedata2022 SELECT * FROM PortfolioProject..june2022;
INSERT INTO bikedata2022 SELECT * FROM PortfolioProject..july2022;
INSERT INTO bikedata2022 SELECT * FROM PortfolioProject..aug2022;
INSERT INTO bikedata2022 SELECT * FROM PortfolioProject..sept2022;
INSERT INTO bikedata2022 SELECT * FROM PortfolioProject..oct2022;
INSERT INTO bikedata2022 SELECT * FROM PortfolioProject..nov2022;
INSERT INTO bikedata2022 SELECT * FROM PortfolioProject..dec2022;

-- STEP 7: CONFIRM THAT THE DATA HAS BEEN SUCCESSFULLY MERGED

SELECT COUNT(*) AS Totalridecount
FROM PortfolioProject..bikedata2022; 
-- This should give you the total count of rows in bikedata2022

-- VIEW bikedata2022
SELECT TOP 100* 
FROM PortfolioProject..bikedata2022;

-- STEP 8:ADD A NEW COLUMN NAMED "ride_length" TO THE "bikedata2022" TABLE

ALTER TABLE bikedata2022
ADD ride_length FLOAT;

-- UPDATE THE "ride_length" COLUMN WITH THE CALCULATED VALUES IN MINS

UPDATE bikedata2022
SET ride_length = CAST(DATEDIFF(MINUTE, started_at, ended_at) AS FLOAT);

-- VIEW bikedata2022

SELECT TOP 100 * 
FROM PortfolioProject..bikedata2022;

--STEP 9:ADD A NEW COLUMN "day_of_week" THAT SHOWS THE WEEKDAYS 

ALTER TABLE bikedata2022
ADD day_of_week VARCHAR(20); 

-- UPDATE THE "day_of_week" COLUMN WITH THE CALCULATED VALUES 

UPDATE bikedata2022
SET day_of_week = DATENAME(dw, started_at);

-- VIEW bikedata2022

SELECT TOP 100 * 
FROM PortfolioProject..bikedata2022;

--STEP 10:CHECK FOR DUPLICATE DATA, AND DELETE IF THERE IS ANY

SELECT ride_id, started_at, ended_at, COUNT(*) AS duplicate_count
FROM PortfolioProject..bikedata2022
GROUP BY ride_id, started_at, ended_at
HAVING COUNT(*) > 1;

--STEP 11: TOTAL NUMBER OF RIDES
SELECT COUNT(*) AS TotalRide
FROM PortfolioProject..bikedata2022;

--STEP 12: THE AVERAGE RIDE LENGTH

SELECT AVG(ride_length) AS avg_ride_length
FROM PortfolioProject..bikedata2022;

--STEP 13: MAXIMUM RIDE LENGTH FOR ALL THE CUSTORMERS

SELECT MAX(ride_length) AS max_ride_length
FROM PortfolioProject..bikedata2022;

--  STEP 14: THE HOURLY RIDE COUNT

SELECT
    DATEPART(HOUR, started_at) AS hour_of_day,
    member_casual,
    COUNT(*) AS rental_count
FROM PortfolioProject..bikedata2022
GROUP BY DATEPART(HOUR, started_at), member_casual
ORDER BY rental_count DESC;

--STEP 15: THE WEEKLY RIDE COUNT

SELECT  day_of_week, member_casual, COUNT(*) AS week_count
FROM PortfolioProject..bikedata2022
GROUP BY day_of_week, member_casual
ORDER BY COUNT(*) DESC;

--STEP 16: THE MONTHLY RIDE COUNT

SELECT
    DATENAME(MONTH, started_at) AS month,
    COUNT(*) AS month_count
FROM PortfolioProject..bikedata2022
GROUP BY DATENAME(MONTH, started_at)
ORDER BY COUNT(*) DESC;

--STEP 17: AVERAGE RIDE LENGHT FOR SEPERATE USERS BY WEEKDAYS

SELECT day_of_week,
       member_casual,
       AVG(ride_length) AS average_ride_length
FROM PortfolioProject..bikedata2022
GROUP BY day_of_week, member_casual;

-- STEP 18: TOTAL NUMBER OF RIDES BY USERS

SELECT member_casual, COUNT(*) AS total_rides
FROM PortfolioProject..bikedata2022
GROUP BY member_casual;

--STEP 19: TOTAL NUMBER OF RIDE COUNT BY BIKE TYPE

SELECT rideable_type, COUNT(*) AS RentalCount
FROM PortfolioProject..bikedata2022
GROUP BY rideable_type;


-- STEP 20: CREAT VIEWS TO STORE DATA FOR VISUALIZATION 

-- IT SHOWS THE TOTAL RIDE FOR THE YEAR

CREATE VIEW TotalRide AS 
SELECT COUNT(*) AS TotalRide
FROM PortfolioProject..bikedata2022;

-- IT SHOWS THE AVERAGE BIKE RIDING FOR ALL THE CUSTOMERS

CREATE VIEW AvgRideLength  AS

SELECT AVG(ride_length) AS avg_ride_length
FROM PortfolioProject..bikedata2022;

-- IT SHOWS THE AVERAGE BIKE RIDING FOR DIFFERENT CUSTOMERS

CREATE VIEW UserAvgRideLength  AS

SELECT member_casual, AVG(ride_length) AS avg_ride_length
FROM PortfolioProject..bikedata2022
GROUP BY member_casual;

--IT SHOWS MAXIMUM RIDE LENGTH FOR ALL THE CUSTORMERS

CREATE VIEW MaxRideLength AS

SELECT MAX(ride_length) AS max_ride_length
FROM PortfolioProject..bikedata2022;

--IT SHOWS THE BUSIEST  HOUR OF RIDING

CREATE VIEW BusiestHour AS

SELECT
    DATEPART(HOUR, started_at) AS hour_of_day,
    member_casual,
    COUNT(*) AS rental_count
FROM PortfolioProject..bikedata2022
GROUP BY DATEPART(HOUR, started_at), member_casual;

CREATE VIEW Busiest_Hour AS

SELECT TOP 1
    DATEPART(HOUR, started_at) AS hour_of_day,
    member_casual,
    COUNT(*) AS rental_count
FROM PortfolioProject..bikedata2022
GROUP BY DATEPART(HOUR, started_at), member_casual
ORDER BY rental_count DESC;

-- SHOWS THE DAY OF THE  WEEKDAYS WITH THE HIGHEST RIDE COUNT

CREATE VIEW BusiestWeekDay AS

SELECT  
	day_of_week, member_casual, 
	COUNT(*) AS week_count
FROM PortfolioProject..bikedata2022
GROUP BY day_of_week, member_casual;


CREATE VIEW Busiest_WeekDay AS

SELECT  TOP 1 
	day_of_week, member_casual, 
	COUNT(*) AS week_count
FROM PortfolioProject..bikedata2022
GROUP BY day_of_week, member_casual
ORDER BY week_count DESC;

--SHOWS THE MONTH WITH THE HIGHEST RIDE COUNT

CREATE VIEW BusiestMonths AS

SELECT
	member_casual,
    DATENAME(MONTH, started_at) AS month,
    COUNT(*) AS month_count
FROM PortfolioProject..bikedata2022
GROUP BY member_casual, DATENAME(MONTH, started_at);


CREATE VIEW Busiest_Months AS

SELECT TOP 1
	member_casual,
    DATENAME(MONTH, started_at) AS month,
    COUNT(*) AS month_count
FROM PortfolioProject..bikedata2022
GROUP BY member_casual, DATENAME(MONTH, started_at)
ORDER BY month_count DESC;

--SHOWS THE AVERAGE RIDE LENGHT FOR SEPERATE USERS BY WEEKDAYS

CREATE VIEW AvgWeeklyRideLength AS

SELECT day_of_week,
       member_casual,
       AVG(ride_length) AS average_ride_length
FROM PortfolioProject..bikedata2022
GROUP BY day_of_week, member_casual;

-- SHOWS TOTAL NUMBER OF RIDES BY USERS

CREATE VIEW TotalRidesByUsers AS

SELECT member_casual, COUNT(*) AS total_rides
FROM PortfolioProject..bikedata2022
GROUP BY member_casual;


--SHOWS THE TOTAL NUMBER OF RIDE COUNT BY BIKE TYPE

CREATE VIEW TotalRideCountByBikeTypes AS

SELECT member_casual, rideable_type, COUNT(*) AS RentalCount
FROM PortfolioProject..bikedata2022
GROUP BY member_casual, rideable_type;


CREATE VIEW MostUsedBikeType AS

SELECT TOP 1
	rideable_type, 
	COUNT(*) AS RentalCount
FROM PortfolioProject..bikedata2022
GROUP BY rideable_type
ORDER BY RentalCount DESC;