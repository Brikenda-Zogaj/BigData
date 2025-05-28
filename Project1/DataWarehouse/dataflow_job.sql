-- dataflow_job.sql

-- Rifresko të dhënat në Dim_Country
TRUNCATE TABLE DWH_mondial.Dim_Country;
INSERT INTO DWH_mondial.Dim_Country (CountryID, CountryName, Population)
SELECT Code, Name, Population
FROM mondial.country;

-- Rifresko të dhënat në Dim_Continent
TRUNCATE TABLE DWH_mondial.Dim_Continent;
INSERT INTO DWH_mondial.Dim_Continent (ContinentID, Area)
SELECT DISTINCT Name, Area
FROM mondial.continent;

-- Rifresko të dhënat në Dim_Religion
TRUNCATE TABLE DWH_mondial.Dim_Religion;
INSERT INTO DWH_mondial.Dim_Religion (ReligionName)
SELECT DISTINCT Name FROM mondial.religion;

-- Rifresko të dhënat në country_continent
TRUNCATE TABLE DWH_mondial.country_continent;
INSERT INTO DWH_mondial.country_continent (CountryCode, Continent)
SELECT e.Country, c.Name
FROM mondial.encompasses e
JOIN mondial.continent c ON e.Continent = c.Name;
