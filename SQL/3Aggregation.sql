-- 1 Revising Aggregations - The Count Function
SELECT COUNT(ID) FROM CITY WHERE POPULATION > 100000;

-- 2 Revising Aggregations - The Sum Function
SELECT SUM(POPULATION) FROM CITY WHERE DISTRICT = "California";

-- 3 Revising Aggregations - Averages
SELECT AVG(POPULATION) FROM CITY WHERE DISTRICT = "California";

-- 4 Average Population
SELECT ROUND(AVG(POPULATION)) FROM CITY;

-- 5 Japan Population
SELECT SUM(POPULATION) FROM CITY WHERE COUNTRYCODE = "JPN";

-- 6 Population Density Difference
SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY;

-- 7 The Blunder
SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary, "0", ""))) FROM EMPLOYEES;

-- 8 Top Earners
SELECT months * salary AS earnings, COUNT(employee_id ) FROM Employee 
    GROUP BY earnings ORDER BY earnings DESC LIMIT 1;

-- 9 Weather Observation Station 2
SELECT ROUND(SUM(LAT_N ), 2), ROUND(SUM(LONG_W  ), 2) FROM STATION;

-- 10 Weather Observation Station 13
SELECT TRUNCATE(SUM(LAT_N ), 4) FROM STATION WHERE LAT_N > 38.788 AND LAT_N < 137.2345;

-- 11 Weather Observation Station 14
SELECT TRUNCATE(MAX(LAT_N ), 4) FROM STATION WHERE LAT_N < 137.2345;

-- 12 Weather Observation Station 15
SELECT ROUND(LONG_W, 4) FROM STATION WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);
#SELECT ROUND(LONG_W, 4) FROM STATION WHERE LAT_N < 137.2345 ORDER BY LAT_N DESC LIMIT 1;

-- 13 Weather Observation Station 16
SELECT ROUND(MIN(LAT_N ), 4) FROM STATION WHERE LAT_N > 38.778;

-- 14 Weather Observation Station 17
SELECT ROUND(LONG_W, 4) FROM STATION WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.778);
#SELECT ROUND(LONG_W, 4) FROM STATION WHERE LAT_N > 38.778 ORDER BY LAT_N LIMIT 1;

-- 15 Weather Observation Station 18
SELECT ROUND(MAX(LAT_N) + MAX(LONG_W) - MIN(LAT_N) - MIN(LONG_W), 4) FROM STATION;
#SELECT ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 4) FROM STATION;

-- 16 Weather Observation Station 19
SELECT ROUND(SQRT(POWER(MAX(LAT_N) - MIN(LAT_N), 2) + POWER(MAX(LONG_W) - MIN(LONG_W), 2)), 4) FROM STATION;

-- 17 Weather Observation Station 20
SELECT COUNT(ID) FROM STATION INTO @nbRows;
SELECT ROUND(AVG(LAT_N), 4) FROM (
    SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS numRow
      FROM STATION
    ) t
  WHERE numRow IN (FLOOR((@nbRows + 1) / 2), FLOOR((@nbRows + 2) / 2));