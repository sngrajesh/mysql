Use covid;
-- A. Covid-Data-Global :
-- 	1. To find out the death percentage locally and globally
SELECT Country, (TotalDeaths/Population)*100 
AS Local_Deaths_Percentage 
FROM worldometer_data;

SELECT Continent , SUM(TotalDeaths)/SUM(Population)*100 
AS Global_Death_Percentage 
FROM worldometer_data
GROUP BY Continent
ORDER BY Global_Death_Percentage;

SELECT SUM(TotalDeaths)/SUM(Population)*100 
AS Global_Death_Percentage 
FROM worldometer_data;


-- 	2. To find out the infected population percentage locally and globally
SELECT Country, (TotalCases/Population)*100 
AS Local_Infection_Percentage 
FROM worldometer_data;

SELECT Continent , SUM(TotalCases)/SUM(Population)*100 
AS Continent_Infection_Percentage 
FROM worldometer_data
GROUP BY Continent
ORDER BY Continent_Infection_Percentage;

SELECT SUM(TotalCases)/SUM(Population)*100 
AS Global_Infection_Percentage 
FROM worldometer_data;

-- 	3. To find out the countries with the highest infection rates
SELECT Country, (TotalCases/Population)*100 
AS Local_Infection_Percentage 
FROM worldometer_data
ORDER BY Local_Infection_Percentage 
DESC LIMIT 5;

-- 	4. To find out the countries and continents with the highest death counts
SELECT Country, TotalDeaths  
FROM worldometer_data
ORDER BY TotalDeaths DESC 
LIMIT 5;

SELECT Continent, Sum(TotalDeaths) as Total_Death_in_Continent
FROM worldometer_data
GROUP BY Continent
ORDER BY Total_Death_in_Continent DESC;

-- 	5. Average number of deaths by day (Continents and Countries)
SELECT country, AVG(daily_new_deaths) AS average_daily_deaths
FROM worldometer_coronavirus_daily_data 
GROUP BY country;


SELECT 
  Continent, 
  AVG(TotalDeaths) AS AverageTotalDeaths, 
  AVG(NewDeaths) AS AverageDailyDeaths
FROM worldometer_data
GROUP BY Continent;

-- 	6. Average of cases divided by the number of population of each country (TOP 10)
SELECT Country, (SELECT AVG(TotalCases) FROM worldometer_data)/Population 
FROM worldometer_data;

-- B. Using JOINS to combine the covid_deaths and covid_vaccine tables :

-- 	1. To find out the population vs the number of people vaccinated

-- 	2. To find out the percentage of different vaccine taken by people in acountry

-- 	3. To find out percentage of people who took both the doses

-- C. Additonal Practice Problems with different types of joins with more than 2 tables
