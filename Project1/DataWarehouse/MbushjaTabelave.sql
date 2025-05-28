INSERT INTO country_continent (CountryCode, Continent)
SELECT e.Country, c.Name
FROM mondial.encompasses e
JOIN mondial.continent c ON e.Continent = c.Name;


INSERT INTO Dim_Country (CountryID, CountryName, Population)
SELECT Code, Name, Population
FROM mondial.country;


INSERT INTO Dim_Continent (ContinentID, Area)
SELECT DISTINCT Name, Area
FROM mondial.continent;

INSERT INTO Dim_Religion (ReligionName)
SELECT DISTINCT Name FROM mondial.religion;