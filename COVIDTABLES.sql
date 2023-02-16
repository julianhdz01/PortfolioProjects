SELECT *
FROM portfolio-375717.covid_data.covid_pop
WHERE continent is not null
ORDER BY 1,2

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM portfolio-375717.covid_data.covid_pop
ORDER BY 1,2


-- TOTAL CASES V TOTAL DEATHS

SELECT location, date, total_cases, total_deaths, (Total_deaths/total_cases)*100 as DeathPercentage
FROM portfolio-375717.covid_data.covid_pop
WHERE continent is not null
ORDER BY 1,2


-- Use for Tableau

SELECT SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
FROM portfolio-375717.covid_data.covid_pop
WHERE continent is not null
ORDER BY 1,2

-- TOTAL CASES V POPULATION

SELECT location, date, population, total_cases, (total_cases/population)*100 as CovidPopulationPercent
FROM portfolio-375717.covid_data.covid_pop
WHERE location = 'United States'
and continent is not null
ORDER BY 1,2

-- COUNTRIES WIHT HIGHEST INFECTION RATE V POPULATION

SELECT location, population, max(total_cases) as HighestRate, max((total_cases/population))*100 as CovidPopulationPercent
FROM portfolio-375717.covid_data.covid_pop
WHERE continent is not null
GROUP BY location, population
ORDER BY CovidPopulationPercent desc


-- COUNTRIES WITH HIGHEST DEATH COUNT BY POPULATION


SELECT location, max(total_deaths) as TotalDeathCount
FROM portfolio-375717.covid_data.covid_pop
WHERE continent is not null
GROUP BY location
ORDER BY TotalDeathCount desc


-- BY CONTINENT

-- CONTINENTS WITH HIGHEST DEATH COUNT


SELECT continent, max(total_deaths) as TotalDeathCount
FROM portfolio-375717.covid_data.covid_pop
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount desc


-- GLOBAL NUMBERS

SELECT date, sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, sum(new_deaths)/sum(new_cases)*100 as DeathPercentage
FROM portfolio-375717.covid_data.covid_pop
WHERE continent is not null
GROUP BY date
ORDER BY 1,2


-- TOTAL POPULATION V VACCINATIONS


SELECT POP.continent, POP.location, POP.date, POP.population, VACS.new_vaccinations
FROM portfolio-375717.covid_data.covid_pop POP
JOIN portfolio-375717.covid_data.covid_vacs  VACS
  ON POP.location = VACS.location
  and POP.location = VACS.location
WHERE POP.continent is not null
ORDER BY 1,2,3



-- Use for Tableau 1

SELECT SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
FROM portfolio-375717.covid_data.covid_pop
WHERE continent is not null
ORDER BY 1,2


-- Table 2

SELECT location, SUM(new_deaths) as TotalDeathCount
FROM portfolio-375717.covid_data.covid_pop
WHERE continent is null
and location not in ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
GROUP BY location
ORDER BY TotalDeathCount desc


-- Table 3

SELECT location, population, max(total_cases) as HighestInfectedcount, max((total_cases/population))*100 as CovidPopulationPercent
FROM portfolio-375717.covid_data.covid_pop
WHERE continent is not null
GROUP BY location, population
ORDER BY CovidPopulationPercent desc

-- table 4

SELECT location, population, date, max(total_cases) as HighestInfectedcount, max((total_cases/population))*100 as CovidPopulationPercent
FROM portfolio-375717.covid_data.covid_pop
GROUP BY location, population, date
ORDER BY CovidPopulationPercent desc